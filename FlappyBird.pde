float birdX=50;
float birdD=20;
float pipeGap=100;
float pipeWidth=80;
float pipesBWGap=250;

int score=0;
int bgCol=color(255);

Bird b;
ArrayList<Pipe> pipes;

boolean iiP=false;

void setup() {
  size(400, 400);
  b=new Bird();
  pipes=new ArrayList<Pipe>();
  pipes.add(new Pipe());
}

void keyPressed() {
  if (keyCode == ' ' && !iiP) {
    b.up();
    iiP=true;
  }
}

void keyReleased() {
  if (keyCode == ' ') {
    iiP=false;
  }
}

void draw() {
  background(bgCol);
  b.update();
  for (Pipe p : pipes) {
    p.update();
    p.show();
  }
  for (Pipe p : pipes) {
    if (b.collides(p)) {
      bgCol=color(255, 0, 0);
      break;
    } else bgCol=color(255);
  }
  if (pipes.get(pipes.size()-1).x<pipesBWGap) pipes.add(new Pipe());
  if (pipes.get(0).x<-pipeWidth) {
    pipes.remove(0);
    score++;
  }
  b.show();
}
