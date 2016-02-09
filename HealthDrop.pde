class HealthDrop extends Drop
{
  HealthDrop()
  {
    c = color(0, 255, 0);
  }
  
  void update()
  { 
    move();
    detectCollisions();
    removeDrop();
  }
  
  void detectCollisions()
  {
    for(int i = gameObjects.size() - 1; i >= 0; --i)
    {
      GameObject obj = gameObjects.get(i);
      
      if(obj instanceof PlayerShip)
      {
        if(dist(pos.x, pos.y, ((PlayerShip)obj).pos.x, ((PlayerShip)obj).pos.y) < halfW + ((PlayerShip)obj).halfW)
        {
          if(((PlayerShip)obj).health < ((PlayerShip)obj).maxHealth)
          {
            ((PlayerShip)obj).health += 7;
            
            if(((PlayerShip)obj).health > ((PlayerShip)obj).maxHealth)
            {
              ((PlayerShip)obj).health = ((PlayerShip)obj).maxHealth;
            }
            
            gameObjects.remove(this);
          }
        }
      }
      
      if(obj instanceof EnemyShip)
      {
        if(dist(pos.x, pos.y, ((EnemyShip)obj).pos.x, ((EnemyShip)obj).pos.y) < halfW + ((EnemyShip)obj).halfW)
        {
          if(((EnemyShip)obj).health < ((EnemyShip)obj).maxHealth)
          {
            ((EnemyShip)obj).health += 3;
            
            if(((EnemyShip)obj).health > ((EnemyShip)obj).maxHealth)
            {
              ((EnemyShip)obj).health = ((EnemyShip)obj).maxHealth;
            }
            
            gameObjects.remove(this);
          }
        }
      }
    }
  }
  
  void render()
  {
    stroke(255);
    fill(c);
    pushMatrix();
    translate(pos.x, pos.y);
    rotate(theta);
    rect(-halfW, -halfW, w, w);
    popMatrix();
  }
}
