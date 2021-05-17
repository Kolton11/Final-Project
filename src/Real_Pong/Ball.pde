class Ball {
  float x;
  float y;
  float speedX;
  float speedY;
  float diameter;
  color c;
  
  // Constructor method
  Ball(float tempX, float tempY, float tempDiameter) {
    x = tempX;
    y = tempY;
    diameter = tempDiameter;
    speedX = 0;
    speedY = 0;
    c = (#FF8503); 
  }
  
  void move() {
    // Add speed to location
    y = y + speedY;
    x = x + speedX;
  }
  
  void display() {
    fill(c); //set the drawing color
    ellipse(x,y,diameter,diameter); //draw a circle
  }
  
 
