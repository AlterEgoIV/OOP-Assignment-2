class Bullet extends GameObject
{
  Bullet()
  {
    pos = new PVector(ship.pos.x, ship.pos.y);
    forward = new PVector(ship.forward.x, ship.forward.y);
    theta = ship.theta;
    speed = ship.speed;
  }
  
  void update()
  {
    pos.add(PVector.mult(forward, 3));
  }
  
  void render()
  {
    pushMatrix();
    translate(pos.x, pos.y);
    rotate(theta);
    line(-5, 0, 5, 0);
    popMatrix();
  }
}
