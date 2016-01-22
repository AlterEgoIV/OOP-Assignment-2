GameObject ship;
GameObject enemy;
ArrayList<Bullet> bullets = new ArrayList<Bullet>();
boolean[] keys = new boolean[512];

void setup()
{
  size(800, 600);
  
  ship = new Ship();
  enemy = new EnemyShip();
}

void draw()
{
  background(0);
  
  ship.update();
  ship.render();
  
  enemy.update();
  enemy.render();
  
  for(Bullet b : bullets)
  {
    b.update();
    b.render();
  }
}

void keyPressed()
{
  keys[keyCode] = true;
}

void keyReleased()
{
  keys[keyCode] = false;
}
