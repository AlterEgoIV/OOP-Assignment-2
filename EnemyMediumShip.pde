class EnemyMediumShip extends EnemyShip
{
  EnemyMediumShip()
  {
    pos = new PVector(width - (width / 20.0f), height - (height / 4.0f));
    forward = new PVector(-1, 0);
    theta = PI;
    c = color(255, 0, 0);
    speed = 3.0f;
    health = 20;
    maxHealth = 20;
    ammo = 50;
    maxAmmo = 50;
  }
  
  void fire()
  {
    forward.x = cos(theta);
    forward.y = sin(theta);
    
    if(ammo > 0)
    {
      Bullet bullet = new Bullet();
      
      bullet.pos.x = pos.x;
      bullet.pos.y = pos.y;
      bullet.pos.add(PVector.mult(forward, halfW + 1));
      bullet.theta = theta;
      bullet.speed = speed * 3;
      bullet.c = c;
      bullet.enemyProjectile = true;
      
      gameObjects.add(bullet);
      
      ammo--;
      
      elapsed = millis();
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
      
    // Enemy Health Bar
    fill(0);
    rect(width, 0, -game.maxHealthBarWidth, game.barHeight);
    fill(0, 200, 0);
    rect(width, 0, -game.healthBarWidth, game.barHeight);
      
    // Enemy Ammo Bar
    fill(0);
    rect(width, game.barHeight, -game.maxAmmoBarWidth, game.barHeight);
    fill(200, 0, 0);
    rect(width, game.barHeight, -game.ammoBarWidth, game.barHeight);
  }
}
