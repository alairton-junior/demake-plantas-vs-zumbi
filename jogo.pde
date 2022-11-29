void encerrarJogo(String mensagem) {
 
  textSize(80);
  fill(255);
  image(gameOver, 400, 280, 400, 200);
  text(mensagem, 210, 280);
  fill(255);
  rect(400, 330, 200, 50);
  fill(0);
  play = false;
  if (mousePressed && mouseX >= 300 && mouseX <= 500 && mouseY >= 305 && mouseY <= 355) {
    reset();
  }
  textSize(25);
  text("JOGAR NOVAMENTE", 302, 335);
  textSize(20);
  
}

void reset() {
  play = true;
  intervaloTempoZumbi = 800;
  tempoZumbi = 0;
  estado = NEUTRO;
  sol = 0;
  quant = 0;
  intervaloTempoSol = 400;
  zumbiMortos = 0;

  grid = new int [8][5];
  posicoesNoz = new Noz [8][5];
  posicoesErvilha = new Ervilha [8][5];
  posicoesZumbi = new Zumbi[20];
}

void ganhou() {
  
  if(zumbiMortos >= 20) {
     encerrarJogo(" VITÓRIA ");
  }
}
