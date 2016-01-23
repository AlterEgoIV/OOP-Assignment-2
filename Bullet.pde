class Bullet extends GameObject
{
  boolean hit;
  
  Bullet()
  {
    pos = new PVector(ship.pos.x, ship.pos.y);
    forward = new PVector(ship.forward.x, ship.forward.y);
    theta = ship.theta;
    speed = ship.speed;
    hit = false;
  }
  
  void update()
  {
    pos.add(PVector.mult(forward, 3));
    
    detectCollisions();
  }
  
  void detectCollisions()
  {
    for(int i = 0; i < gameObjects.size() - 1; i++)
    {
      GameObject obj = gameObjects.get(i);
      
      if(obj instanceof EnemyShip)
      {
        if(dist(pos.x, pos.y, obj.pos.x, obj.pos.y) < obj.halfW)
        {
          obj.health -= 0.5;
          hit = true;
        }
      }
    }
  }
  
  void render()
  {
    if(hit == false)
    {
      stroke(c);
      pushMatrix();
      translate(pos.x, pos.y);
      rotate(theta);
      line(-5, 0, 5, 0);
      popMatrix();
    }
  }
}
