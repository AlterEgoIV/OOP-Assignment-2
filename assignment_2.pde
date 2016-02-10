/*
Music Credits:

"Voice Over Under" Kevin MacLeod (incompetech.com)
Licensed under Creative Commons: By Attribution 3.0 License
http://creativecommons.org/licenses/by/3.0/

"Ouroboros" Kevin MacLeod (incompetech.com)
Licensed under Creative Commons: By Attribution 3.0 License
http://creativecommons.org/licenses/by/3.0/
*/

import ddf.minim.*;
Minim minim;
AudioPlayer ouroboros, vou;
Game game;
Screen start;
Screen select;
Screen end;
GameObject pShip, eShip;
BackgroundEffect effect;
ArrayList<GameObject> gameObjects;
ArrayList<Float> distance = new ArrayList<Float>();
boolean[] keys = new boolean[1024];

void setup()
{
  size(1200, 800);
  
  minim = new Minim(this);
  
  ouroboros = minim.loadFile("Ouroboros.mp3");
  vou = minim.loadFile("Voice Over Under.mp3");
  
  game = new Game();
  game.setupGame();
}

void draw()
{
  background(0);
  
  if(game.atStart)
  {
    if(!vou.isPlaying())
    {
      vou.rewind();
      vou.play();
    }
    
    effect.update();
    effect.render();
    start.display();
    start.select();
  }
  else if(game.atSelect)
  {
    if(!vou.isPlaying())
    {
      vou.rewind();
      vou.play();
    }
    
    effect.update();
    effect.render();
    select.display();
    select.select();
  }
  else if(game.atEnd)
  {
    if(!vou.isPlaying())
    {
      vou.rewind();
      vou.play();
    }
    
    effect.update();
    effect.render();
    end.display();
    end.select();
  }
  else
  {
    vou.pause();
    
    if(!ouroboros.isPlaying())
    {
      ouroboros.rewind();
      ouroboros.play();
    }
    
    GameObject star = new Star();
    gameObjects.add(star);

    // Spawn Drop once every 2 seconds
    if(frameCount % 120 == 0)
    {
      GameObject healthDrop = new HealthDrop();
      gameObjects.add(healthDrop);
      GameObject ammoDrop = new AmmoDrop();
      gameObjects.add(ammoDrop);
    }
    
    for(int i = gameObjects.size() - 1; i >= 0; --i)
    {
      GameObject obj = gameObjects.get(i);
      
      if(obj != null)
      {
        if(game.time > 120)
        {
          obj.update();
        }
        
        obj.render();
      }
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
