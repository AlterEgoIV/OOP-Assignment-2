class SelectScreen extends Screen
{
  float boxWidth;
  float boxHeight;
  
  SelectScreen()
  {
    boxWidth = width / 6;
    boxHeight = height / 6;
  }
  
  void display()
  {
    fill(255);
    stroke(255, 255, 0);
    
    textSize(72);
    textAlign(CENTER);
    text("Please choose your ship", width / 2.0f, height / 10);
    
    textSize(26);
    
    fill(150, 0, 0);
    rect(width / 10, height / 5, boxWidth, boxHeight);
    fill(255);
    text("Light Ship", (width / 10) * 1.8, (height / 5) * 1.5);
    
    fill(150, 0, 0);
    rect(width / 10, (height / 5) * 2, boxWidth, boxHeight);
    fill(255);
    text("Medium Ship", (width / 10) * 1.8, ((height / 5) * 2) * 1.25);
    
    fill(150, 0, 0);
    rect(width / 10, (height / 5) * 3, boxWidth, boxHeight);
    fill(255);
    text("Heavy Ship", (width / 10) * 1.8, ((height / 5) * 3) * 1.15);
  }
  
  void select()
  {
    if(mouseX > width / 10 && mouseX < width / 10 + boxWidth && 
       mouseY > height / 5 && mouseY < height / 5 + boxHeight)
    {
      fill(0, 0, 150);
      rect(width / 10, height / 5, boxWidth, boxHeight);
      fill(255);
      text("Light Ship", (width / 10) * 1.8, (height / 5) * 1.5);
    }
    
    if(mouseX > width / 10 && mouseX < width / 10 + boxWidth &&
       mouseY > (height / 5) * 2 && mouseY < ((height / 5) * 2) + boxHeight)
    {
      fill(0, 0, 150);
      rect(width / 10, (height / 5) * 2, boxWidth, boxHeight);
      fill(255);
      text("Medium Ship", (width / 10) * 1.8, ((height / 5) * 2) * 1.25);
    }
    
    if(mouseX > width / 10 && mouseX < width / 10 + boxWidth &&
       mouseY > (height / 5) * 3 && mouseY < ((height / 5) * 3) + boxHeight)
    {
      fill(0, 0, 150);
      rect(width / 10, (height / 5) * 3, boxWidth, boxHeight);
      fill(255);
      text("Heavy Ship", (width / 10) * 1.8, ((height / 5) * 3) * 1.15);
    }
  }
}
