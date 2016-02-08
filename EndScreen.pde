class EndScreen extends Screen
{
  void display()
  {
    fill(255);
    
    textSize(96);
    text("Game Over!", width / 2.0f, height / 2.0f);
    textSize(32);
    text("Press Q to quit or P to play again.", width / 2.0f, (height / 2.0f) + (height / 10.0f));
  }
  
  void select()
  {
    if(keys['Q'])
    {
      exit();
    }
    
    if(keys['P'])
    {
      game.atEnd = false;
      game.atStart = true;
      
      game.setupGame();
    }
  }
}
