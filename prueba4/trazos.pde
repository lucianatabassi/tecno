class Trazos {
  Interaccion i;
  PImage trazos;
  int cantidad;
  int cantTrazosLargos = 2;
  int ancho, alto;
  int opacidad;

  Trazos () {
    i = new Interaccion();
    cantidad = 5;
    ancho = 220;
    alto = 300;
    opacidad = 200;
  }

  void dibujar () {
    translate (-90, -100);
  }

  void trazoLargo() {
    int tancho = 100;
    int tlargo = 230;
    for (int i = 0; i < cantTrazosLargos; i++) {
      String nombre = "0" + i + ".png";
      trazos = loadImage ( nombre );
      trazos.filter ( INVERT );
      tint (paleta.darColorPaletaUno());
      image (trazos, random (width), random (height), tancho, tlargo);
    }
  }

  void movimientos () {
    i.actualizar();

    // EN TODAS LAS DIRECCIONES, AL HACER MOVIMIENTOS LARGOS LOS TRAZOS VAN A SER LARGOS Y AL HACER MOVIMIENTO CORTOS LOS TRAZOS VAN A TENER EL TAMAÑO PREDETERMINADO
    
    // si vas para arriba se usa el color de la primera paleta.
    if (i.arriba && i.movGrande) { 
      trazoLargo ();
    } else if (i.arriba && i.movPeq) {
      for (int i = 0; i < cantidad; i++) {
        String nombre = "0" + i + ".png";
        trazos = loadImage ( nombre );
        trazos.filter ( INVERT );

        tint (paleta.darColorPaletaUno(), opacidad);
        image (trazos, random (width), random (height), ancho, alto);
      }
    }

    //si vas para abajo se usa el color de la segunda paleta
    if (i.abajo && i.movGrande) {
      trazoLargo();
    } else if (i.abajo && i.movPeq) {
      for (int i = 0; i < cantidad; i++) {
        String nombre = "0" + i + ".png";
        trazos = loadImage ( nombre );
        trazos.filter ( INVERT );

        tint (paleta.darColorPaletaUno(), opacidad);
        image (trazos, random (width), random (height), ancho, alto);
      }
    }


    //si vas para la derecha se usa el color de la segunda paleta
    if (i.derecha && i.movGrande) {
      trazoLargo();
    } else if (i.derecha && i.movPeq) {
      for (int i = 0; i < cantidad; i++) {
        String nombre = "0" + i + ".png";
        trazos = loadImage ( nombre );
        trazos.filter ( INVERT );

        tint (paleta.darColorPaletaTres(), opacidad);
        image (trazos, random (width), random (height), ancho, alto);
      }
    }

    //si vas para la izquierda se usa el color de la segunda paleta
    if (i.izquierda && i.movGrande) {
      trazoLargo();
    } else if (i.izquierda && i.movPeq) {
      for (int i = 0; i < cantidad; i++) {
        String nombre = "0" + i + ".png";
        trazos = loadImage ( nombre );
        trazos.filter ( INVERT );

        tint (paleta.darColorPaletaCuatro(), opacidad);
        image (trazos, random (width), random (height), ancho, alto);
      }
    }
  }
}
