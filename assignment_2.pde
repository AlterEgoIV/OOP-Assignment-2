Ship ship;

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
