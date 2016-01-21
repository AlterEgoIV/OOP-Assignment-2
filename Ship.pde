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
    pos = new PVector(width / 5, height / 2);
    forward = new PVector(1, 0);
    theta = 90.0f;
    speed = 5.0f;
    health = 10.0f;
    ammo = 10.0f;
    w = 30.0f;
    halfW = w / 2.0f;
    c = color(255); // White
  }
  
  void update()
  {
    
  }
  
  void render()
  {
    stroke(c);
    line(pos.x - halfW, pos.y - halfW, pos.x + halfW, pos.y); // Outside Left
    line(pos.x - halfW, pos.y + halfW, pos.x + halfW, pos.y); // Outside Right
    line(pos.x - halfW, pos.y - halfW, pos.x, pos.y); // Inside Left
    line(pos.x - halfW, pos.y + halfW, pos.x, pos.y); // Inside Right
  }
}
