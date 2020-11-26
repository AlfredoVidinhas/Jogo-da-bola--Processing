float base = 160;
float altura = 100;

float tamPercurso = 3000;
float percurso = 0;

float velocidade = 1.5;

float jogadorX = 50;
float jogadorY = 150;

float [] posValidas =  {0, 100, 200};

float [] x =  {0, 500, 1000};
float [] y =  {posValidas[0], posValidas[1], posValidas[2]};

void setup()
{
  size(1000, 500);
  noStroke();
}

void draw()
{
  background(104, 155, 208);

  percurso -= velocidade;
  translate(percurso, 100);
  
  for (int i = 0; i < y.length; i++)
  {
    fill(0);
    rect(x[i], y[i], base, altura);
  }
    
  jogadorX += velocidade;
  translate(jogadorX, jogadorY);
  fill(255);
  circle(0, 0, 50);
}

void keyPressed()
{
  if (jogadorY >= (posValidas[0] + 50) && jogadorY <= (posValidas[2] + 50 ) )
  {
    if (keyCode == DOWN && jogadorY < posValidas[2] + 50)
    {
      jogadorY += 100;
    } else if (keyCode == UP && jogadorY > posValidas[0]+50 )
    {
      jogadorY -= 100;
    }
  }
}
