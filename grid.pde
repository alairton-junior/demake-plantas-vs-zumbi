void renderPlantas() {
  if (play) {
    for (int i = 0; i < 8; i++) {
      for (int j = 0; j < 5; j++) {

        if (grid[i][j] == GIRASSOL) {
          if (posicoesGirassol[i][j] == null) {
            girassol1 = new Girassol(i*80+120, j*80+120);
            posicoesGirassol[i][j] = girassol1;
          }
          posicoesGirassol[i][j].render();
          posicoesGirassol[i][j].recarga();
        }
        if (grid[i][j] == NOZ) {
          if (posicoesNoz[i][j] == null) {
            noz1 = new Noz(i*80+120, j*80+120);
            posicoesNoz[i][j] = noz1;
          }
          posicoesNoz[i][j].render();
        }
        if (grid[i][j] == ERVILHA) {
          if ( posicoesErvilha[i][j] == null) {
            erv1 = new Ervilha(i*80+120, j*80+120);
            posicoesErvilha[i][j] = erv1;
          }
          posicoesErvilha[i][j].dispara();
          posicoesErvilha[i][j].render();
        }
      }
    }
  }
}

void verificaPosicao() {
  if (mouseX >= 80 && mouseX <= 719 && mouseY >= 80 && mouseY <= 479) {
    
    int posGridX = (constrain(mouseX, 80, 720) - 80 )/ 80;
    int posGridY = (constrain(mouseY, 80, 480) - 80) / 80;

    if (mousePressed) {
      addPlanta(posGridX, posGridY);
    }
  }
}


void selecaoMouseRender() {
  /*if(mousePressed && estado != NEUTRO) {
   estado = NEUTRO;
   }*/

  switch (estado) {
  case NEUTRO:

    break;
  case GIRASSOL:
    image(girassol_a, mouseX, mouseY, 22, 40);


    break;
  case NOZ:
    image(noz_a, mouseX, mouseY, 25, 35);

    break;
  case ERVILHA:
    image(disparervilha_a, mouseX, mouseY, 25, 35);
    break;
  }
}
void addPlanta(int x, int y) {
  switch (estado) {
  case NEUTRO:
    grid[x][y] = NEUTRO;
    break;
  case GIRASSOL:

    if (sol >= 50 && grid[x][y] == NEUTRO) {
      sol-=50;
      grid[x][y] = GIRASSOL;
    }
    break;
  case NOZ:
    if (sol >= 50 && grid[x][y] == NEUTRO) {
      sol-=50;
      grid[x][y] = NOZ;
    }

    break;
  case ERVILHA:
    if (sol >= 100 && grid[x][y] == NEUTRO) {
      sol-=100;
      grid[x][y] = ERVILHA;
    }
    break;
  }
}
