Game game;
Screen start;
Screen end;
GameObject pShip1, pShip2;
GameObject healthDrop;
ArrayList<GameObject> gameObjects;
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
    if(frameCount % 120 == 0)
    {
      GameObject healthDrop = new HealthDrop();
      gameObjects.add(healthDrop);
    }
    
    for(int i = gameObjects.size() - 1; i >= 0; i--)
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
