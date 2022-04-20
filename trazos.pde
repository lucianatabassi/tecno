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
    cantidad = 10;
  }

  void dibujar () {
    translate (-40, -50);
    x += vx;
    y += vy;
  }

  void movimientos () {
    i.actualizar();


    // si vas para arriba se usa el color de la primera paleta
    if (i.arriba) { 
      for (int i = 0; i < cantidad; i++) {
        String nombre = "0" + i + ".png";
        trazos = loadImage ( nombre );
        trazos.filter ( INVERT );

        tint (paleta.darColorPaletaUno());
        image (trazos, random (width), random (height));
      }
    }

    //si vas para abajo se usa el color de la segunda paleta
    if (i.abajo) {
      for (int i = 0; i < cantidad; i++) {
        String nombre = "0" + i + ".png";
        trazos = loadImage ( nombre );
        trazos.filter ( INVERT );

        tint (paleta.darColorPaletaDos());
        image (trazos, random (width), random (height));
      }
    }
    //si vas para la derecha se usa el color de la segunda paleta
    if (i.derecha) {
      for (int i = 0; i < cantidad; i++) {
        String nombre = "0" + i + ".png";
        trazos = loadImage ( nombre );
        trazos.filter ( INVERT );

        tint (paleta.darColorPaletaTres());
        image (trazos, random (width), random (height));
      }
    }

    //si vas para la izquierda se usa el color de la segunda paleta
    if (i.izquierda) {
      for (int i = 0; i < cantidad; i++) {
        String nombre = "0" + i + ".png";
        trazos = loadImage ( nombre );
        trazos.filter ( INVERT );

        tint (paleta.darColorPaletaCuatro());
        image (trazos, random (width), random (height));
      }
    }
  }
}
