

void recarregaSol() {
  if (play) {
    intervaloTempoSol--;
    if (intervaloTempoSol <= 0) {
      intervaloTempoSol = 480;

      sol+=50;
    }
  } 
}
