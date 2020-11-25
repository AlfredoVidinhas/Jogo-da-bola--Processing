float tamJanela = 500;
float base = 177;
float altura = 117;

float tenhoSono = 0.8;

float [] posValidas =  {(481/3-177), 117, 234};

float [] x =  {0, 600};
float [] y =  {posValidas[0], posValidas[1]};

void setup()
{
  size(1006, 481);
  noStroke();
}

void draw()
{
   background(104,155,208);
   
   tamJanela -= 1.5;
   translate(tamJanela, 0);
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
