abstract class Ship extends GameObject
{ 
  int health;
  int maxHealth;
  int ammo;
  int maxAmmo;
  char up;
  char left;
  char right;
  char fire;
  
  Ship()
  {
    w = 30.0f;
    halfW = w / 2.0f;
    ammo = 20;
    maxAmmo = 20;
  }

  abstract void fire();
  
  void checkState()
  {
    if(health <= 0)
    {
      gameObjects.remove(this);
      game.atEnd = true;
    }
  }
  
  void detectCollisions()
  {
    for(int i = gameObjects.size() - 1; i >= 0; --i)
    {
      GameObject obj = gameObjects.get(i);
        
      if(obj instanceof EnemyShip)
      {
        if(dist(pos.x, pos.y, obj.pos.x, obj.pos.y) < halfW + obj.halfW)
        {
          if(pos.x < obj.pos.x)
          {
            pos.x -= halfW;
          }
          else if(pos.x > obj.pos.x)
          {
            pos.x += halfW;
          }
          else if(pos.y < obj.pos.y)
          {
            pos.y -= halfW;
          }
          else
          {
            pos.y += halfW;
          }
        }
      }
    }
  }
  
  /* 
    void move()
    {
      In order to move in the same direction as the angle(theta) the ship is rotated to,
      you must use the sin() and cos() functions in conjuction with theta.
      This gives you an (x, y) coordinate that when added to your position
      moves you in the direction of the angle you are rotated towards.
        
      Whether to assign the x or y value based on sin(theta) or cos(theta) depends 
      on the initial point of rotation of the ship. Since the initial point of rotation 
      of the player ship is 0 (according to Processing), then:
        
      sin(theta) = opposite/hypotenuse = y/radius(1) = y
      cos(theta) = adjacent/hypotenuse = x/radius(1) = x
    }
  */
}

