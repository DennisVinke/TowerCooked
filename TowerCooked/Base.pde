class Base extends Building {
  final int size = 32;
  color baseColor = 255;

  Base(int tempX, int tempY) {
    super(tempX, tempY);
  }

  void display() {

    fill(baseColor);
    rect(xPos, yPos, size, size);
    fill(#FFFFFF);
  }

  void update() {
    if (health <=0)  println("dying");
  }

  void collision(ArrayList<Enemy> enemies) {
    for (Enemy e : enemies) {

      if (e.inGoalProximity()) {
        health -= 10;
        e.health = 0;
        baseColor -= (100 - health);
      }
    }
  }
}
