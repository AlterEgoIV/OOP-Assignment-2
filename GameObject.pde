abstract class GameObject
{
  PVector pos;
  PVector forward;
  PVector distance;
  float theta;
  float speed;
  float health;
  float maxHealth;
  float ammo;
  float maxAmmo;
  float w;
  float halfW;
  color c;
  int elapsed;
  int second;
  float healthBarWidth;
  float ammoBarWidth;
  
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
    
    if(pos.x < width / 3 || pos.x > ((width / 3) * 2))
    {
      if(pos.y - halfW < height / 10)
      {
        pos.y = height;
      }
      
      if(pos.y > height)
      {
        pos.y = halfW + (height / 10);
      }
    }
    
    if(pos.x > width / 3 && pos.x < ((width / 3) * 2))
    {
      if(pos.y - halfW < height / 20)
      {
        pos.y = height;
      }
      
      if(pos.y > height)
      {
        pos.y = halfW + (height / 20);
      }
    }
  }
}
