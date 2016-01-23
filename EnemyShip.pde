class EnemyShip extends GameObject
{
  EnemyShip()
  {
    // Starts middle right of screen
    pos = new PVector(width - (width / 10), height / 2);
    forward = new PVector(-1, 0); // Initial forward movement is to the left
    distance = new PVector(0, 0);
    theta = PI;
    speed = 2.0f;
    health = 10.0f;
    maxHealth = 10.0f;
    ammo = 10.0f;
    maxAmmo = 10.0f;
    w = 30.0f;
    halfW = w / 2.0f;
    c = color(255, 0, 0); // Red
    elapsed = 0;
    second = 1000;
  }
  
  void update()
  {
    // calculateDistance();

    //moveTowardsPlayer();
    dodgeBullets();
  }
  
  void calculateDistance()
  {
    if(pos.x > ship.pos.x)
    {
      distance.x = pos.x - ship.pos.x;
    }
    else if(pos.x < ship.pos.x)
    {
      distance.x = ship.pos.x - pos.x;
    }
    else
    {
      distance.x = 0;
    }
    
    if(pos.y > ship.pos.y)
    {
      distance.y = pos.y - ship.pos.y;
    }
    else if(pos.y < ship.pos.y)
    {
      distance.y = ship.pos.y - pos.y;
    }
    else
    {
      distance.y = 0;
    }
  }
  
  void moveTowardsPlayer()
  {
    // line(pos.x, pos.y, ship.pos.x, ship.pos.y);
    theta = atan2(ship.pos.y - pos.y, ship.pos.x - pos.x);
    forward.x = cos(theta);
    forward.y = sin(theta);
    forward.normalize();
    forward.mult(speed);
    pos.add(forward);
    
    wrapAround();
  }
  
  void dodgeBullets()
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
    
    healthBarWidth = map(health, 0, maxHealth, 0, width / 2);
    ammoBarWidth = map(ammo, 0, maxAmmo, 0, width / 3);
    
    // Health Bar
    stroke(255);
    fill(0);
    rect(width, 0, -(width / 2), height / 20);
    fill(0, 200, 0);
    rect(width, 0, -healthBarWidth, height / 20);
    
    // Ammo Bar
    fill(0);
    rect(width, height / 20, -(width / 3), height / 20);
    fill(200, 0, 0);
    rect(width, height / 20, -ammoBarWidth, height / 20);
  }
}
