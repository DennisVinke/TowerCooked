class Enemy {
  // STANDARD PARAMETERS
  int xPos;
  int yPos;

  final int xSpeed = 1;
  final int ySpeed = 1;

  final int size = 10;

  // TARGET
  int goalX;
  int goalY;

  // STATUS
  int health = 100;

  Enemy(int tempX, int tempY, int tempGoalX, int tempGoalY) {
    xPos = tempX;
    yPos = tempY;
    goalX = tempGoalX;
    goalY = tempGoalY;
  }

  void display() {
    ellipse(xPos, yPos, size, size);
  }

  void update() {
    int xDir;
    int yDir;

    // CALCULATE DIRECTION
    if (goalX >= xPos) {
      if (abs(goalX - xPos) > 1) xDir = 1;
      else xDir = 0;
    } else xDir = -1;

    if (goalY >= yPos) {
      if (abs(goalY - yPos) > 1) yDir = 1;
      else yDir = 0;
    } else yDir = -1;

    // AVOID JITTER
    xPos += xDir * xSpeed;
    yPos += yDir * ySpeed;
  }

  boolean inGoalProximity() {
    // DEFINE THRESHOLD
    int proximityThreshold = 5;

    // CALC THRESHOLD
    int accDistance = 0;
    accDistance += abs(xPos - goalX);
    accDistance += abs(yPos - goalY);
    return accDistance <= proximityThreshold;
  }

  boolean isDead() {
    return  health <= 0;
  }
}
