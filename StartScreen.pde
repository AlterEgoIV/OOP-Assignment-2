class StartScreen extends Screen
{
  void display()
  {
    textSize(96);
    textAlign(CENTER);
    text("SpaceWars", width / 2, height / 2);
    
    textSize(32);
    text("Press SPACE BAR to begin", width / 2, (height / 2) + (height / 10));
  }
  
  void select()
  {
    if(keys[' '])
    {
      game.atStart = false;
      game.inGame = true;
    }
  }
}
