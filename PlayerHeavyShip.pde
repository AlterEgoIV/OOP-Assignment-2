class PlayerHeavyShip extends PlayerShip
{
  PlayerHeavyShip(char up, char left, char right, char fire)
  {
    pos = new PVector(width / 20.0f, height / 4.0f);
    forward = new PVector(1, 0);
    theta = radians(0.0f);
    c = color(0, 190, 255);
    speed = 2.0f;
    health = 30;
    maxHealth = 30;
  }
  
  void update()
  {
    checkState();
    move();
    fire();
    detectCollisions();
  }
  
  void move()
  {
    forward.x = cos(theta);
    forward.y = sin(theta);
    
    if(keys[UP])
    {
      // forward vector is multiplied by speed and added to pos vector to get our updated position
      pos.add(PVector.mult(forward, speed));
      
      wrapAround();
    }
        
    if(keys[LEFT])
    {
      // Rotates ship to the left
      theta -= .1f;
    }
        
    if(keys[RIGHT])
    {
      // Rotates ship to the right
      theta += .1f;
    } 
  }
  
  void fire()
  {
    if(keys[' '] && ammo > 0 && millis() - elapsed > game.second / 5)
    {
      Bullet bullet = new Bullet();
      
      bullet.pos.x = pos.x;
      bullet.pos.y = pos.y;
      bullet.pos.add(PVector.mult(forward, halfW + 1));
      bullet.theta = theta;
      bullet.speed = speed * 3;
      bullet.c = c;
      bullet.playerProjectile = true;
      
      gameObjects.add(bullet);
      
      ammo--;
      
      elapsed = millis();
    }
  }
  
  void render()
  {
    fill(0);
    stroke(c);
    pushMatrix();
    translate(pos.x, pos.y);
    rotate(theta);
    strokeWeight(3);
    ellipse(0, 0, w, w);
    strokeWeight(1);
    line(-halfW, -halfW, halfW, 0); // Outside Left
    line(-halfW, halfW, halfW, 0); // Outside Right
    line(-halfW, -halfW, 0, 0); // Inside Left
    line(-halfW, halfW, 0, 0); // Inside Right
    popMatrix();
    
    game.healthBarWidth = map(health, 0, maxHealth, 0, game.maxHealthBarWidth);
    game.ammoBarWidth = map(ammo, 0, maxAmmo, 0, game.maxAmmoBarWidth);
    
    stroke(255);
      
    // Player Health Bar
    fill(0);
    rect(0, 0, game.maxHealthBarWidth, game.barHeight);
    fill(0, 200, 0);
    rect(0, 0, game.healthBarWidth, game.barHeight);
      
    // Player Ammo Bar
    fill(0);
    rect(0, game.barHeight, game.maxAmmoBarWidth, game.barHeight);
    fill(200, 0, 0);
    rect(0, game.barHeight, game.ammoBarWidth, game.barHeight);
  }
}
