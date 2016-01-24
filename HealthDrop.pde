class HealthDrop extends GameObject
{
  HealthDrop()
  {
    pos = new PVector(random(0, width), random(height / 10, height));
    forward = new PVector(random(-1, 1), random(-1, 1));
    theta = radians(random(0, 360));
    w = 30.0f;
    halfW = w / 2.0f;
    speed = 1.2f;
    forward.normalize();
    forward.mult(speed);
  }
  
  void update()
  {
    pos.add(forward);
    
    theta += .1;
    
    wrapAround();
    
    detectCollisions();
    
    /*if(millis() - elapsed > second * 5)
    {
      gameObjects.remove(this);
      
      elapsed = millis();
    }*/
  }
  
  void detectCollisions()
  {
    for(int i = 0; i < gameObjects.size(); i++)
    {
      GameObject obj = gameObjects.get(i);
      
      if(obj instanceof Ship)
      {
        if(dist(pos.x, pos.y, obj.pos.x, obj.pos.y) < obj.halfW)
        {
          if(obj.health < obj.maxHealth)
          {
            gameObjects.remove(this);
            obj.health++;
          }
        }
      }
    }
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
