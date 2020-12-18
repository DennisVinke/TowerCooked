class Player{
  int xPos;
  int yPos;
  int xSpeed = 1;
  int ySpeed = 1;
  
  Player(int tempX, int tempY){
    xPos = tempX;
    yPos = tempY;
  }
  
  void display(){
     ellipse(xPos, yPos, 10, 10);   
  }
  
  void keyEvent(char theKey){
     switch(theKey){
       // Movement
       case 'W':
       case 'w': yPos -= ySpeed; break;
       
       case 'A':
       case 'a': xPos -= xSpeed; break;
       
       case 'S':
       case 's': yPos += ySpeed; break;
       
       case 'D':
       case 'd': xPos += xSpeed; break;
     }
  }
  
}
