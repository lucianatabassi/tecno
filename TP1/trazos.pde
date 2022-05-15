class Trazos {
  Interaccion i;

  PImage trazos;
  int cantidad;
  int cantTrazosLargos = 2;
  int ancho, alto;
  int opacidad;
  int contador;
  
  float x;
  float y;

  Trazos () {

    i = new Interaccion();
    cantidad = 5;
    ancho = 220;
    alto = 300;
    opacidad = 200;
    contador =0;
  }

  void dibujar () {
    translate (-90, -100);
  }
  

  void trazosNormalesP1 () {
    for (int i = 0; i < cantidad; i++) {
      String nombre = "0" + i + ".png";
      trazos = loadImage ( nombre );
      trazos.filter ( INVERT );

      tint (paleta.darColorPaletaUno());
      image (trazos, random (width), random (height), ancho, alto);
    }
  }

  void trazosNormalesP2 () {
    for (int i = 0; i < cantidad; i++) {
      String nombre = "0" + i + ".png";
      trazos = loadImage ( nombre );
      trazos.filter ( INVERT );

      tint (paleta.darColorPaletaDos(), opacidad);
      image (trazos, random (width), random (height), ancho, alto);
    }
  }

  void trazosNormalesP3 () {
    for (int i = 0; i < cantidad; i++) {
      String nombre = "0" + i + ".png";
      trazos = loadImage ( nombre );
      trazos.filter ( INVERT );

      tint (paleta.darColorPaletaTres());
      image (trazos, random (width), random (height), ancho, alto);
    }
  }

  void trazosNormalesP4 () {
    for (int i = 0; i < cantidad; i++) {
      String nombre = "0" + i + ".png";
      trazos = loadImage ( nombre );
      trazos.filter ( INVERT );

      tint (paleta.darColorPaletaCuatro());
      image (trazos, random (width), random (height), ancho, alto);
    }
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

    
 }
