class Inventory {
  Item item;
  int playerNumber;
  // GUI
  int size;

  int xPos;
  int yPos;
  int xOffset = 5;
  int yOffset = 5;

  Inventory(int tempNumber) {
    size = 50;
    playerNumber = tempNumber;
    if (playerNumber == 0) {
      xPos = 0 + xOffset;
      yPos = height - size - yOffset;
    } else {
      xPos = width - size - xOffset;
      yPos = height - size - yOffset;
    }
  }

  void display() {
    // DISPLAY LEFT
    fill(#FFFFFF);
    rect(xPos, yPos, size, size);
    if (item!=null) item.displayInInventory(xPos, yPos);

  }
  
  void addItem(Item tempItem) {
    item = tempItem;
  }
  
  boolean hasItem(){
    return item != null; 
  }
  
  void removeItem(){
     item = null; 
  }
}
