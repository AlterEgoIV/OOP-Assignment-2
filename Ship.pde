class Ship
{
  PVector pos;
  PVector forward;
  float theta;
  float speed;
  float health;
  float ammo;
  float w;
  float halfW;
  color c;
  
  Ship()
  {
    // Starts middle left of screen
    pos = new PVector(width / 10, height / 2);
    forward = new PVector(1, 0); // Initial forward movement is to the right
    theta = 0.0f;
    speed = 5.0f;
    health = 10.0f;
    ammo = 10.0f;
    w = 30.0f;
    halfW = w / 2.0f;
    c = color(255); // White
  }
  
  void update()
  {
    move();
  }
  
  void move()
  {
    if(keyPressed)
    {
      if(key == CODED)
      {
        if(keyCode == UP)
        {
          pos.y--;
        }
        
        if(keyCode == LEFT)
        {
          theta -= .1f;
        }
        
        if(keyCode == RIGHT)
        {
          theta += .1f;
        }
      }
    }
  }
  
  void render()
  {
    pushMatrix();
    stroke(c);
    translate(pos.x, pos.y);
    rotate(theta);
    line(-halfW, -halfW, halfW, 0); // Outside Left
    line(-halfW, halfW, halfW, 0); // Outside Right
    line(-halfW, -halfW, 0, 0); // Inside Left
    line(-halfW, halfW, 0, 0); // Inside Right
    popMatrix();
  }
}
