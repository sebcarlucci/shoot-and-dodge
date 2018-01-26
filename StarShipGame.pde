Ship ship;

// Store the keys in an array for smooth movement
boolean arrowKeys[] = new boolean[3];

// Store the objects in the game, so they can be accessed
ArrayList<Bullet> bullets = new ArrayList<Bullet>();
ArrayList<Block> blocks = new ArrayList<Block>();

// Set the beggining conditions
float level = 1;
int score = 0;

// Set up the window, and generates 5 random blocks
void setup() {
  size(800,650);
  ship = new Ship();
  for(int i = 0; i < 5; i++) {
    blocks.add(new Block());
  }
}

// Function re-draws the canvas
void draw() {
  background(51);
  text(score,10,10); // Displays the score on the top left
  ship.show();
  
  // Show all the bullets
  for(int i = 0; i< bullets.size(); i++){
    bullets.get(i).show();
  }
  
  // Show all the blocks
  for( int i = 0 ; i < blocks.size(); i++){
    blocks.get(i).show(); 
  }
  
  // If the player eliminates every block, the add new ones
  if (blocks.size() < 1) {
   for (int i = 0 ; i < 5 + level ; i++){
     blocks.add(new Block());
   }
   level++; // Increase level
  }
}

// Listener for arrow keys
 void keyPressed(){
  switch(keyCode) {
    case RIGHT : arrowKeys[0] = true; break;
    case LEFT : arrowKeys[1] = true; break;
    case UP : arrowKeys[2] = true; break;
  }
  }
  
  void keyReleased(){
    if (keyCode == RIGHT) arrowKeys[0] = false;
    else if (keyCode == LEFT) arrowKeys[1] = false;
    else if (keyCode == UP) arrowKeys[2] = false;
    
      if (key == ' ') {
        // If the player presses space, then shoot a bullet from the ship's pos
        PVector currentPos = new PVector(ship.pos.x,ship.pos.y);
        bullets.add(new Bullet(ship.angle, currentPos));
  }
  }
  
  
