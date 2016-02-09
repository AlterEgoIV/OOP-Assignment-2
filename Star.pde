class Star extends GameObject
{
  Star()
  {
    pos = new PVector(random(0, width), random(0, height));
    speed = 5.0f;
  }
  
  void update()
  {
    move();
  }
  
  void move()
  {
    pos.x += speed;
  }
  
  void render()
  {
    stroke(255);
    pushMatrix();
    translate(pos.x, pos.y);
    rect(0, 0, 1, 1);
    popMatrix();
  }
}
