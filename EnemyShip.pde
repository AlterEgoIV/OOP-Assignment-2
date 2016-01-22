class EnemyShip extends GameObject
{
  EnemyShip()
  {
    // Starts middle right of screen
    pos = new PVector(width - (width / 10), height / 2);
    forward = new PVector(-1, 0); // Initial forward movement is to the left
    theta = PI;
    speed = 2.0f;
    health = 10.0f;
    ammo = 10.0f;
    w = 30.0f;
    halfW = w / 2.0f;
    c = color(255, 0, 0); // Red
    elapsed = 0;
    second = 1000;
  }
  
  void update()
  {
    moveTowardsPlayer();
    dodgeBullets();
  }
  
  void moveTowardsPlayer()
  {
    forward.x = ship.pos.x - pos.x;
    forward.y = ship.pos.y - pos.y;
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
  }
}
