 int[][] grid = new int [8][5];

PImage zumbi_a;
PImage noz_a, girassol_a, disparervilha_a;
PImage button_girassol, button_noz, button_ervilha, button, sun, button_sol, bloco, bloco_marrom, gameOver;
PFont font;
Zumbi [] posicoesZumbi = new Zumbi[20];

Girassol [][] posicoesGirassol = new Girassol [8][5];
Noz [][] posicoesNoz = new Noz [8][5];
Girassol girassol1, g1;
Noz noz1;
Ervilha [][] posicoesErvilha = new Ervilha [8][5];
Ervilha erv1;

boolean play = true;

int sol = 0;
int quant = 0;
int intervaloTempoZumbi = 600;
int tempoZumbi;
int zumbiMortos = 0;

int intervaloTempoSol = 400;

// Constantes para adicionar Planta
final int NEUTRO = 0;
final int GIRASSOL = 1;
final int NOZ = 2;
final int ERVILHA = 3;

// Estados
int estado = NEUTRO;
