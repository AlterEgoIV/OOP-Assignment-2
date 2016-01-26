Game game;
Screen start;
Screen end;
GameObject pShip1, pShip2;
GameObject healthDrop;
ArrayList<GameObject> gameObjects = new ArrayList<GameObject>();
boolean[] keys = new boolean[512];

void setup()
{
  size(800, 600);
  
  game = new Game();
  
  start = new StartScreen();
  end = new EndScreen();
  
  pShip1 = new Ship('W', 'A', 'D', 'S', width / 20, height / 2, 30.0f, 
  radians(0.0f), color(255), true);
  
  pShip2 = new Ship('I', 'J', 'L', 'K', width - (width / 20), height / 2, 30.0f, 
  radians(180.0f), color(255, 0, 0), false);
  
  gameObjects.add(pShip1);
  gameObjects.add(pShip2);
}

void draw()
{
  background(0);
  
  if(game.atStart)
  {
    start.display();
  }
  else if(game.inGame)
  {
    if(frameCount % (game.frame * 120) == 0)
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
  else if(game.inGame)
  {
    
  }
  else
  {
    println("No mode active.");
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
