class Trazos {
  Interaccion i;

  //PImage trazos;
  int cantidad;
  int cantTrazosLargos = 2;
  int ancho, alto;
  int opacidad;
  String estado;
  int contador;
  PImage []  trazos;
  PFont tipografia;
  float x;
  float y;

  Trazos () {

    // i = new Interaccion();
    cantidad = 5;
    ancho = 220;
    alto = 300;
    opacidad = 200;
    estado = "inicio";
    contador =0;
    this.tipografia = loadFont("InkFree-48.vlw");

    trazos = new PImage [cantidad];

    for (int i = 0; i < cantidad; i++) {
      String nombre = "0" + i + ".png";
      trazos[i] = loadImage ( nombre );
      trazos[i].filter ( INVERT );
    }
  }

  void estadoObra () {
    if (estado.equals ("inicio")) {
      contador++;
    } 
    if (contador >=500) {
      estado = "fin";
      contador=0;
      cantidad = 0;
      firma();
    }
    println("estado:" + estado);
    println("contador:" + contador);
  }

  void firma () {
    textFont(this.tipografia);
    fill(#70BBA4);
    textSize(30);
    text("ROMA", 300, 500);
  }

  void trazosNormalesP1 () {
    translate (-100, -110);
    for (int i = 0; i < cantidad; i++) {
      tint (paleta.darColorPaletaUno());
      image (trazos[i], random (width), random (height), ancho, alto);
    }
  }

  void trazosNormalesP2 () {
    translate (-100, -110);
    for (int i = 0; i < cantidad; i++) {
      /* String nombre = "0" + i + ".png";
       trazos = loadImage ( nombre );
       trazos.filter ( INVERT );*/

      tint (paleta.darColorPaletaDos(), opacidad);
      image (trazos[i], random (width), random (height), ancho, alto);
    }
  }

  void trazosNormalesP3 () {
    translate (-100, -110);
    for (int i = 0; i < cantidad; i++) {
      /* String nombre = "0" + i + ".png";
       trazos = loadImage ( nombre );
       trazos.filter ( INVERT );*/

      tint (paleta.darColorPaletaTres());
      image (trazos[i], random (width), random (height), ancho, alto);
    }
  }

  void trazosNormalesP4 () {
    translate (-100, -110);
    for (int i = 0; i < cantidad; i++) {
      /*  String nombre = "0" + i + ".png";
       trazos = loadImage ( nombre );
       trazos.filter ( INVERT );*/

      tint (paleta.darColorPaletaCuatro());
      image (trazos[i], random (width), random (height), ancho, alto);
    }
  }

  /*void trazoLargo() {
   int tancho = 100;
   int tlargo = 230;
   for (int i = 0; i < cantTrazosLargos; i++) {
   String nombre = "0" + i + ".png";
   trazos = loadImage ( nombre );
   trazos.filter ( INVERT );
   tint (paleta.darColorPaletaUno());
   image (trazos, random (width), random (height), tancho, tlargo);
   }
   }*/
}
