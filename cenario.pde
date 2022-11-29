void renderGrid() {
  for (int i = 0; i < 8; i++) {
    for (int j = 0; j < 5; j++) {
      noStroke();
      //criação da grama
      if (i % 2 == 0 && j % 2 == 0) {
        fill(#2ba517);
        rect(i*80+120, j*80+120, 80, 80);
      } else if (i % 2 == 1 && j % 2 == 1) {
        fill(#2ba517);
        rect(i*80+120, j*80+120, 80, 80);
      }
      //criação da grama
      if (i % 2 == 1 && j% 2 == 0) {
        fill(#37bc00);
        rect(i*80+120, j*80+120, 80, 80);
      } else if (i % 2 == 0 && j % 2 == 1) {
        fill(#37bc00);
        rect(i*80+120, j*80+120, 80, 80);
      }
    }
  }
}

void tijolos() {
  // fill(139,155,180);
  // rect(400,40, 800,80);
  for (int i = 0; i <= 9; i++) {
    fill(134);
    image(bloco_marrom, 40+80*i, 40, 80, 80);
    image(bloco, 40+80*i, 520, 80, 80);
  }
}


void renderButtons() {
  // Sol
  fill(#37bc00);
  image(button_sol, 120, 40, 70, 70);
  image(sun, 120, 30, 40, 40);
  fill(255);
  text(sol, 112, 65);

  // Girassol
  fill(#37bc00);
  image(button, 200, 40, 70, 70);
  image(button_girassol, 200, 30);
  fill(255);
  text("50", 192, 65);

  // Selecionar Girassol
  if (mousePressed && mouseX >= 160 && mouseX <= 230 && mouseY >= 0 && mouseY <= 80) {
    estado = GIRASSOL;

  }

  // Noz
  fill(#37bc00);
  image(button, 280, 40, 70, 70);
  image(button_noz, 280, 30);
  fill(255);
  text("50", 272, 65);

  if (mousePressed && mouseX >= 240 && mouseX <= 320 && mouseY >= 0 && mouseY <= 80) {
    estado = NOZ;
 
  }

  if (mousePressed && mouseX >= 320 && mouseX <= 400 && mouseY >= 0 && mouseY <= 80) {
    estado = ERVILHA;

  }

  //Disparaervilha
  fill(#37bc00);
  image(button, 360, 40, 70, 70);
  image(button_ervilha, 360, 30);
  fill(255);
  text("100", 347, 65);
}
