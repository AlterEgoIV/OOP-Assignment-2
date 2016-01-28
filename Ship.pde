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
  boolean player1;
  
  Ship()
  {
    w = 30.0f;
    halfW = w / 2.0f;
  }

  abstract void checkState();
  abstract void fire();
}

