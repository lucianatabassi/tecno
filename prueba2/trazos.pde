class Trazos {
  Interaccion i;
  PImage trazos;
  float x, y;
  float vx, vy;
  int cantidad;

  Trazos (float x_, float y_, float vx_, float vy_) {
    i = new Interaccion();
    x = x_;
    y = y_;
    vx = vx_;
    vy = vy_;
    cantidad = 21;
  }

  void dibujar () {
    x += vx;
    y += vy;
  }

  void movimientos () {
    i.actualizar();


    // si vas para arriba el color es saturado
    if (i.arriba) { 
      for (int i = 0; i < cantidad; i++) {
        String nombre = "0" + i + ".png";
        trazos = loadImage ( nombre );
        trazos.filter ( INVERT );

        tint (paleta.darColor());
        image (trazos, random (width), random (height));
      }
    }

    //si vas para abajo tiene poca opacidad
    if (i.abajo) {
      for (int i = 0; i < cantidad; i++) {
        String nombre = "0" + i + ".png";
        trazos = loadImage ( nombre );
        trazos.filter ( INVERT );

        tint (paleta.darColor(), 100);
        image (trazos, random (width), random (height));
      }
    }
  }
}
