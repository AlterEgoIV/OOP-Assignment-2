class PlayerHeavyShip extends PlayerShip
{
  PlayerHeavyShip()
  {
    pos = new PVector(width / 20.0f, height / 4.0f);
    forward = new PVector(1, 0);
    theta = radians(0.0f);
    c = color(0, 190, 255);
    speed = 2.0f;
    health = 40;
    maxHealth = 40;
    ammo = 40;
    maxAmmo = 40;
    isPlayer = true;
  }
  
  void fire()
  {
    if(keys[' '] && ammo >= 5 && millis() - elapsed > game.second / 2)
    {
      Energyball eb = new Energyball();
      
      eb.pos.x = pos.x;
      eb.pos.y = pos.y;
      eb.pos.add(PVector.mult(forward, halfW + 1));
      eb.theta = theta;
      eb.speed = speed * 8;
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
    strokeWeight(2);
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
