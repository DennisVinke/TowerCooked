//world
//array --> map tiles
//grid based
//camera movement

public static final int GAME_WIDTH = 800;
public static final int GAME_HEIGHT = 600;
Player player;
Item item;
void settings(){
  size(GAME_WIDTH, GAME_HEIGHT);
}

void setup(){
  item  = new Item();
  player = new Player(50, 50);
}

void draw(){
  background(255);
  
  // All things player
  player.display();
  player.update();
  
  item.display();
}

void keyPressed(){
  player.keyPressEvent(key);    
}

void keyReleased(){
  player.keyReleaseEvent(key);
}
