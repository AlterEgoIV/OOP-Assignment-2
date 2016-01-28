class HeavyShip extends Ship
{
  HeavyShip()
  {
    super();
  }
  
  void update()
  {
    checkState();
    move();
    fire();
  }
  
  void checkState()
  {
    if(health <= 0)
    {
      gameObjects.remove(this);
      game.inGame = false;
      game.atEnd = true;
    }
  }
  
  void move()
  {
    /* 
      In order to move in the same direction as the angle(theta) the ship is rotated to,
      you must use the sin() and cos() functions in conjuction with theta.
      This gives you an (x, y) coordinate that when added to your position
      moves you in the direction of the angle you are rotated towards.
      
      Whether to assign the x or y value based on sin(theta) or cos(theta) depends 
      on the initial point of rotation of the ship, which affects the unit circle. 
      Since the initial point of rotation of the player ship is 0 (according to Processing),
      then:
      
      sin(theta) = opposite/hypotenuse = y/radius(1) = y
      cos(theta) = adjacent/hypotenuse = x/radius(1) = x
    */
    
    forward.x = cos(theta);
    forward.y = sin(theta);
    
    if(keys[up])
    {
      // forward vector is multiplied by speed and added to pos vector to get our updated position
      pos.add(PVector.mult(forward, speed));
      
      wrapAround();
    }
        
    if(keys[left])
    {
      // Rotates ship to the left
      theta -= .1f;
    }
        
    if(keys[right])
    {
      // Rotates ship to the right
      theta += .1f;
    } 
  }
  
  void fire()
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
    
    if(player1)
    {
      // Player1 Health Bar
      fill(0);
      rect(0, 0, game.maxHealthBarWidth, game.barHeight);
      fill(0, 200, 0);
      rect(0, 0, game.healthBarWidth, game.barHeight);
      
      // Player1 Ammo Bar
      fill(0);
      rect(0, game.barHeight, game.maxAmmoBarWidth, game.barHeight);
      fill(200, 0, 0);
      rect(0, game.barHeight, game.ammoBarWidth, game.barHeight);
    }
    else
    {
      stroke(255);
      
      // Player2 Health Bar
      fill(0);
      rect(width, 0, -game.maxHealthBarWidth, game.barHeight);
      fill(0, 200, 0);
      rect(width, 0, -game.healthBarWidth, game.barHeight);
      
      // Player2 Ammo Bar
      fill(0);
      rect(width, game.barHeight, -game.maxAmmoBarWidth, game.barHeight);
      fill(200, 0, 0);
      rect(width, game.barHeight, -game.ammoBarWidth, game.barHeight);
    }
  }
}
