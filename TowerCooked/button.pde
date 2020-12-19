class Button {
  int xPos;
  int yPos;
  int buttonWidth;
  int buttonHeight;
  String text;

  Button(int x, int y, int bW, int bH, String t) {
    xPos = x;
    yPos = y;
    buttonWidth = bW;
    buttonHeight = bH;
    text = t;
  }
  
  void drawButton(){
    fill(200,200,200);
    rect(xPos, yPos, buttonWidth, buttonHeight);
    text(text, xPos, yPos);
  }

  boolean isOver(int mX, int mY) {
    if (mX >= xPos &&                 // right of the left edge AND
      mX <= xPos + buttonWidth &&    // left of the right edge AND
      mY >= yPos &&                   // below the top AND
      mY <= yPos + buttonHeight) {              // above the bottom
      return true;
    }
    return false;
  }
}
