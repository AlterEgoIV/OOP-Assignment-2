GameObject ship;
ArrayList<Bullet> bullets = new ArrayList<Bullet>();
boolean[] keys = new boolean[512];

void setup()
{
  size(800, 600);
  
  ship = new Ship();
}

void draw()
{
  background(0);
  
  ship.update();
  ship.render();
  
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
