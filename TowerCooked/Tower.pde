class Tower extends Building {

  final int size = 16;

  boolean isBuilt = false;
  boolean isLoaded;

  ArrayList<Bullet> bullets = new ArrayList<Bullet>();

  // CANNON FACING DIRECTION -- USES ENUM
  Dir faceDir = Dir.NORTH;

  Tower(int tempX, int tempY) {
    super(tempX, tempY);
  }

  void display() {
    if (!isBuilt) {
      // UNDER CONSTRUCTION
      fill(#964B00);
    } else {
      // READY
      fill(#FFFFFF);
    }
    rect(xPos, yPos, size, size);
    
  }

  void update(ArrayList<Enemy> enemies) {
    // faceDir = changeDir(enemies);
    for (int i = bullets.size()-1; i >= 0; i--) {
      // THIS SHOULDNT BE HERE
      Bullet b = bullets.get(i);
      b.display(); 
      b.update();
      if (b.isDead()) {
        bullets.remove(i);
      }
    }
  }

  void changeDir(ArrayList<Enemy> enemies) {
    Enemy enemy = closestEnemy(enemies);
    // int newDir = NORTH;

    //  return newDir;
  }

  void construct() {
    isBuilt = true;
  }

  void interact(Inventory inventory) {
    if (isBuilt) {

      if (isLoaded) {
        println("Fire!");
        bullets.add(new Bullet(xPos, yPos));
      } else {
        if (inventory.hasItem()) {
          println("Loading!");
          inventory.removeItem();
          isLoaded = true;
        }
      }
    } else {
      construct();
    }
  }

  // RETURNS CLOSEST ENEMY BASED ON MAX DIST OR NULL
  Enemy closestEnemy(ArrayList<Enemy> enemies) {
    Enemy closestEnemy;
    int minDist = -1;
    int dist = -1;

    // DEFAULT VALUE
    if (enemies.isEmpty()) {
      closestEnemy = null;
    } else {
      closestEnemy = enemies.get(0);
      minDist = abs(closestEnemy.xPos - xPos) + abs(closestEnemy.yPos - yPos);
    }

    // CHECK REMAINING ENEMIES
    for (Enemy e : enemies) {
      dist =  abs(e.xPos - xPos) + abs(e.yPos - yPos);
      if (dist < minDist) {
        minDist = dist;
        closestEnemy = e;
      }
    }

    return closestEnemy;
  }
}
