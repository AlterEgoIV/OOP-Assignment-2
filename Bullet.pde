class Bullet extends GameObject
{
  Bullet()
  {
    pos = new PVector(ship.pos.x, ship.pos.y);
    forward = new PVector(ship.forward.x, ship.forward.y);
    theta = ship.theta;
  }
  
  void update()
  {
    pos.add(PVector.mult(forward, 6));
  }
  
  void render()
  {
    pushMatrix();
    translate(pos.x, pos.y);
    rotate(theta);
    line(0, 0, 5, 0);
    popMatrix();
  }
}
