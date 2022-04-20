Trazos t;

Paleta paleta;

void setup () {
  size (400, 600);
  t = new Trazos(random (width), random( height), 0, -1);
  paleta = new Paleta ("osowo1.jpg");
}

void draw () {
  t.dibujar();
  t.movimientos();
}
