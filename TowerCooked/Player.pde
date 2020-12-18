class Player{
  Inventory inventory = new Inventory();
  
  int xPos;
  int yPos;
  int xSpeed = 1;
  int ySpeed = 1;
  
  // Movement booleans
  boolean moveLeft = false;
  boolean moveRight = false;
  boolean moveUp = false;
  boolean moveDown = false;
  
  Player(int tempX, int tempY){
    xPos = tempX;
    yPos = tempY;
  }
  
  void display(){
     ellipse(xPos, yPos, 10, 10);   
     inventory.display();
  }
  
  void update(){
    // Movement
     if(moveLeft){
        xPos -= xSpeed; 
     }
     if(moveRight){
        xPos += xSpeed; 
     }
     if(moveUp){
        yPos -= ySpeed; 
     }
     if(moveDown){
        yPos += ySpeed; 
     }
  }
  
  void pickUp(){
   
  }
  
  void keyPressEvent(char theKey){
    if(theKey == 'W' || theKey == 'w'){
      moveUp = true;
    }
    if(theKey == 'S' || theKey == 's'){
      moveDown = true;
    }
    if(theKey == 'A' || theKey == 'a'){
      moveLeft = true;
    }
    if(theKey == 'D' || theKey == 'd'){
      moveRight = true;
    }
  }
  
  void keyReleaseEvent(char theKey){
    if(theKey == 'W' || theKey == 'w'){
      moveUp = false;
    }
    if(theKey == 'S' || theKey == 's'){
      moveDown = false;
    }
    if(theKey == 'A' || theKey == 'a'){
      moveLeft = false;
    }
    if(theKey == 'D' || theKey == 'd'){
      moveRight = false;
    }
  }
  
}
