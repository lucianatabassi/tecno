class Trazos {
  Interaccion i;
  PImage trazos;
  int cantidad;

  Trazos () {
    i = new Interaccion();
    cantidad = 10;
  }

  void dibujar () {
    translate (-40, -50);
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
