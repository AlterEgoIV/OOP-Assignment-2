class Ship()
{
  PVector pos;
  PVector forward;
  float theta;
  float speed;
  float health;
  float ammo;
  float w;
  float halfW;
  
  Ship()
  {
    pos = new PVector(width / 5, height / 2);
    forward = new PVector(1, 0);
    theta = 90.0f;
    speed = 5.0f;
    health = 10.0f;
    ammo = 10.0f;
    w = 30.0f;
    halfW = w / 2;
  }
}
