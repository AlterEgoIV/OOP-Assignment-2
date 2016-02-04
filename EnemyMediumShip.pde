class EnemyMediumShip extends EnemyShip
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
    checkForHealth();
    checkForAmmo();
    checkIfSearchingForAmmo();
    checkIfEvading();
    
    chooseAction();
  }
  
  void checkState()
  {
    if(health <= 0)
    {
      gameObjects.remove(this);
      game.atEnd = true;
    }
  }
  
  void checkForHealth()
  {
    healthDropAvailable = false;
    
    for(int i = gameObjects.size() - 1; i >= 0; --i)
    {
      GameObject obj = gameObjects.get(i);
      
      if(obj instanceof HealthDrop)
      {
        healthDropAvailable = true;
      }
    }
  }
  
  void checkForAmmo()
  {
    ammoDropAvailable = false;
    
    for(int i = gameObjects.size() - 1; i >= 0; --i)
    {
      GameObject obj = gameObjects.get(i);
      
      if(obj instanceof AmmoDrop)
      {
        ammoDropAvailable = true;
      }
    }
  }
  
  void checkIfSearchingForAmmo()
  {
    if(ammo <= 0)
    {
      searchingForAmmo = true;
    }
    
    if(ammo > maxAmmo / 3)
    {
      searchingForAmmo = false;
    }
  }
  
  void checkIfEvading()
  {
    if(!evading)
    {
      if((ammo <= maxAmmo / 3 && !ammoDropAvailable) ||
         (health <= maxHealth / 3 && !healthDropAvailable))
      {
        evading = true;
        
        forward.x = random(-1, 1);
        forward.y = random(-1, 1);
        forward.normalize();
      }
    }
  }
  
  void chooseAction()
  {
    orientate();
    
    sustain();
    
    attack();

    evade();
  }
  
  void orientate()
  {
    if(health >= maxHealth / 3)
    {
      theta = atan2(pShip.pos.y - pos.y, pShip.pos.x - pos.x);
    }
  }
  
  void sustain()
  {
    if(healthDropAvailable && health <= maxHealth / 3)
    {
      goToHealth();
    }
    
    if(ammoDropAvailable && health > maxHealth / 3 && searchingForAmmo)
    {
      goToAmmo();
    }
  }
  
  void attack()
  {
    if(dist(pos.x, pos.y, pShip.pos.x, pShip.pos.y) >= width / 4 && health >= maxHealth / 3 && !searchingForAmmo)
    {
      move();
    }
    
    if(health >= maxHealth / 3 && !searchingForAmmo)
    {
      fire();
    }
  }
  
  void evade()
  {
    if(evading)
    {
      if((ammo <= maxAmmo / 3 && !ammoDropAvailable) ||
         (health <= maxHealth / 3 && !healthDropAvailable))
      {
        pos.add(PVector.mult(forward, speed));
        
        wrapAround();
      }
      else
      {
        evading = false;
      }
    }
  }
  
  void move()
  {
    if(!evading)
    {
      forward.x = cos(theta);
      forward.y = sin(theta);
  
      // forward vector is multiplied by speed and added to pos vector to get our updated position
      pos.add(PVector.mult(forward, speed));
        
      wrapAround();
    }
  }
  
  void fire()
  {
    forward.x = cos(theta);
    forward.y = sin(theta);
    
    if(ammo > 0 && millis() - elapsed > game.second / 5)
    {
      Bullet bullet = new Bullet();
      
      bullet.pos.x = pos.x;
      bullet.pos.y = pos.y;
      bullet.pos.add(PVector.mult(forward, halfW + 1));
      bullet.theta = theta;
      bullet.speed = speed * 3;
      bullet.c = c;
      bullet.enemyProjectile = true;
      
      gameObjects.add(bullet);
      
      ammo--;
      
      elapsed = millis();
    }
  }
  
  void goToHealth()
  {
    float min;
    
    for(int i = gameObjects.size() - 1; i >= 0; --i)
    {
      GameObject obj = gameObjects.get(i);
      
      if(obj instanceof HealthDrop)
      {
        distance.add(dist(pos.x, pos.y, obj.pos.x, obj.pos.y));
      }
    }
    
    min = width;
    
    for(int i = 0; i < distance.size(); ++i)
    {
      if(distance.get(i) < min)
      {
        min = distance.get(i);
      }
    }
    
    for(int i = gameObjects.size() - 1; i >= 0; --i)
    {
      GameObject obj = gameObjects.get(i);
      
      if(obj instanceof HealthDrop)
      {
        if(min == dist(pos.x, pos.y, obj.pos.x, obj.pos.y))
        {
          theta = atan2(obj.pos.y - pos.y, obj.pos.x - pos.x);
          
          forward.x = cos(theta);
          forward.y = sin(theta);

          pos.add(PVector.mult(forward, speed));
          
          distance = new ArrayList<Float>();
        }
      }
    }
  }
  
  void goToAmmo()
  {
    float min;
    
    for(int i = gameObjects.size() - 1; i >= 0; --i)
    {
      GameObject obj = gameObjects.get(i);
      
      if(obj instanceof AmmoDrop)
      {
        distance.add(dist(pos.x, pos.y, obj.pos.x, obj.pos.y));
      }
    }
    
    min = width;
    
    for(int i = 0; i < distance.size(); ++i)
    {
      if(distance.get(i) < min)
      {
        min = distance.get(i);
      }
    }
    
    for(int i = gameObjects.size() - 1; i >= 0; --i)
    {
      GameObject obj = gameObjects.get(i);
      
      if(obj instanceof AmmoDrop)
      {
        if(min == dist(pos.x, pos.y, obj.pos.x, obj.pos.y))
        {
          theta = atan2(obj.pos.y - pos.y, obj.pos.x - pos.x);
          
          forward.x = cos(theta);
          forward.y = sin(theta);

          pos.add(PVector.mult(forward, speed));
          
          distance = new ArrayList<Float>();
        }
      }
    }
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
