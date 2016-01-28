class Bullet extends Projectile
{
  Bullet()
  {
    damage = 1;
  }
  
  void render()
  {
    stroke(c);
    pushMatrix();
    translate(pos.x, pos.y);
    rotate(theta);
    line(-5, 0, 5, 0);
    popMatrix();
  }
}
