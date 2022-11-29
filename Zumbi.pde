class Zumbi {
  float x;
  int life, y, time;
  boolean attacking;
  PImage img;
  PImage zumbi_a = loadImage("zumbi_a.png");
  PImage zumbi_b = loadImage("zumbi_b.png");
  PImage zumbi_ataque = loadImage("zumbi_ataque.png");
  PImage zumbi_parado = loadImage("zumbi_parado.png");

  Zumbi (float x, int y) {
    this.x = x;
    this.y = y;
    this.attacking = false;
    this.img = zumbi_a;
    this.time = 0;
    this.life = 240;
  }

  void render () {
    image (img, this.x, this.y-10, 50, 80);

    if (!attacking) {
      this.x -= 0.5;
    }

    this.time ++;
    if (this.time >= 0 && this.time<=40) {
      this.img = zumbi_b;
    }
    if (this.time > 40 && this.time<= 80) {
      this.img = zumbi_a;
      if (this.time >= 80) {
        this.time = 0;
      }
    }
  }
  void perderVida () {

    this.life -= 20;
  }

  void ataque() {
    this.attacking = true;

    if (this.time >= 0 && this.time<=40) {
      this.img = zumbi_parado;
    }
    if (this.time > 40 && this.time<= 80) {
      this.img = zumbi_ataque;
    }
  }
}

void geraZumbi() {

  if (play) {

    if (tempoZumbi == intervaloTempoZumbi) {
      if (quant < 20) {
        intervaloTempoZumbi = int(random(400, 600));
        tempoZumbi = 0;
        int posY = int(random(0, 5));
        Zumbi zumbi1 = new Zumbi(800, posY*80+120);
        posicoesZumbi[quant] = zumbi1;

        quant++;
      }
    }
    tempoZumbi++;

    for (int i = 0; i < posicoesZumbi.length; i++) {
      if (posicoesZumbi[i] != null)
        posicoesZumbi[i].render();
    }
  }
}

void zumbiUltrapassou() {
  for (int i = 0; i < posicoesZumbi.length; i++) {
    if (posicoesZumbi[i] != null)
      if (posicoesZumbi[i].x <= 0) {
         encerrarJogo("GAME OVER");
      }
  }
}
