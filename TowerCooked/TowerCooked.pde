//world
//array --> map tiles
//grid based
//camera movement

public static final int GAME_WIDTH = 800;
public static final int GAME_HEIGHT = 600;

Player player;
Item item;
static Resources resources;
World level1;

void settings() {
  size(GAME_WIDTH, GAME_HEIGHT);
}

void setup() {
  item  = new Item();
  player = new Player(50, 50);
  resources = new Resources();
  resources.populateTileMap();
  level1 = new World("./data/levels/level1.txt");
}

void draw() {
  background(255);
  pushMatrix();
  scale(2);
  // All things player
  player.display();
  player.update();

  item.display();
  drawGrid(16);
  level1.drawWorld();
  //resources.drawAllResources();
  popMatrix();
}

void keyPressed() {
  player.keyPressEvent(key);
}

void keyReleased() {
  player.keyReleaseEvent(key);
}

void drawGrid(int gridSize) {
  for (int i =0; i*gridSize<GAME_WIDTH; i++) {
    for (int j =0; j*gridSize<GAME_HEIGHT; j++) {
      noFill();
      rect(i*gridSize, j*gridSize, gridSize, gridSize);
    }
  }
}

void loadLevel(){
}
