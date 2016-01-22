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
}
