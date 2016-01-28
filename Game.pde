class Game
{
  boolean atStart;
  boolean inGame;
  boolean atEnd;
  int second;
  int frame;
  float healthBarWidth;
  float maxHealthBarWidth;
  float ammoBarWidth;
  float maxAmmoBarWidth;
  float barHeight;
  
  Game()
  {
    atStart = true;
    inGame = false;
    atEnd = false;
    second = 1000;
    frame = 1; 
    healthBarWidth = width / 4.0f;
    maxHealthBarWidth = width / 4.0f;
    ammoBarWidth = width / 6.0f;
    maxAmmoBarWidth = width / 6.0f;
    barHeight = height / 40.0f;
  }
  
  void setupGame()
  {
    gameObjects = new ArrayList<GameObject>();
    keys = new boolean[512];
    
    start = new StartScreen();
    end = new EndScreen();
    
    //pShip1 = new Ship('W', 'A', 'D', 'S', width / 20, height / 2, 30.0f, 
    //radians(0.0f), color(255), true);
    
    //pShip2 = new Ship('I', 'J', 'L', 'K', width - (width / 20), height / 2, 30.0f, 
    //radians(180.0f), color(255, 0, 0), false);
    
    //gameObjects.add(pShip1);
    //gameObjects.add(pShip2);
  }
}
