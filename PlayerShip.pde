abstract class PlayerShip extends Ship
{
  boolean canMove;
  
  PlayerShip()
  {
    canMove = true;
  }
  
  void update()
  {
    checkState();
    move();
    fire();
    detectCollisions();
    wrapAround();
  }
  
  void move()
  {
    if(canMove)
    {
      forward.x = cos(theta);
      forward.y = sin(theta);
      
      if(keys[UP])
      {
        // forward vector is multiplied by speed and added to pos vector to get our updated position
        pos.add(PVector.mult(forward, speed));
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
}
