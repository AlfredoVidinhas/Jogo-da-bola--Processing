float tamJanela = 500;
float base = 160;
float altura = 100;

float tenhoSono = 0.8;

float [] posValidas =  {65, 182, 299};

float [] x =  {0, 900,600};
float [] y =  {posValidas[0], posValidas[1]+65, posValidas[2]+65};

void setup()
{
  size(1000, 500);
  noStroke();
}

void draw()
{
   background(104,155,208);
   tamJanela -= 1.5;
   translate(tamJanela, 200);
   fill(0);
   for(int i = 0; i < y.length; i++)
   {
     rect(x[i], y[i], base, altura);
   }
   tenhoSono += 1.5;
   translate(tenhoSono, 481/2);
   fill(255);
   circle(0,0,45); 
}
