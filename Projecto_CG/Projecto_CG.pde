
//dimensão no retângulo
float alturaRet = 117;
float baseRet = 177;

//coordenadas iniciais da janela
float janelaX = 0;
float janelaY = 81;

float [] posRectX = new float[5];
float [] posRectY = new float [5];
float [] posValidas = new float[3];

void setup() {
  //definir o tamanho da tela
  size(1006, 481);
  //tirar o contorno
  noStroke();

  //popular o vector de posições válidas
  for (int j = 0; j < posValidas.length; j++)
  {
    posValidas[j] = (j * (400/3)) + ((400/3 - 117));
  }

  for (int i = 0; i < posRectX.length; i++)
  {
    int k = (int)(random(0, 3)); 
    posRectX[i] = random(0, 10);
    posRectY[i] = posValidas[k];
  }
}

void draw() {

  //definir a cor do fundo da tela
  background(104, 155, 208);

  janelaX +=2 ; 
  translate(janelaX, janelaY);
  for (int i = 0; i < posRectX.length; i++)
  {
    fill(0);
    rect(posRectX[i], posRectY[i], baseRet, alturaRet);
  }
}
