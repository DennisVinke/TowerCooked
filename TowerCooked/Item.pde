class Item {
  int xPos;
  int yPos;

  boolean pickedUp = false;

  Item(int tempX, int tempY) {
    xPos = tempX;
    yPos = tempY;
  }

  void display() {
    if (!pickedUp) {
      fill(#423942);
      ellipse(xPos, yPos, 10, 10); 
      fill(#FFFFFF);
    }
  }

  void displayInInventory(int xPos, int yPos) {
    int xOffset = 24;
    int yOffset = 24;
    fill(#423942);
    ellipse(xPos + xOffset, yPos + yOffset, 10, 10); 
    fill(#FFFFFF);
  }

  void setPickedUp() {
    pickedUp = true;
  }
}
