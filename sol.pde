

void recarregaSol() {
  if (play) {
    intervaloTempoSol--;
    if (intervaloTempoSol <= 0) {
      intervaloTempoSol = 300;

      sol+=50;
    }
  } 
}
