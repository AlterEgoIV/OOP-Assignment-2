class BackgroundEffect
{
  float bigRadius;
  float radius;
  float smallRadius;
  float theta;
  color c;
  
  BackgroundEffect()
  {
    bigRadius = 30.0f;
    radius = 15.0f;
    smallRadius = radius / 2.0f;
    theta = 0.0f;
    c = color(random(0, 256), random(0, 256), random(0, 256));
  }
  
  void update()
  {
    theta += .02;
    
    bigRadius += 15;
    radius += 10;
    smallRadius += 8;

    if(bigRadius > width)
    {
      bigRadius = 0;
    }
    
    if(radius > width)
    {
      radius = 0;
    }
    
    if(smallRadius > width)
    {
      smallRadius = 0;
    }
    
    if(frameCount % 60 == 0)
    {
      c = color(random(0, 256), random(0, 256), random(0, 256));
    }
  }
  
  void render()
  {
    fill(c);
    stroke(c);
    ellipse(width / 2, height / 2, 30, 30);
    
    noFill();
    strokeWeight(4);
    ellipse(width / 2, height / 2, bigRadius * 2, bigRadius * 2);
    ellipse(width / 2, height / 2, radius * 2, radius * 2);
    ellipse(width / 2, height / 2, smallRadius * 2, smallRadius * 2);
    
    pushMatrix();
    translate(width / 2, height / 2);
    rotate(theta);
    strokeWeight(2);
    // Left to right (up to down)
    line(-width, -height / 2, width, height / 2);
    // Left to right (down to up)
    line(-width, height / 2, width, -height / 2);
    // Top left to bottom right
    line(-width / 2, -height, width / 2, height);
    // Top right to bottom left
    line(width / 2, -height, -width / 2, height);
    // Middle top to middle bottom
    line(0, -height, 0, height);
    popMatrix();
  }
}
