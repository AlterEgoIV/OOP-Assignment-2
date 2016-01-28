class Game
{
  boolean atStart;
  boolean inGame;
  boolean atEnd;
  int second;
  float healthBarWidth;
  float maxHealthBarWidth;
  float ammoBarWidth;
  float maxAmmoBarWidth;
  float barHeight;
  
  Game()
  {
    atStart = true;
    atEnd = false;
    second = 1000;
    healthBarWidth = width / 4.0f;
    maxHealthBarWidth = width / 4.0f;
    ammoBarWidth = width / 6.0f;
    maxAmmoBarWidth = width / 6.0f;
    barHeight = height / 40.0f;
  }
  
  void setupGame()
  {
    gameObjects = new ArrayList<GameObject>();
    
    start = new StartScreen();
    end = new EndScreen();
    
    pShip1 = new LightShip('W', 'A', 'D', 'S', true);
    //pShip1 = new MediumShip('W', 'A', 'D', 'S', true);
    //pShip1 = new HeavyShip('W', 'A', 'D', 'S', true);
    
    pShip2 = new MediumShip('I', 'J', 'L', 'K', false);
    
    gameObjects.add(pShip1);
    gameObjects.add(pShip2);
  }
}
