float baseRect = 177;
float alturaRect = 100;

float janelaX = 0;
float janelaY = 80;

float velocidade = 1.5;
float percurso = 1500;

float jogadorX = 50;
float jogadorY = 150;

float [] posRectX = new float [15];
float [] posRectY = new float [15];
float [] posValidasY = new float [3];

void setup()
{
  size(1000, 480);
  noStroke();

  for (int j = 0; j < posValidasY.length; j++)
  {
    posValidasY[j] = 400/3;
  }

  for (int i = 0; i < posRectY.length; i++)
  {
    int k = (int)random(0, 3);
    posRectY[i] = posValidasY[k];
    posRectX[i] = random(0, 1500);
  }
}

void draw()
{
  background(104, 155, 208);

  janelaX -= velocidade;
  translate(janelaX, 80);  
  for (int i = 0; i < posRectY.length; i++)
  {
    fill(0);
    rect(posRectX[i], posRectY[i], baseRect, alturaRect);
  }

  jogadorX += velocidade;
  translate(jogadorX, jogadorY);
  fill(255);
  circle(0, 0, 50);
}

void keyPressed()
{
    if (keyCode == DOWN && jogadorY < posValidasY[2]+50)
    {
      jogadorY += 65;
    } else if (keyCode == UP && jogadorY > (posValidasY[0]+50) )
    {
      jogadorY -= 65;
    }
}
