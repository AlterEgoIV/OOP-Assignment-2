class EnemyLightShip extends EnemyShip
{
  EnemyLightShip()
  {
    pos = new PVector(width - (width / 20.0f), height - (height / 4.0f));
    forward = new PVector(-1, 0);
    theta = PI;
    c = color(255, 0, 0);
    speed = 4.0f;
    health = 15;
    maxHealth = 15;
    ammo = 30;
    maxAmmo = 30;
  }
  
  void fire()
  {
    forward.x = cos(theta);
    forward.y = sin(theta);
    
    if(ammo > 0 && millis() - elapsed > game.second / 10)
    {
      Bullet bullet = new Bullet();
      
      bullet.pos.x = pos.x;
      bullet.pos.y = pos.y;
      bullet.pos.add(PVector.mult(forward, halfW + 1));
      bullet.theta = theta;
      bullet.speed = speed * 4;
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
    fill(c);
    triangle(0, -halfW / 2, 0, halfW / 2, halfW, 0); // front
    triangle(0, -halfW / 2, 0, halfW / 2, -halfW, 0); // back
    fill(0);
    triangle(-halfW, 0, 0, -halfW / 2, -halfW - (halfW / 2), -halfW); // left
    triangle(-halfW, 0, 0, halfW / 2, -halfW - (halfW / 2), halfW); // right
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
