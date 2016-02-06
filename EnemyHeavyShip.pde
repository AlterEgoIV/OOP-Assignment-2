class EnemyHeavyShip extends EnemyShip
{
  EnemyHeavyShip()
  {
    pos = new PVector(width - (width / 20.0f), height - (height / 4.0f));
    forward = new PVector(-1, 0);
    theta = PI;
    c = color(255, 0, 0);
    speed = 1.0f;
    health = 30;
    maxHealth = 30;
  }
  
  void fire()
  {
    forward.x = cos(theta);
    forward.y = sin(theta);
    
    if(ammo >= 5 && millis() - elapsed > game.second)
    {
      Energyball eb = new Energyball();
      
      eb.pos.x = pos.x;
      eb.pos.y = pos.y;
      eb.pos.add(PVector.mult(forward, halfW + 1));
      eb.theta = theta;
      eb.speed = speed * 5;
      eb.c = c;
      eb.playerProjectile = true;
      
      gameObjects.add(eb);
      
      ammo -= 5;
      
      elapsed = millis();
    }
  }

  void render()
  {
    fill(0);
    stroke(c);
    pushMatrix();
    translate(pos.x, pos.y);
    rotate(theta);
    strokeWeight(3);
    ellipse(0, 0, w, w);
    strokeWeight(1);
    line(-halfW, -halfW, halfW + 5, 0); // Outside Left
    line(-halfW, halfW, halfW + 5, 0); // Outside Right
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
