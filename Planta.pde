class Planta {
  int life, cost, x, y, time, count;
  PImage img;
  
  void perderVida() {
    this.life--;
  }
}

class Girassol extends Planta {
  PImage girassol_a = loadImage("girassol_a.png");
  PImage girassol_recarga = loadImage("girassol_recarga.png");

  Girassol (int x, int y) {
    this.x = x;
    this.y = y;
    this.life = 100;
    this.cost = 50;
    this.time = 420;
    this.img = girassol_a;
    this.count = 0;
  }
  void render () {
    
    image(this.img, x, y, 37, 65);
  }

  void recarga() {
    this.time--;
    if (this.time <= 60) {
      this.img = girassol_recarga;
      if (this.time <= 0) {
        sol+=25;
        this.time = 420;
        this.img = girassol_a;
      }
    }
  }
}

class Noz extends Planta {
  PImage noz_a = loadImage("noz_a.png");
  PImage noz_b = loadImage("noz_b.png");
  PImage noz_c = loadImage("noz_c.png");
  Noz (int x, int y) {
    this.x = x;
    this.y = y;
    this.life = 450;
    this.cost = 50;
    this.img = noz_a;
  }
  void render () {
    if (this.life < 300 && this.life >= 150) {
      this.img = noz_b;
    }
    if (this.life < 150) {
      this.img = noz_c;
    }
    image (img, x, y, 35, 55);
  }
}


class Ervilha extends Planta {
  PImage disparervilha_a = loadImage("disparervilha_a.png");
  boolean shot;
  PImage disparervilha_b = loadImage("disparervilha_b.png");
  PImage ervilha_ball = loadImage("ervilha_ball.png");
  ArrayList <PVector> disparos = new ArrayList();
  Ervilha (int x, int y) {
    this.x = x;
    this.y = y;
    this.life = 150;
    this.cost = 100;
    this.time = 0;
    this.img = disparervilha_a;
    this.shot = false;
  }
  void render () {
    this.shot = false;
    int quantidadeDisparos = disparos.size();

    for (int j = 0; j < posicoesZumbi.length; j++) {
      for (int i = 0; i < quantidadeDisparos; i++) {

        PVector disparo_atual = disparos.get(i);
        if (posicoesZumbi[j] != null) {
         
          if (disparo_atual.x > posicoesZumbi[j].x && disparo_atual.y == posicoesZumbi[j].y-10) {
            disparos.remove(i);
            quantidadeDisparos = disparos.size();
            posicoesZumbi[j].perderVida();
            if (posicoesZumbi[j].life <= 0) {
              posicoesZumbi[j] = null;
              zumbiMortos++;
            }
          }
        }
      }
    }

    if (this.time > 30) {
      this.img = disparervilha_b;
    } else {
      this.img = disparervilha_a;
    }
    image (img, x, y, 33, 45);

    for (int i = 0; i < disparos.size(); i++) {
      PVector shot = disparos.get(i);
      fill(#6EFC59);
      image(ervilha_ball,shot.x, shot.y);
      shot.x+=4;

      if(shot.x > 750){
        disparos.remove(i);
      }
    }
  }

  void dispara() {
    if (this.shot) {
      this.time--;
      if (this.time <= 0) {
        PVector shot = new PVector(this.x+25, this.y-10);
        disparos.add(shot);
        time = 60;
      }
    }
  }
}
