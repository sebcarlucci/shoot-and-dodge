class Block {
  
  PVector pos = new PVector(random(width),random(height));
  float size = random(20,50);
  
  Block(){
  }
  
  void show() {
    ellipse(pos.x,pos.y,size,size);
    if(hitTarget()) {
      for( int i = 0; i < blocks.size() ; i++) {
        if (blocks.get(i) == this) blocks.remove(i);  
      }  
    }
  }
  
   boolean hitTarget() {
    for (int i = 0; i < bullets.size(); i++){
      if (dist(pos.x,pos.y,bullets.get(i).pos.x,bullets.get(i).pos.y) <= size + bullets.get(i).size - 10) {
        score += 1000.0/size;
        return true;
      }
    }
    return false;
  }
  
}