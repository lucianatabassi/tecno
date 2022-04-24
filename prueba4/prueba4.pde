/* 
Comision: Matias
Aylen Zegarra García
Lourdes Sanchez
Luciana Tabassi
*/

Trazos t;

Paleta paleta;

Interaccion i;

void setup () {
  size (400, 600);
  t = new Trazos();
  i =  new Interaccion();
  paleta = new Paleta ("roma1.jpg");
  paleta = new Paleta ("roma2.jpg");
  paleta = new Paleta ("roma3.jpg");
  paleta = new Paleta ("roma4.jpg");
  
}

void draw () {
  t.dibujar();
  t.movimientos();
  
  //esto era una prueba pero lo dejo por las dudas
  i.actualizar();
  
  if (i.arriba) {
    println("arriba");
    }
    
    if (i.abajo) {
    println("abajo");
    }
    
    if (i.derecha) {
    println("derecha");
    }
    
    if (i.izquierda) {
    println("izquierda");
    }
}
