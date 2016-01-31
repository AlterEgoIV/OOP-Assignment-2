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

