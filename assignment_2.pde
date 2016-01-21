Ship ship;
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
}

void keyPressed()
{
  keys[keyCode] = true;
}

void keyReleased()
{
  keys[keyCode] = false;
}
