class Bullet {

  float angle;
  PVector pos;
  PVector startPos;
  float size = 5;
  
  Bullet(float angle, PVector pos) {
    this.angle = angle;
    this.pos = pos;
    startPos = pos;
  }
  
  void show() {
    pushMatrix();
    move();
    ellipse(pos.x + 30*sin(angle), pos.y-30*cos(angle), size, size);
    deSpawn();
    popMatrix();
  }
  
  void move() {
   pos.add(5*2*sin(angle),-5*2*cos(angle));
  }
  
  void deSpawn() {
    if (pos.x == width || pos.x == 0 || pos.y == 0 || pos.y == height){
      for (int i = 0; i < bullets.size() ; i++) {
        if (bullets.get(i) == this){
          bullets.remove(i);
          break;
      }
     }
    }
   }
  }