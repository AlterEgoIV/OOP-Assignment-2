abstract class EnemyShip extends Ship
{
  boolean healthDropAvailable;
  boolean ammoDropAvailable;
  boolean searchingForAmmo;
  boolean evading;
  
  EnemyShip()
  {
    healthDropAvailable = false;
    ammoDropAvailable = false;
    searchingForAmmo = false;
    evading = false;
    ammo = 10;
    maxAmmo = 10;
  }
  
  void update()
  {
    checkState();
    checkForHealth();
    checkForAmmo();
    checkIfSearchingForAmmo();
    checkIfEvading();
    
    chooseAction();
    wrapAround();
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
}
