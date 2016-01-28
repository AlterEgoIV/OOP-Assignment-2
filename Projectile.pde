abstract class Projectile extends GameObject
{
  int damage;
  
  Projectile()
  {
    damage = 0;
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
        
      if(obj instanceof Ship)
      {
        if(dist(pos.x, pos.y, obj.pos.x, obj.pos.y) < obj.halfW * 1.5)
        {
          gameObjects.remove(this);
          ((Ship)obj).health -= damage;
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
