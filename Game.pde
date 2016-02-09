class Game
{
  boolean atStart;
  boolean atSelect;
  boolean atEnd;
  int second;
  int random;
  int time;
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
    random = 0;
    time = 0;
    healthBarWidth = width / 4.0f;
    maxHealthBarWidth = width / 4.0f;
    ammoBarWidth = width / 6.0f;
    maxAmmoBarWidth = width / 6.0f;
    barHeight = height / 40.0f;
  }
  
  void setupGame()
  {
    strokeWeight(1);
    
    gameObjects = new ArrayList<GameObject>();
    
    start = new StartScreen();
    select = new SelectScreen();
    end = new EndScreen();
    effect = new BackgroundEffect();
    time = 0;
  }
}
