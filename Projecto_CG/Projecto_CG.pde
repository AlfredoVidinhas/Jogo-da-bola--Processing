float tamJanela = 5000;
float base = 160;
float altura = 100;

float jogadorX = 150;
float jogadorY = 50;

float [] posValidas =  {0, 100, 200};

float [] x =  {0, 2900, 2700};
float [] y =  {posValidas[0], posValidas[1], posValidas[2]};

void setup()
{
  size(1000, 500);
  noStroke();
}

void draw()
{
   background(104,155,208);
   
   tamJanela -= 1.5;
   translate(tamJanela, 100);
   fill(0);
   
   for(int i = 0; i < y.length; i++)
   {
     rect(x[i], y[i], base, altura);
   }
   
   jogadorX += 1.5;
   translate(jogadorX, jogadorY);
   
   fill(255);
   circle(0,0,50); 
}
