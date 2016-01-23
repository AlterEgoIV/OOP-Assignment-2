abstract class GameObject
{
  PVector pos;
  PVector forward;
  float w;
  float halfW;
  float theta;
  color c;
  float health;
  float maxHealth;
  float ammo;
  float maxAmmo;
  float speed;
  int elapsed;
  int second;
  float healthBarWidth;
  float maxHealthBarWidth;
  float ammoBarWidth;
  float maxAmmoBarWidth;
  float barHeight;
  
  // Generic default values
  GameObject()
  {
    pos = new PVector(width / 2, height / 2);
    forward = new PVector(1, 0);
    w = 0.0f;
    halfW = 0.0f;
    theta = 0.0f;
    c = color(255);
    health = 0.0f;
    maxHealth = 0.0f;
    ammo = 0.0f;
    maxAmmo = 0.0f;
    elapsed = 0;
    second = 1000;
    healthBarWidth = width / 2;
    maxHealthBarWidth = width / 2;
    ammoBarWidth = width / 3;
    maxAmmoBarWidth = width / 3;
    barHeight = height / 20;
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
