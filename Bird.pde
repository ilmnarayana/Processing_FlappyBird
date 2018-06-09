class Bird {
  float y;
  float yvel;
  float yacc;

  Bird() {
    y=width/2;
    yvel=0;
    yacc=0;
  }

  void update() {
    yvel+=0.3;
    yvel+=yacc;
    y+=yvel;
    isOut();
    yacc=0;
  }

  void isOut() {
    if (y<=0) {
      y=0;
      yvel=0;
      yacc=0;
    }
    if (y>=height) {
      y=height;
      yvel=0;
      yacc=0;
    }
  }

  void up() {
    yvel=-6;
  }

  boolean collides(Pipe p) {
    return p.r1.collides(this)||p.r2.collides(this);
  }

  void show() {
    fill(0);
    ellipse(birdX, y, birdD, birdD);
    textAlign(CENTER, CENTER);
    fill(255);
    text(score, birdX, y);
  }
}
