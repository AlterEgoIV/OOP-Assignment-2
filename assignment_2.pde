Game game;
Screen start;
Screen end;
GameObject pShip, eShip;
ArrayList<GameObject> gameObjects;
ArrayList<Float> distance = new ArrayList<Float>();
boolean[] keys = new boolean[512];

void setup()
{
  size(800, 600);
  
  game = new Game();
  game.setupGame();
}

void draw()
{
  background(0);
  
  if(game.atStart)
  {
    start.display();
    start.select();
  }
  else if(game.atEnd)
  {
    end.display();
    end.select();
  }
  else
  {
    // Draw star to screen every 3 frames
    if(frameCount % 3 == 0)
    {
      GameObject star = new Star();
      gameObjects.add(star);
    }
    
    // Spawn AmmoDrop once every 2 seconds
    if(frameCount % 120 == 0)
    {
      GameObject ammoDrop = new AmmoDrop();
      gameObjects.add(ammoDrop);
    }
    
    // Spawn Health Drop once every 3 seconds
    if(frameCount % 180 == 0)
    {
      GameObject healthDrop = new HealthDrop();
      gameObjects.add(healthDrop);
    }
    
    for(int i = gameObjects.size() - 1; i >= 0; --i)
    {
      GameObject obj = gameObjects.get(i);
      
      obj.update();
      obj.render();
    }
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
