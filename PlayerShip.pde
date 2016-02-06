abstract class PlayerShip extends Ship
{
  PlayerShip()
  {
    
  }
  
  void update()
  {
    checkState();
    move();
    fire();
    detectCollisions();
  }
  
  void move()
  {
    forward.x = cos(theta);
    forward.y = sin(theta);
    
    if(keys[UP])
    {
      // forward vector is multiplied by speed and added to pos vector to get our updated position
      pos.add(PVector.mult(forward, speed));
      
      wrapAround();
    }
        
    if(keys[LEFT])
    {
      // Rotates ship to the left
      theta -= .07f;
    }
        
    if(keys[RIGHT])
    {
      // Rotates ship to the right
      theta += .07f;
    } 
  }
}
