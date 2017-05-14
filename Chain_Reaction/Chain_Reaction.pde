float spring = 0.05;
float friction = -0.9;
Ball[] balls = new Ball[25];

void setup() {
  size(854,480);
  for (int i = 0; i < 25; i++) {
    balls[i] = new Ball();
  }
  noStroke();
}

void draw() {
  background(255);
  for (Ball ball : balls) {
    ball.move();
    ball.wallCollide();
    ball.display();
  }
}

class Ball {
  
  float xpos,ypos;
  float xdir,ydir;
  int rad;
  color c;
  float xspeed,yspeed;
  Ball[] others;
  
  Ball(){
    xpos = random(50,804);
    ypos = random(50,430);
    rad = int(random(10,20));
    c = color(random(255),random(255),random(255));
    xspeed = random(3,10);
    yspeed = random(3,10);
    xdir = random(-1,1);
    ydir = random(-1,1);
  }
  
  void display(){
    fill(c);
    ellipse(xpos,ypos,rad * 2, rad * 2);
  }
  
  void move(){
    xpos += xspeed * xdir;
    ypos += yspeed * ydir;
  }
  
  void wallCollide(){
    if (xpos - rad <= 0 || xpos + rad >= 854){
      xdir *= -1;
    }
    if (ypos - rad <= 0 || ypos + rad >= 480){
      ydir *= -1;
    }
  }
}