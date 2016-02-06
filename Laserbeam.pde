class Laserbeam extends Projectile
{
  Laserbeam()
  {
    damage = 1;
    w = 10.0f;
    halfW = w / 2.0f;
  }
  
  void render()
  {
    stroke(c);
    fill(c);
    strokeWeight(3);
    pushMatrix();
    translate(pos.x, pos.y);
    rotate(theta);
    rect(0, -halfW, width, w);
    popMatrix();
    strokeWeight(1);
  }
}
