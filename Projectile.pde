abstract class Projectile extends GameObject
{
  int damage;
  boolean playerProjectile;
  boolean enemyProjectile;
  
  Projectile()
  {
    damage = 0;
    playerProjectile = false;
    enemyProjectile = false;
  }
  
  void update()
  {
    move();
    detectCollisions();
    removeProjectile();
  }
  
  void move()
  {
    forward.x = cos(theta);
    forward.y = sin(theta);
    forward.mult(speed);
    pos.add(forward);
  }
  
  void detectCollisions()
  {
    for(int i = gameObjects.size() - 1; i >= 0; --i)
    {
      GameObject obj = gameObjects.get(i);
        
      if(obj instanceof EnemyShip && playerProjectile)
      {
        if(dist(pos.x, pos.y, obj.pos.x, obj.pos.y) < obj.halfW)
        {
          gameObjects.remove(this);
          ((EnemyShip)obj).health -= damage;
        }
      }
      
      if(obj instanceof PlayerShip && enemyProjectile)
      {
        if(dist(pos.x, pos.y, obj.pos.x, obj.pos.y) < obj.halfW)
        {
          gameObjects.remove(this);
          //((PlayerShip)obj).health -= damage;
        }
      }
    }
  }
  
  void removeProjectile()
  {
    if(pos.x < 0 || pos.x > width || pos.y < 0 || pos.y > height)
    {
      gameObjects.remove(this);
    }
  }
}
