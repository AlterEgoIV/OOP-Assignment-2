class PlayerMediumShip extends PlayerShip
{
  PlayerMediumShip()
  {
    pos = new PVector(width / 20.0f, height / 4.0f);
    forward = new PVector(1, 0);
    theta = radians(0.0f);
    c = color(0, 190, 255);
    speed = 4.0f;
    health = 20;
    maxHealth = 20;
    ammo = 50;
    maxAmmo = 50;
  }
  
  void fire()
  { 
    if(keys[' '] && ammo > 0)
    {
      canMove = false;
      
      Laserbeam lb = new Laserbeam();
      
      lb.pos.x = pos.x;
      lb.pos.y = pos.y;
      lb.pos.add(PVector.mult(forward, halfW + 1));
      lb.theta = theta;
      lb.speed = speed * 3;
      lb.c = c;
      lb.playerProjectile = true;
      
      gameObjects.add(lb);
      
      ammo--;
    }
    else
    {
      canMove = true;
    }
  }
  
  void render()
  {
    stroke(c);
    pushMatrix();
    translate(pos.x, pos.y);
    rotate(theta);
    line(-halfW, -halfW, halfW, 0); // Outside Left
    line(-halfW, halfW, halfW, 0); // Outside Right
    line(-halfW, -halfW, 0, 0); // Inside Left
    line(-halfW, halfW, 0, 0); // Inside Right
    popMatrix();
    
    game.healthBarWidth = map(health, 0, maxHealth, 0, game.maxHealthBarWidth);
    game.ammoBarWidth = map(ammo, 0, maxAmmo, 0, game.maxAmmoBarWidth);

    stroke(255);
      
    // Player Health Bar
    fill(0);
    rect(0, 0, game.maxHealthBarWidth, game.barHeight);
    fill(0, 200, 0);
    rect(0, 0, game.healthBarWidth, game.barHeight);
      
    // Player Ammo Bar
    fill(0);
    rect(0, game.barHeight, game.maxAmmoBarWidth, game.barHeight);
    fill(200, 0, 0);
    rect(0, game.barHeight, game.ammoBarWidth, game.barHeight);
  }
}
