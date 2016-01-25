class Bullet extends GameObject
{
  void update()
  {
    move();
    
    detectCollisions();
    
    removeBullet();
  }
  
  void move()
  {
    forward.x = cos(theta);
    forward.y = sin(theta);
    forward.mult(speed);
    pos.add(forward);
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
          gameObjects.remove(this);
          ((Ship)obj).health--;
        }
      }
    }
  }
  
  void removeBullet()
  {
    if(pos.x < 0 || pos.x > width || pos.y < 0 || pos.y > height)
    {
      gameObjects.remove(this);
    }
  }
  
  void render()
  {
    stroke(c);
    pushMatrix();
    translate(pos.x, pos.y);
    rotate(theta);
    line(-5, 0, 5, 0);
    popMatrix();
  }
}
