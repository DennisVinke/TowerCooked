
int GAME_WIDTH = 200;
int GAME_HEIGHT = 200;
Player player;
void settings(){
    size(GAME_WIDTH, GAME_HEIGHT);
}

void setup(){

  player = new Player(50, 50);
}

void draw(){
  background(255);
  player.display();
}

void keyPressed(){
  player.keyEvent(key);    
}
