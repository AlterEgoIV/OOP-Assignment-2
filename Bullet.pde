class Bullet extends Projectile
{
  Bullet()
  {
    damage = 1;
  }
  
  void render()
  {
    stroke(c);
    strokeWeight(3);
    pushMatrix();
    translate(pos.x, pos.y);
    rotate(theta);
    line(-5, 0, 5, 0);
    popMatrix();
    strokeWeight(1);
  }
}
