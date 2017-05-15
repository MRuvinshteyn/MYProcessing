/*
Yuyang Zhang & Michael Ruvinshteyn
APCS2 pd01
HW40 -- All That Bouncin’
2017-05-14
*/
class Ball {
  float xpos, ypos;
  float xdir, ydir;
  int rad;
  color c;
  float xspeed, yspeed;
  Ball[] others;

  Ball() {
    xpos = random(50, 804);
    ypos = random(50, 430);
    rad = int(random(10, 16));
    c = color(random(255), random(255), random(255));
    xspeed = 5;
    yspeed = 5;
    xdir = random(-1, 1);
    ydir = random(-1, 1);
  }

  Ball(float newX, float newY) {
    this();
    xpos = newX;
    ypos = newY;
  }

  int getRad() {
    return rad;
  }

  void setRad(int x) {
    rad = x;
  }

  void display() {
    fill(c);
    ellipse(xpos, ypos, rad * 2, rad * 2);
  }

  void move() {
    xpos += xspeed * xdir;
    ypos += yspeed * ydir;
  }

  void wallCollide() {
    if (xpos - rad - 10 <= 0) {
      xdir *= -1;
    }
    if (xpos + rad + 10 >= 854) {
      xdir *= -1;
    }
    if (ypos - rad - 10 <= 0) {
      ydir *= -1;
    }
    if (ypos + rad + 10 >= 480) {
      ydir *= -1;
    }
  }
}