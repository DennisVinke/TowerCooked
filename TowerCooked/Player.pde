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
       case 'w': y -= ySpeed; break;
       
       case 'A':
       case 'a': x -= xSpeed; break;
       
       case 'S':
       case 's': y += ySpeed; break;
       
       case 'D':
       case 'd': x += xSpeed; break;
     }
  }
  
}
