class Ship extends GameObject
{ 
  Ship(float x, float y, float w, float t, color c)
  {
    pos = new PVector(x, y);
    forward = new PVector(1, 0);
    this.w = w;
    halfW = this.w / 2.0f;
    theta = t;
    this.c = color(c);
    health = 10.0f;
    maxHealth = 10.0f;
    ammo = 10.0f;
    maxAmmo = 10.0f;
    speed = 4.0f;
  }
  
  void update()
  {
    move();
    shoot();
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
    
    // forward coordinates are multiplied by speed to get ship velocity
    forward.mult(speed);
    
    if(keys[UP])
    {
      // forward vector is added to pos vector to get our updated position
      pos.add(forward);
      
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
  
  void shoot()
  {
    if(keys[' '] && millis() - elapsed > (second / 5))
    {
      Bullet bullet = new Bullet();
      
      bullet.pos.x = pos.x;
      bullet.pos.y = pos.y;
      bullet.pos.add(PVector.mult(forward, 3));
      bullet.theta = theta;
      bullet.speed = speed * 3;
      bullet.c = c;
      
      gameObjects.add(bullet);
      
      elapsed = millis();
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
    
    healthBarWidth = map(health, 0, maxHealth, 0, maxHealthBarWidth);
    ammoBarWidth = map(ammo, 0, maxAmmo, 0, maxAmmoBarWidth);
    
    // Health Bar
    fill(0);
    rect(0, 0, maxHealthBarWidth, barHeight);
    fill(0, 200, 0);
    rect(0, 0, healthBarWidth, barHeight);
    
    // Ammo Bar
    fill(0);
    rect(0, barHeight, maxAmmoBarWidth, barHeight);
    fill(200, 0, 0);
    rect(0, barHeight, ammoBarWidth, barHeight);
  }
}

