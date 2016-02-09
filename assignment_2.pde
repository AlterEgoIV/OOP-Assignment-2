Game game;
Screen start;
Screen select;
Screen end;
GameObject pShip, eShip;
BackgroundEffect effect;
ArrayList<GameObject> gameObjects;
ArrayList<Float> distance = new ArrayList<Float>();
boolean[] keys = new boolean[512];

void setup()
{
  size(1200, 800);
  
  game = new Game();
  game.setupGame();
}

void draw()
{
  background(0);
  
  if(game.atStart)
  {
    effect.update();
    effect.render();
    start.display();
    start.select();
  }
  else if(game.atSelect)
  {
    effect.update();
    effect.render();
    select.display();
    select.select();
  }
  else if(game.atEnd)
  {
    effect.update();
    effect.render();
    end.display();
    end.select();
  }
  else
  {
    GameObject star = new Star();
    gameObjects.add(star);
    
    // Spawn AmmoDrop once every second
    if(frameCount % 60 == 0)
    {
      GameObject ammoDrop = new AmmoDrop();
      gameObjects.add(ammoDrop);
    }
    
    // Spawn Health Drop once every second
    if(frameCount % 60 == 0)
    {
      GameObject healthDrop = new HealthDrop();
      gameObjects.add(healthDrop);
    }
    
    for(int i = gameObjects.size() - 1; i >= 0; --i)
    {
      GameObject obj = gameObjects.get(i);
      
      if(game.time > 120)
      {
        obj.update();
      }
      
      obj.render();
    }
    
    game.time++;
  }
}

void keyPressed()
{
  keys[keyCode] = true;
}

void keyReleased()
{
  keys[keyCode] = false;
}

void mousePressed()
{
  if(game.atSelect)
  {
    if(mouseX > width / 10 && mouseX < width / 10 + width / 6 && 
       mouseY > height / 5 && mouseY < height / 5 + height / 6)
    {
      game.atSelect = false;
      pShip = new PlayerLightShip();
    }
    
    if(mouseX > width / 10 && mouseX < width / 10 + width / 6 &&
       mouseY > (height / 5) * 2 && mouseY < ((height / 5) * 2) + height / 6)
    {
      game.atSelect = false;
      pShip = new PlayerMediumShip();
    }
    
    if(mouseX > width / 10 && mouseX < width / 10 + width / 6 &&
       mouseY > (height / 5) * 3 && mouseY < ((height / 5) * 3) + height / 6)
    {
      game.atSelect = false;
      pShip = new PlayerHeavyShip();
    }
    
    game.random = (int)random(1, 4);
    
    switch(game.random)
    {
      case 1:
      {
        eShip = new EnemyLightShip();
        break;
      }
      
      case 2:
      {
        eShip = new EnemyMediumShip();
        break;
      }
      
      case 3:
      {
        eShip = new EnemyHeavyShip();
        break;
      }
    }
    
    gameObjects.add(pShip);
    gameObjects.add(eShip);
  }
}
