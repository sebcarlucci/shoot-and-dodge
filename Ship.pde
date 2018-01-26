

class Ship {
  PVector pos = new PVector(width/2,height/2);
  PVector vel = new PVector(0,0);
  PVector acc = new PVector(0,0);
  float r = 30;
  float speed = 3;
  float angle = 0;
  float rotation = 0;
  float force = 0.5;
  
  Ship() {
  }
  
  void show() {
    pushMatrix();
    translate(pos.x,pos.y);
    move();
    rotateAngle(rotation);
    stroke(255);
    noFill();
    triangle(-r,r,r,r,0,-r-10);
    popMatrix();
  }
   
   void rotateAngle(float rotation){
     if (arrowKeys[0]) rotation = 0.05;
     if (arrowKeys [1]) rotation = -0.05;
     angle += rotation;
     rotate(angle);
   }
   
   void move() {
     if(arrowKeys[2])
     vel.add(force*sin(angle),force*-cos(angle));
     else vel.mult(0.97);
     pos.add(vel);
     if(vel.mag() >= speed)
     vel.setMag(speed);
     boundary();
   }
   
   void boundary() {
     if (pos.x >= width)
     pos.x = width;
     if (pos.x <= 0)
     pos.x = 0;
     if (pos.y <= 0)
     pos.y = 0;
     if (pos.y >= height)
     pos.y = height;
   } 
}