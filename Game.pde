class Game
{
  boolean atStart;
  boolean atSelect;
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
    atSelect = false;
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
    select = new SelectScreen();
    end = new EndScreen();
    
    // pShip = new PlayerLightShip();
    pShip = new PlayerMediumShip();
    // pShip = new PlayerHeavyShip();
    
    eShip = new EnemyLightShip();
    // eShip = new EnemyMediumShip();
    // eShip = new EnemyHeavyShip();
    
    gameObjects.add(pShip);
    gameObjects.add(eShip);
  }
}
