abstract class GameObject
{
  PVector pos;
  PVector forward;
  float w;
  float halfW;
  float theta;
  float speed;
  color c;
  int elapsed;
  
  // Generic default values
  GameObject()
  {
    pos = new PVector(width / 2.0f, height / 2.0f);
    forward = new PVector(1, 0);
    w = 0.0f;
    halfW = 0.0f;
    theta = 0.0f;
    speed = 0.0f;
    c = color(255);
    elapsed = 0;
  }
  
  // Abstract functions
  abstract void update();
  abstract void move();
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
    
    if(pos.x < game.maxHealthBarWidth || pos.x > game.maxHealthBarWidth * 2.0f)
    {
      if(pos.y - halfW < game.barHeight * 2.0f)
      {
        pos.y = height;
      }
      
      if(pos.y > height)
      {
        pos.y = halfW + game.barHeight * 2.0f;
      }
    }
    
    if(pos.x > game.maxHealthBarWidth && pos.x < game.maxHealthBarWidth * 2.0f)
    {
      if(pos.y - halfW < 0)
      {
        pos.y = height;
      }
      
      if(pos.y > height)
      {
        pos.y = halfW;
      }
    }
  }
}
