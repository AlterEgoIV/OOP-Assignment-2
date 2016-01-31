class EnemyMediumShip extends Ship
{
  EnemyMediumShip()
  {
    pos = new PVector(width - (width / 20.0f), height - (height / 4.0f));
    forward = new PVector(-1, 0);
    theta = PI;
    c = color(0, 190, 255);
    speed = 4.0f;
    health = 10;
    maxHealth = 10;
  }
  
  void update()
  {
    checkState();
    
    chooseAction();
    //move();
    //fire();
  }
  
  void checkState()
  {
    if(health <= 0)
    {
      gameObjects.remove(this);
      game.atEnd = true;
    }
  }
  
  void chooseAction()
  {
    if(dist(pos.x, pos.y, pShip.pos.x, pShip.pos.y) >= width / 4)
    {
      move();
    }
    
    if(health > maxHealth / 2)
    {
      theta = atan2(pShip.pos.y - pos.y, pShip.pos.x - pos.x);
      
      // fire();
    }
    
    if(health < maxHealth / 2)
    {
      lookForHealth();
    }
    
    if(health > maxHealth / 2 && ammo < maxAmmo / 2)
    {
      lookForAmmo();
    }
  }
  
  void move()
  {
    forward.x = cos(theta);
    forward.y = sin(theta);

    // forward vector is multiplied by speed and added to pos vector to get our updated position
    pos.add(PVector.mult(forward, speed));
      
    wrapAround();
  }
  
  void fire()
  {
    if(ammo > 0 && millis() - elapsed > game.second / 5)
    {
      Bullet bullet = new Bullet();
      
      bullet.pos.x = pos.x;
      bullet.pos.y = pos.y;
      bullet.pos.add(PVector.mult(forward, halfW + 1));
      bullet.theta = theta;
      bullet.speed = speed * 3;
      bullet.c = c;
      
      gameObjects.add(bullet);
      
      ammo--;
      
      elapsed = millis();
    }
  }
  
  void lookForHealth()
  {
    for(int i = gameObjects.size() - 1; i >= 0; --i)
    {
      GameObject obj = gameObjects.get(i);
      
      if(obj instanceof HealthDrop)
      {
        if(dist(pos.x, pos.y, obj.pos.x, obj.pos.y) < width / 2)
        {
          theta = atan2(obj.pos.y - pos.y, obj.pos.x - pos.x);
          
          forward.x = cos(theta);
          forward.y = sin(theta);

          // forward vector is multiplied by speed and added to pos vector to get our updated position
          pos.add(PVector.mult(forward, speed));
        }
      }
    }
  }
  
  void lookForAmmo()
  {
    
  }
  
  void render()
  {
    stroke(c);
    pushMatrix();
    translate(pos.x, pos.y);
    rotate(theta);
    line(-halfW, -halfW, halfW, 0); // Outside Left
    line(-halfW, halfW, halfW, 0); // Outside Right
    line(-halfW, -halfW, 0, 0); // Inside Left
    line(-halfW, halfW, 0, 0); // Inside Right
    popMatrix();
    
    game.healthBarWidth = map(health, 0, maxHealth, 0, game.maxHealthBarWidth);
    game.ammoBarWidth = map(ammo, 0, maxAmmo, 0, game.maxAmmoBarWidth);

    stroke(255);
      
    // Enemy Health Bar
    fill(0);
    rect(width, 0, -game.maxHealthBarWidth, game.barHeight);
    fill(0, 200, 0);
    rect(width, 0, -game.healthBarWidth, game.barHeight);
      
    // Enemy Ammo Bar
    fill(0);
    rect(width, game.barHeight, -game.maxAmmoBarWidth, game.barHeight);
    fill(200, 0, 0);
    rect(width, game.barHeight, -game.ammoBarWidth, game.barHeight);
  }
}
