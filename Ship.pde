class Ship extends GameObject
{ 
  int health;
  int maxHealth;
  int ammo;
  int maxAmmo;
  char up;
  char left;
  char right;
  char fire;
  boolean player1;
  
  Ship(char up, char left, char right, char fire, 
       float x, float y, float w, float t, color c, boolean p1)
  {
    pos = new PVector(x, y);
    forward = new PVector(1, 0);
    this.w = w;
    halfW = this.w / 2.0f;
    theta = t;
    speed = 4.0f;
    this.c = color(c);
    health = 10;
    maxHealth = 10;
    ammo = 10;
    maxAmmo = 10;
    this.up = up;
    this.left = left;
    this.right = right;
    this.fire = fire;
    player1 = p1;
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
    
    if(keys[up])
    {
      // forward vector is added to pos vector to get our updated position
      pos.add(forward);
      
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
  
  void shoot()
  {
    if(keys[fire] && millis() - game.elapsed > game.second / 5)
    {
      Bullet bullet = new Bullet();
      
      bullet.pos.x = pos.x;
      bullet.pos.y = pos.y;
      bullet.pos.add(PVector.mult(forward, 3));
      bullet.theta = theta;
      bullet.speed = speed * 3;
      bullet.c = c;
      
      gameObjects.add(bullet);
      
      game.elapsed = millis();
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

