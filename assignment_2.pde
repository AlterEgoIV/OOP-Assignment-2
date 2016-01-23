// Two Player
GameObject ship;
GameObject enemy;
ArrayList<GameObject> gameObjects = new ArrayList<GameObject>();
boolean[] keys = new boolean[512];

void setup()
{
  size(800, 600);
  
  ship = new Ship();
  gameObjects.add(ship);
  enemy = new EnemyShip();
  gameObjects.add(enemy);
}

void draw()
{
  background(0);
  
  for(int i = gameObjects.size() - 1; i >= 0; i --)
  {
    GameObject obj = gameObjects.get(i);
    obj.update();
    obj.render();
  }
  
  // checkCollisions();
}

void keyPressed()
{
  keys[keyCode] = true;
}

void keyReleased()
{
  keys[keyCode] = false;
}

/*void checkCollisions()
{
  shipCollisions();
}

void shipCollisions()
{
  // Go through all objects
  for(int i = gameObjects.size() - 1; i >= 0; i--)
  {
    // Instantiate object 
    GameObject obj1 = gameObjects.get(i);
    
    // If object is a ship
    if(obj1 instanceof Ship)
    {
      // Check all other objects
      for(int j = gameObjects.size() - 1; j >= 0; j--)
      {
        // Instantiate another object
        GameObject obj2 = gameObjects.get(j);
        
        // If any other objects are an enemy ship
        if(obj2 instanceof EnemyShip) // Check the type of an object
        {
          // Bounding circle collisions
          if(obj1.pos.dist(obj2.pos) < obj1.halfW + obj2.halfW)
          {
            // gameObjects.remove(obj2);
            
            if(obj2.pos.x > obj1.pos.x)
            {
              obj2.pos.x = obj1.pos.x + obj2.w;
            }
            
            if(obj2.pos.x < obj1.pos.x)
            {
              obj2.pos.x = obj1.pos.x - obj2.w;
            }
          }
        }
      }
    }
  } 
}*/
