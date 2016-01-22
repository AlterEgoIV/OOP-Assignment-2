abstract class GameObject
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
  int elapsed;
  int second;
  
  // Generic default values
  GameObject()
  {
    theta = 0.0f;
    speed = 0.0f;
    health = 0.0f;
    ammo = 0.0f;
    w = 0.0f;
    halfW = 0.0f;
    c = color(255); // White
  }
  
  // Abstract functions
  abstract void update();
  abstract void render();
  
  void wrapAround()
  {
    if(pos.x > width)
    {
      pos.x = 0;
    }
      
    if(pos.x < 0)
    {
      pos.x = width;
    }
      
    if(pos.y > height)
    {
      pos.y = 0;
    }
      
    if(pos.y < 0)
    {
      pos.y = height;
    }
  }
}
