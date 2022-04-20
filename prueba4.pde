Trazos t;

Paleta paleta;

void setup () {
  size (400, 600);
  t = new Trazos(random (width), random( height), 0, -1);
  paleta = new Paleta ("roma1.jpg");
  paleta = new Paleta ("roma2.jpg");
  paleta = new Paleta ("roma3.jpg");
  paleta = new Paleta ("roma4.jpg");
  
}

void draw () {
  t.dibujar();
  t.movimientos();
}
