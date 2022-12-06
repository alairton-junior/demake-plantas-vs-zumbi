void setup() {
  size(800, 560);
  rectMode(CENTER);
  imageMode(CENTER);
  strokeWeight(2);

  font = createFont("font.ttf", 20);
  textFont(font);

  // Sprites 
  button_girassol = loadImage("girassol.png");
  button_noz = loadImage("noz.png");
  button_ervilha = loadImage("ervilha.png");
  zumbi_a = loadImage("zumbi_ataque.png");
  noz_a = loadImage("noz_a.png");
  girassol_a = loadImage("girassol_a.png");
  disparervilha_a = loadImage("disparervilha_a.png");
  button = loadImage("button.png");
  button_sol = loadImage("button-sol.png");
  sun = loadImage("sun.png");
  bloco = loadImage("bloco.png");
  bloco_marrom = loadImage("bloco-marrom.png");
  gameOver = loadImage("Game_Over.png");
}

void draw() {
  background(#A75E14);

  renderGrid();
  verificaPosicao();
  tijolos();
  renderButtons();
  renderPlantas();
  selecaoMouseRender();
  geraZumbi();
  colisaoErvilhaZumbi();
  resolverBugZumbiParado();
  colisoesZumbiPlantas();
  recarregaSol();
  zumbiUltrapassou();
  ganhou();

  // Chamadas de Game Over
  if(!play && zumbiMortos != 20) {
    encerrarJogo("GAME OVER");
  }
}
