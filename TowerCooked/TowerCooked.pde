//world
//array --> map tiles
//grid based
//camera movement

public static final int GAME_WIDTH = 800;
public static final int GAME_HEIGHT = 600;
Player playerOne;
Player playerTwo;
Item item;
void settings(){
  size(GAME_WIDTH, GAME_HEIGHT);
}

void setup(){
  item  = new Item(10, 10);
  playerOne = new Player(50, 50, 0);
  playerTwo = new Player(100, 100, 1);
}

void draw(){
  background(255);
  
  // PLAYER
  playerOne.display();
  playerTwo.display();
  playerOne.update();
  playerTwo.update();
  
  // ITEM
  item.display();
}

void keyPressed(){
  playerOne.keyPressEvent(key);
  playerTwo.keyPressEvent(key);    
}

void keyReleased(){
  playerOne.keyReleaseEvent(key);
  playerTwo.keyReleaseEvent(key);
}
