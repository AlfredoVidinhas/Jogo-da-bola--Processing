float baseRect = 177;
float alturaRect = 100;

float janelaX = 0;
float janelaY = 80;

float velocidade = 1;
float percurso = 3000;

float jogadorX = 50;
float jogadorY = 125;

float [] posRectX = new float [15];
float [] posRectY = new float [15];
boolean [] statusRect = new boolean[15];
float [] posValidasY = new float [3];
float [] posVidaX = new float [3];
float [] posVidaY = new float [3];
boolean [] statusVida = new boolean[3];

int quantVida = 2;
int nivel = 1;
int quantDesvios = 0;
float pontuacao = 0.0;

void setup()
{
  size(1000, 550);
  noStroke();

  for (int j = 0; j < posValidasY.length; j++)
  {
    posValidasY[j] = 450/3 * j;
  }

  for (int i = 0; i < posRectY.length; i++)
  {
    int k = (int)random(0, 3);
    posRectY[i] = posValidasY[k];
    posRectX[i] = random(500, 2990);
    statusRect[i] = false;
  }

  for (int i = 0; i < posVidaY.length; i++)
  {
    int k = (int)random(0, 3);
    posVidaY[i] = posValidasY[k]+50;
    posVidaX[i] = random(0, 2990);
    statusVida[i] = false;
  }
}

boolean verifColisao(float posJogadorX, float posJogadorY, float raioJogador, float posVidaX, float posVidaY, float raioVida) {

  float distanciaX = posJogadorX - posVidaX;
  float distanciaY = posJogadorY - posVidaY;
  float distancia = sqrt( (distanciaX*distanciaX) + (distanciaY*distanciaY) );

  if (distancia <= raioJogador+raioVida) {
    return true;
  }
  return false;
}

boolean verifColisao(float raioJogador, float posRectX, float posRectY, float baseRect, float alturaRect, float posJogadorY, float posJogadorX)
{

  float posAuxX = posJogadorX;
  float posAuxY = posJogadorY;

  if (posJogadorX < posRectX) {     
    posAuxX = posRectX;
  } else if (posJogadorX > posRectX+baseRect)
  { 
    posAuxX = posRectX+baseRect;
  }
  if (posJogadorY < posRectY)
  {         
    posAuxY = posRectY;
  } else if (posJogadorY > posRectY+alturaRect) { 
    posAuxY = posRectY + alturaRect;
  }   

  float distanciaX = posJogadorX-posAuxX;
  float distanciaY = posJogadorY-posAuxY;
  float distancia = sqrt( (distanciaX*distanciaX) + (distanciaY*distanciaY) );

  if (distancia <= raioJogador) {
    return true;
  }
  return false;
}

void draw()
{
  background(104, 155, 208);

  textSize(15);
  text("Vidas:"+ quantVida, 150, 40);
  text("Pontos: "+pontuacao, 20, 40);
  text("Nível: "+nivel, 20, 60);

  janelaX -= velocidade;
  translate(janelaX, 80);  
  for (int i = 0; i < posRectY.length; i++)
  {
    fill(0);
    rect(posRectX[i], posRectY[i], baseRect, alturaRect);
  }

  for (int i = 0; i < posVidaY.length; i++)
  {
    fill(255, 165, 0);
    circle(posVidaX[i], posVidaY[i], 25);
  }

  jogadorX += velocidade;
  translate(jogadorX, jogadorY);
  fill(255);
  circle(0, 0, 30);

  for (int i = 0; i< posVidaY.length; i++)
  {
    boolean colisaoVida = verifColisao(jogadorX, jogadorY, 30/2, posVidaX[i], posVidaY[i], 25/2);
    if (colisaoVida && !statusVida[i])
    {
      statusVida[i] = true;
      quantVida +=1;
    }
  }

  for (int i = 0; i < posRectY.length; i++)
  {
    boolean colisaoRect = verifColisao(30/2, posRectX[i], posRectY[i], baseRect, alturaRect, jogadorY, jogadorX);
    if (colisaoRect && !statusRect[i])
    {
      quantVida -=1;
      statusRect[i] = true;
    }
  }

  for (int i=0; i < posRectY.length; i++) {
    if (jogadorX-(30/2) > posRectX[i]+baseRect+1 && !statusRect[i]) {
      pontuacao = pontuacao + 10;
      quantDesvios += 1;
      statusRect[i] = true;
    }
  }

  if (pontuacao % 100 == 0 && quantDesvios == 10)
  {
    velocidade *=2;
    nivel +=1;
    quantDesvios = 0;
  }

  if (jogadorX >= percurso)
  {
    reiniciar();
  } 
  
  if ( quantVida < 1)
  {
    background(0);
    textSize(55);
    fill(255);
    text("Você Perdeu", 500, 0);
  }
}

void reiniciar()
{
  janelaX = 0;
  jogadorX = 50;
}

void keyPressed()
{
  if (keyCode == DOWN && jogadorY <= posValidasY[2]+100)
  {
    jogadorY += 25;
  } else if (keyCode == UP && jogadorY >= (posValidasY[0] + 75) )
  {
    jogadorY -= 25;
  }
}
