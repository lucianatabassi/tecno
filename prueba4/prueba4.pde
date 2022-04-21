/* 
Comision: Matias
Aylen Zegarra García
Lourdes Sanchez
Luciana Tabassi
*/

Trazos t;

Paleta paleta;

void setup () {
  size (400, 600);
  t = new Trazos();
  paleta = new Paleta ("roma1.jpg");
  paleta = new Paleta ("roma2.jpg");
  paleta = new Paleta ("roma3.jpg");
  paleta = new Paleta ("roma4.jpg");
  
}

void draw () {
  t.dibujar();
  t.movimientos();
}
