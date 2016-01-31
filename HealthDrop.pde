class HealthDrop extends Drop
{
  HealthDrop()
  {
    c = color(0, 255, 0);
  }
  
  void update()
  { 
    move();
    detectCollisions();
    removeDrop();
  }
  
  void detectCollisions()
  {
    for(int i = gameObjects.size() - 1; i >= 0; --i)
    {
      GameObject obj = gameObjects.get(i);
      
      if(obj instanceof Ship)
      {
        if(dist(pos.x, pos.y, ((Ship)obj).pos.x, ((Ship)obj).pos.y) < halfW + ((Ship)obj).halfW)
        {
          if(((Ship)obj).health < ((Ship)obj).maxHealth)
          {
            ((Ship)obj).health++;
            gameObjects.remove(this);
          }
        }
      }
    }
  }
  
  void render()
  {
    stroke(255);
    fill(c);
    pushMatrix();
    translate(pos.x, pos.y);
    rotate(theta);
    rect(-halfW, -halfW, w, w);
    popMatrix();
  }
}
