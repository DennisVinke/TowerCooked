Player player;

void setup(){
   player = new Player(50, 50);
}

void draw(){
  player.display();
}

void keyPressed(){
  player.keyEvent(key);    
}
