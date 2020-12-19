//world
//array --> map tiles
//grid based
//camera movement
public static final int GAME_WIDTH = 800;
public static final int GAME_HEIGHT = 600;
public static final int PIXELSIZE = 16;
GameState gameState = GameState.MENU;
boolean showDebug = !true;

GameMenu mainMenu;
LevelEditor levelEditor;

Player playerOne;
Player playerTwo;

Item item;
static Resources resources;
World level1;

void settings() {
  size(GAME_WIDTH, GAME_HEIGHT);
}

void setup() {

  mainMenu = new GameMenu(gameState);
  resources = new Resources();
  resources.populateTileMap();
  level1 = new World("./data/levels/level1.txt");
  levelEditor = new LevelEditor();
  
  item  = new Item(10, 10);
  playerOne = new Player(50, 50, 0);
  playerTwo = new Player(100, 100, 1);
  }

int scrolling = 0;
void draw() {
  switch(gameState) {
  case MENU:
    mainMenu.drawMenu();
    break;
  case LEVELEDITOR:
    levelEditor.drawLevelEditor();
    break;
  case TILEMAPDEBUG:
    background(255);
    pushMatrix();
    //scale(2);
    resources.drawAllResources();
    drawGrid(16);
    popMatrix();
    break;
  case PLAY :
    background(255);
    pushMatrix();
    //translate(playerOne.xPos, playerOne.yPos);
    //scale(2);

    drawGrid(16);
    level1.drawWorld();

    // All things player
    playerOne.display();
    playerTwo.display();
    playerOne.update();
    playerTwo.update();

    item.display();

    //resources.drawAllResources();
    popMatrix();
    break;
  }
  if (showDebug)
    drawDebug();
}

void keyPressed() {
  playerOne.keyPressEvent(key);
  playerTwo.keyPressEvent(key);
}

void keyReleased() {
  playerOne.keyReleaseEvent(key);
  playerTwo.keyReleaseEvent(key);
}

void drawGrid(int gridSize) {
  for (int i =0; i*gridSize<GAME_WIDTH; i++) {
    for (int j =0; j*gridSize<GAME_HEIGHT; j++) {
      noFill();
      rect(i*gridSize, j*gridSize, gridSize, gridSize);
    }
  }
}

void loadLevel() {
}

void drawMenu() {
  fill(200, 50, 12);
  rect(0, 0, GAME_WIDTH, GAME_HEIGHT);
}

void drawDebug() {
  fill(122);
  rect(0, 0, 150, 50);
  fill(0);
  text("GameState: "+gameState.name(), 20, 20);
}

void mousePressed() {
  if (gameState == GameState.MENU) {
    mainMenu.handleButtons(mouseX, mouseY);
  }
  if (gameState == GameState.TILEMAPDEBUG){
    String mKey = ""+((mouseX/PIXELSIZE) + (mouseY/16)*PIXELSIZE);
    println(mKey);
    //resources.get
  }
}
