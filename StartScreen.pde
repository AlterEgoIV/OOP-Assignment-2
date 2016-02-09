class StartScreen implements Screen
{
  void display()
  {
    fill(255);
    
    textSize(96);
    textAlign(CENTER);
    text("SpaceWars", width / 2.0f, height / 2.0f);
    
    textSize(32);
    text("Press RETURN / ENTER to begin", width / 2.0f, (height / 2.0f) + (height / 10.0f));
  }
  
  void select()
  {
    if(keys[ENTER] || keys[RETURN])
    {
      game.atStart = false;
      game.atSelect = true;
    }
  }
}
