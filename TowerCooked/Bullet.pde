class Bullet {
  int xPos;
  int yPos;
  int xSpeed = 2;
  int ySpeed = 2;

  int size = 5;

  Bullet(int tempX, int tempY) {
    xPos = tempX;
    yPos = tempY;
  }

  void display() {
    ellipse(xPos, yPos, size, size);
  }

  void update() {
    // MOVEMENT
    xPos += xSpeed;
    yPos += ySpeed;
  }
  
  // CHECK IF CAN BE DELETED
  boolean isDead(){
     return xPos < 0 || xPos >= width || yPos < 0 || yPos >= height;
  }
}
