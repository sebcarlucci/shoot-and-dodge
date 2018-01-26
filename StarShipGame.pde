Ship ship;
boolean arrowKeys[] = new boolean[3];
ArrayList<Bullet> bullets = new ArrayList<Bullet>();
ArrayList<Block> blocks = new ArrayList<Block>();
float level = 1;
int score = 0;

void setup() {
  size(800,650);
  ship = new Ship();
  for(int i = 0; i < 5; i++) {
    blocks.add(new Block());
  }
}

void draw() {
  background(51);
  text(score,10,10);
  ship.show();
  for( int i = 0; i< bullets.size(); i++){
    bullets.get(i).show();
  }
  for( int i = 0 ; i < blocks.size(); i++){
    blocks.get(i).show(); 
  }
  if (blocks.size() < 1) {
   for (int i = 0 ; i < 5 + level ; i++){
     blocks.add(new Block());
   }
   level++;
  }
}

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
        PVector currentPos = new PVector(ship.pos.x,ship.pos.y);
    bullets.add(new Bullet(ship.angle, currentPos));
  }
  }
  
  