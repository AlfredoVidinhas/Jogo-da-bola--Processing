float x, y, z;
float dim = 117;

void setup() {
  size(1006, 481);
  noStroke();
}

void draw() {
  background(104,155,208);
  
  x = x + 1.5;
  y = y + 1.5;
  z = z + 1.5;
  
  if (x > width/3) {
    print("x="+x+"\n");
    x = -177;
  } 
  if (y > width/2  ) {
    print("y="+y+"\n");
    y = -177;
  }
  if (z > width ) {
    print("z="+y+"\n");
    z = -177;
  }
  translate(x, dim/2);
  fill(0);
  rect(-dim/2, -dim/2, 177, dim);
  
  translate(y, dim + 65);
  fill(0);
  rect(-dim/2, -dim/2, 177, dim);
  
  translate(z, dim + 65);
  fill(40,56,92);
  rect(-dim/2, -dim/2, 177, dim);
}
