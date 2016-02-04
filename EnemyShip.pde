abstract class EnemyShip extends Ship
{
  boolean healthDropAvailable;
  boolean ammoDropAvailable;
  boolean searchingForAmmo;
  boolean evading;
  
  EnemyShip()
  {
    healthDropAvailable = false;
    ammoDropAvailable = false;
    searchingForAmmo = false;
    evading = false;
    ammo = 10;
    maxAmmo = 10;
  }
}
