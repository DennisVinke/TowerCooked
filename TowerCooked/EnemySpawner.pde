// PARTICLE SYSTEM TAKING CARE OF ENEMY NUMBER
class EnemySpawner {
  int enemyNumber;
  int currentEnemyNumber = 0;
  ArrayList<Enemy> enemies;

  int xPos;
  int yPos;
  final int cellSize = 16;

  EnemySpawner(int tempX, int tempY) {
    xPos = tempX;
    yPos = tempY;
    enemies = new ArrayList<Enemy>();
  }

  // MAKESHIFT DISPLAY
  void display() {
    fill(#FF0000); 
    rect(xPos, yPos, cellSize, cellSize);
    fill(#FFFFFF);
  }

  void run() {
    for (int i = enemies.size() -1; i >= 0; i--) {
      Enemy e = enemies.get(i);  
      e.display();
      e.update();
      if (e.isDead()) {
        CollisionManager.removeFromGameObjects(enemies.get(i));
        enemies.remove(i);
      }
    }
  }

  void addEnemy(Base base) {
    // int randX = (int) random(400);
    // int randY = (int) random(400);
    enemies.add(new Enemy(xPos, yPos, base.xPos, base.yPos));
    CollisionManager.addToGameObjects(enemies.get(enemies.size()-1));
  }
}
