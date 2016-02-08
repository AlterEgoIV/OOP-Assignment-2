class Bullet extends Projectile
{
  Bullet()
  {
    damage = 1;
    w = 10.0f;
    halfW = w / 2.0f;
  }
  
  void render()
  {
    stroke(c);
    strokeWeight(3);
    pushMatrix();
    translate(pos.x, pos.y);
    rotate(theta);
    line(-halfW, 0, halfW, 0);
    popMatrix();
    strokeWeight(1);
  }
}
