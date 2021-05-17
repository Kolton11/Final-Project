Ball ball; // Define the ball as a global object 

Paddle paddleLeft;
Paddle paddleRight;

int scoreLeft = 0;
int scoreRight = 0;
boolean play;

void setup() {
  size(800, 600);
  ball = new Ball(width/2, height/2, 25); //create a new ball to the center of the window
  ball.speedX = 8; // Giving the ball speed in x-axis
  ball.speedY = 8; // Giving the ball speed in y-axis

  paddleLeft = new Paddle(75, height/2, 30, 200);
  paddleRight = new Paddle(width-75, height/2, 30, 200);
  play = false;
}

void draw() {
  if (!play) {
    startScreen();
  } else {
    background(0); //clear canvas
    ball.display(); // Draw the ball to the window
    ball.move(); //calculate a new location for the ball
    ball.display(); // Draw the ball on the window

    paddleLeft.move();
    paddleLeft.display();
    paddleRight.move();
    paddleRight.display();
    

    if (ball.right() > 780) {
      scoreLeft = scoreLeft + 1;
      ball.x = width/2;
      ball.y = height/2;
    }
    if (ball.left() < 20) {
      scoreRight = scoreRight + 1;
      ball.x = width/2;
      ball.y = height/2;
    }
    if (ball.bottom() > height) {
      ball.speedY = -ball.speedY;
    }

    if (ball.top() < 0) {
      ball.speedY = -ball.speedY;
    }

    if (paddleLeft.bottom() > height) {
      paddleLeft.y = height-paddleLeft.h/2;
    }

    if (paddleLeft.top() < 0) {
      paddleLeft.y = paddleLeft.h/2;
    }

    if (paddleRight.bottom() > height) {
      paddleRight.y = height-paddleRight.h/2;
    }

    if (paddleRight.top() < 0) {
      paddleRight.y = paddleRight.h/2;
    }

    if ( ball.left() < paddleLeft.right() && ball.y > paddleLeft.top() && ball.y < paddleLeft.bottom()) {
      ball.speedX = -ball.speedX;
      ball.speedY = map(ball.y - paddleLeft.y, -paddleLeft.h/2, paddleLeft.h/2, -10, 10);
    }

    if ( ball.right() > paddleRight.left() && ball.y > paddleRight.top() && ball.y < paddleRight.bottom()) {
      ball.speedX = -ball.speedX;
      ball.speedY = map(ball.y - paddleRight.y, -paddleRight.h/2, paddleRight.h/2, -10, 10);
    }


    
  }
}
void keyPressed() {
  if (keyCode == UP) {
    paddleRight.speedY=-10;
  }
  if (keyCode == DOWN) {
    paddleRight.speedY=10;
  }
  if (key == 'a') {
    paddleLeft.speedY=-10;
  }
  if (key == 'z') {
    paddleLeft.speedY=10;
  }
}

void keyReleased() {
  if (keyCode == UP) {
    paddleRight.speedY=0;
  }
  if (keyCode == DOWN) {
    paddleRight.speedY=0;
  }
  if (key == 'a') {
    paddleLeft.speedY=0;
  }
  if (key == 'z') {
    paddleLeft.speedY=0;
  }
}
