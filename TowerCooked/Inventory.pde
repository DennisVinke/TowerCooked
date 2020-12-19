class Inventory {
  Item item;
  int playerNumber;
  // GUI
  int size;
  int xOffset = 5;
  int yOffset = 5;

  Inventory(int tempNumber) {
    size = 50;
    playerNumber = tempNumber;
  }

  void display() {
    // DISPLAY LEFT
    if (playerNumber == 0) {
      rect(0 + xOffset, height-size-yOffset, size, size);
    }

    // DISPLAY RIGHT
    if (playerNumber == 1) {
      rect(width - size - xOffset, height - size - yOffset, size, size);
    }
  }

  void addItem(Item tempItem) {
    item = tempItem;
  }
}
