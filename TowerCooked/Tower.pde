class Tower extends Building {

  final int size = 16;

  boolean isBuilt;
  boolean isLoaded;
  
  // CANNON FACING DIRECTION -- USES ENUM
  int faceDir;

  Tower(int tempX, int tempY) {
    super(tempX, tempY);
  }

  void display() {
    rect(xPos, yPos, size, size);
  }
  
  void update(ArrayList<Enemy> enemies){
     faceDir = changeDir(enemies); 
  }

  void changeDir(ArrayList<Enemy> enemies){
      Enemy enemy = closestEnemy(enemies);
      int newDir = NORTH;
      
      return newDir;
}

  void construct() {
    isBuilt = true;
  }

  void loadCannon() {
    if (isBuilt) {
      isLoaded = true;
    } else {
      println("Construct tower first.");
    }
  }

  void fireCannon() {
    if (isBuilt) {
      isLoaded = false;
    } else {
      println("Construct tower first.");
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
