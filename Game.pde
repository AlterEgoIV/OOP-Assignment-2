class Game
{
  boolean atStart;
  boolean inGame;
  boolean atEnd;
  int elapsed;
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
    elapsed = 0;
    second = 1000;
    frame = 1; 
    healthBarWidth = width / 4.0f;
    maxHealthBarWidth = width / 4.0f;
    ammoBarWidth = width / 6.0f;
    maxAmmoBarWidth = width / 6.0f;
    barHeight = height / 40.0f;
  }
}
