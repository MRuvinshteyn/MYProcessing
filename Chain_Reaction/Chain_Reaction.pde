/*
Yuyang Zhang & Michael Ruvinshteyn
APCS2 pd01
HW40 -- All That Bouncin’
2017-05-14
*/


float spring = 0.05;
float friction = -0.9;
Ball[] balls = new Ball[25];

void setup() {
  size(854,480);
  for (int x = 0; x < 25; x += 1) {
    balls[x] = new Ball(50 + (x * 30), random(50,430));
    balls[x].others = new Ball[24];
  }
  for (int x = 0; x < 25; x += 1){
    for (int i = 0; i < x; i += 1){
      balls[x].others[i] = balls[i];
    }
    for (int i = x + 1; i < 24; i += 1){
      balls[x].others[i] = balls[i];
    }
  }
  noStroke();
}

void draw() {
  background(255);
  for (Ball ball : balls) {
    ball.wallCollide();
    ball.move();
    for (int x = 0; x < 24; x += 1){
      float dist = dist(ball.xpos,ball.ypos,balls[x].xpos,balls[x].ypos);
      if (dist <= float(ball.rad + balls[x].rad)){
        float tempXDir = ball.xdir;
        float tempYDir = ball.ydir;
        float tempXSpeed = ball.xspeed;
        float tempYSpeed = ball.yspeed;
        
        ball.xdir = balls[x].xdir;
        balls[x].xdir = tempXDir;
        ball.ydir = balls[x].ydir;
        balls[x].ydir = tempYDir;
        ball.xspeed = balls[x].xspeed;
        balls[x].xspeed = tempXSpeed;
        ball.yspeed = balls[x].yspeed;
        balls[x].yspeed = tempYSpeed;
       }
    }
    ball.display();
  }
}

/*
void mouseClicked(){
  for(int x = 0; x < balls.length; x+= 1){
    int newRad = balls[x].getRad();
    while(newRad > 0){
      balls[x].setRad(newRad -= 1);
    }
  }
  */