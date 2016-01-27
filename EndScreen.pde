class EndScreen extends Screen
{
  void display()
  {
    fill(255);
    
    text("Game Over!", width / 2, height / 2);
    text("Press Q to quit or P to play again.", width / 2, (height / 2) + (height / 10));
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
