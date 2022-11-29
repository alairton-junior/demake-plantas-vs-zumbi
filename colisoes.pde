// Disparo X Zumbi

void colisaoErvilhaZumbi() {

  for (int i = 0; i < 8; i++) {
    for (int j = 0; j < 5; j++) {
      for (int t = 0; t < posicoesZumbi.length; t++) {
        if (posicoesZumbi[t] != null && posicoesErvilha[i][j] != null && posicoesErvilha[i][j].y == posicoesZumbi[t].y) {
          posicoesErvilha[i][j].shot = true;
        }
        if (posicoesZumbi[t] != null && posicoesErvilha[i][j] != null && posicoesErvilha[i][j].x == posicoesZumbi[t].x) {
          posicoesZumbi[t].perderVida();
        }
      }
    }
  }
}

void colisoesZumbiPlantas() {

  for (int i = 0; i < 8; i++) {
    for (int j = 0; j < 5; j++) {
      for (int t = 0; t < posicoesZumbi.length; t++) {
        if (grid[i][j] != 0 && posicoesZumbi[t] != null) {
          if (posicoesZumbi[t].x == i*80+120+20 && posicoesZumbi[t].y == j*80+120) {
            posicoesZumbi[t].ataque();
            switch (grid[i][j]) {
            case GIRASSOL:
              posicoesGirassol[i][j].perderVida();
              if (posicoesGirassol[i][j].life <= 0) {
                posicoesGirassol[i][j] = null;
                grid[i][j] = NEUTRO;
                posicoesZumbi[t].attacking = false;
              }
              break;
            case NOZ:
              posicoesNoz[i][j].perderVida();
              if (posicoesNoz[i][j].life <= 0) {
                posicoesNoz[i][j] = null;
                grid[i][j] = NEUTRO;
                posicoesZumbi[t].attacking = false;
              }
              break;
            case ERVILHA:
              posicoesErvilha[i][j].perderVida();
              if (posicoesErvilha[i][j].life <= 0) {
                posicoesErvilha[i][j] = null;
                grid[i][j] = NEUTRO;
                posicoesZumbi[t].attacking = false;
              }
              break;
            }
          }
        }
      }
    }
  }
}

void resolverBugZumbiParado() {
  for (int i = 0; i < 8; i++) {
    for (int j = 0; j < 5; j++) {
      for (int t = 0; t < posicoesZumbi.length; t++) {
        if (grid[i][j] == 0 && posicoesZumbi[t] != null) {
          if(posicoesZumbi[t].attacking) {
            posicoesZumbi[t].attacking = false;
          }
        }
      }
    }
  }
}
