class Item{
  int xPos;
  int yPos;
  
  Item(int tempX, int tempY){
     xPos = tempX;
     yPos = tempY;
  }
  
  void display(){
    fill(#423942);
    ellipse(xPos, yPos, 10, 10); 
    fill(#FFFFFF);
  }
}
