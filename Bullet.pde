class Bullet extends GameObject
{
  boolean hit;
  
  Bullet()
  {
    hit = false;  
  }
  
  void update()
  {
    forward.x = cos(theta);
    forward.y = sin(theta);
    forward.mult(speed);
    pos.add(forward);
    
    //detectCollisions();
  }
  
  void detectCollisions()
  {
    for(int i = 0; i < gameObjects.size() - 1; i++)
    {
      GameObject obj = gameObjects.get(i);
      
      if(obj instanceof Ship)
      {
        if(dist(pos.x, pos.y, obj.pos.x, obj.pos.y) < obj.halfW)
        {
          obj.health -= 0.5;
          hit = true;
        }
      }
    }
  }
  
  void render()
  {
    if(hit == false)
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
