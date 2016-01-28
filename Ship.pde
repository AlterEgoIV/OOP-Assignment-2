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
    this('W', 'A', 'D', 'S', width / 20.0f, height / 2.0f, 
         30.0f, 0.0f, color(255), true);
  }
  
  Ship(char up, char left, char right, char fire, 
       float x, float y, float w, float t, color c, boolean p1)
  {
    pos = new PVector(x, y);
    forward = new PVector(1, 0);
    this.w = w;
    halfW = this.w / 2.0f;
    theta = t;
    speed = 4.0f;
    this.c = color(c);
    health = 10;
    maxHealth = 10;
    ammo = 10;
    maxAmmo = 10;
    this.up = up;
    this.left = left;
    this.right = right;
    this.fire = fire;
    player1 = p1;
  }
  
  abstract void update();
  abstract void move();
  abstract void fire();
  abstract void checkState();
  abstract void render();
}

