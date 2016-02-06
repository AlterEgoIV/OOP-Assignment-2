class Energyball extends Projectile
{
  Energyball()
  {
    damage = 5;
    w = 40.0f;
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
    ellipse(0, 0, halfW, halfW);
    popMatrix();
    strokeWeight(1);
  }
}
