abstract class Drop extends GameObject
{
  Drop()
  {
    pos = new PVector(random(0, width), random(height / 10, height));
    forward = new PVector(random(-1, 1), random(-1, 1));
    forward.normalize();
    theta = radians(random(0, 360));
    w = 20.0f;
    halfW = w / 2.0f;
  }
  
  abstract void detectCollisions();
  
  void move()
  {
    theta += .1;
    pos.add(forward);
    wrapAround();
  }
  
  void removeDrop()
  {
    // Drops are removed after 6 seconds if not consumed
    if(elapsed == 360)
    {
      gameObjects.remove(this);
    }
    
    elapsed++;
  }
}
