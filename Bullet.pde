class Bullet extends GameObject
{
  boolean struck;
  
  Bullet()
  {
    struck = false;  
  }
  
  void update()
  {
    forward.x = cos(theta);
    forward.y = sin(theta);
    forward.mult(speed);
    pos.add(forward);
    
    detectCollisions();
  }
  
  void detectCollisions()
  {
    if(!struck)
    {
      for(int i = 0; i < gameObjects.size() - 1; i++)
      {
        GameObject obj = gameObjects.get(i);
        
        if(obj instanceof Ship)
        {
          if(dist(pos.x, pos.y, obj.pos.x, obj.pos.y) < obj.halfW)
          {
            obj.health--;
            struck = true;
          }
        }
      }
    }
  }
  
  void render()
  {
    if(!struck)
    {
      stroke(c);
      pushMatrix();
      translate(pos.x, pos.y);
      rotate(theta);
      line(-5, 0, 5, 0);
      popMatrix();
    }
  }
}
