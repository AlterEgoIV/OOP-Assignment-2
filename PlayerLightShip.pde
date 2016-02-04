class PlayerLightShip extends PlayerShip
{
  PlayerLightShip(char up, char left, char right, char fire)
  {
    pos = new PVector(width / 20.0f, height / 4.0f);
    forward = new PVector(1, 0);   
    theta = radians(0.0f);
    c = color(0, 190, 255);  
    speed = 6.0f;
    health = 7;
    maxHealth = 7;
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
    stroke(c);
    pushMatrix();
    translate(pos.x, pos.y);
    rotate(theta);
    fill(c);
    triangle(0, -halfW / 2, 0, halfW / 2, halfW, 0); // front
    triangle(0, -halfW / 2, 0, halfW / 2, -halfW, 0); // back
    fill(0);
    triangle(-halfW, 0, 0, -halfW / 2, -halfW - (halfW / 2), -halfW); // left
    triangle(-halfW, 0, 0, halfW / 2, -halfW - (halfW / 2), halfW); // right
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
