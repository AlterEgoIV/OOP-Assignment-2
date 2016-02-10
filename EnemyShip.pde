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
  
  // Algorithm to determine if there are any health drops available
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
  
  // Algorithm to determine if there are any ammo drops available
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
  
  // Determines whether or not to search for ammo
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
  
  // Determines whether or not to evade
  void checkIfEvading()
  {
    if(!evading)
    {
      if((ammo <= maxAmmo / 3 && !ammoDropAvailable) ||
         (health <= maxHealth / 3 && !healthDropAvailable))
      {
        evading = true;
        
        // Set a random direction to move
        forward.x = random(-1, 1);
        forward.y = random(-1, 1);
        forward.normalize();
      }
    }
  }
  
  // Main AI branches
  void chooseAction()
  {
    orientate();
    
    sustain();
    
    attack();

    evade();
  }
  
  // Makes enemy point towards player
  void orientate()
  {
    if(health >= maxHealth / 3)
    {
      theta = atan2(pShip.pos.y - pos.y, pShip.pos.x - pos.x);
    }
  }
  
  // Makes enemy search for drops
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
  
  // Makes enemy move towards and attack player
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
  
  // Makes enemy evade
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
  
  // Algorithm to determine the health drop the shortest distance away from the enemy
  void goToHealth()
  {
    float min;
    
    /*
      Get all of the distances from the enemy to all of the 
      different health drops and add them to the distance ArrayList.
    */
    for(int i = gameObjects.size() - 1; i >= 0; --i)
    {
      GameObject obj = gameObjects.get(i);
      
      if(obj instanceof HealthDrop)
      {
        distance.add(dist(pos.x, pos.y, obj.pos.x, obj.pos.y));
      }
    }
    
    min = width;
    
    // Set min to the shortest distance
    for(int i = 0; i < distance.size(); ++i)
    {
      if(distance.get(i) < min)
      {
        min = distance.get(i);
      }
    }
    
    /*
      Search for the distance that matches min and rotate and 
      move towards the health drop with that distance.
    */
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
          
          // Clear the distance ArrayList
          distance = new ArrayList<Float>();
        }
      }
    }
  }
  
  // Algorithm to determine the ammo drop the shortest distance away from the enemy
  void goToAmmo()
  {
    float min;
    
    /*
      Get all of the distances from the enemy to all of the 
      different ammo drops and add them to the distance ArrayList.
    */
    for(int i = gameObjects.size() - 1; i >= 0; --i)
    {
      GameObject obj = gameObjects.get(i);
      
      if(obj instanceof AmmoDrop)
      {
        distance.add(dist(pos.x, pos.y, obj.pos.x, obj.pos.y));
      }
    }
    
    min = width;
    
    // Set min to the shortest distance
    for(int i = 0; i < distance.size(); ++i)
    {
      if(distance.get(i) < min)
      {
        min = distance.get(i);
      }
    }
    
    /*
      Search for the distance that matches min and rotate and 
      move towards the ammo drop with that distance.
    */
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
