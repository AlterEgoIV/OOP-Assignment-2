class Game
{
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
    elapsed = 0;
    second = 1000;
    frame = 1; 
    healthBarWidth = width / 4;
    maxHealthBarWidth = width / 4;
    ammoBarWidth = width / 6;
    maxAmmoBarWidth = width / 6;
    barHeight = height / 40;
  }
}
