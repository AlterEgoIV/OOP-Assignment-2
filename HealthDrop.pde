class HealthDrop extends GameObject
{
  HealthDrop()
  {
    pos = new PVector(random(0, width), random(height / 10, height));
    forward = new PVector(random(-1, 1), random(-1, 1));
    forward.normalize();
    theta = radians(random(0, 360));
    w = 30.0f;
    halfW = w / 2.0f;
  }
  
  void update()
  { 
    move();
    
    detectCollisions();
    
    removeDrop();
  }
  
  void move()
  {
    theta += .1;
    
    pos.add(forward);
    
    wrapAround();
  }
  
  void detectCollisions()
  {
    for(int i = 0; i < gameObjects.size(); i++)
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
  
  void removeDrop()
  {
    if(elapsed == 300)
    {
      gameObjects.remove(this);
    }
    
    elapsed++;
  }
  
  void render()
  {
    stroke(c);
    fill(0);
    pushMatrix();
    translate(pos.x, pos.y);
    rotate(theta);
    rect(-halfW, -halfW, w, w);
    popMatrix();
  }
}
