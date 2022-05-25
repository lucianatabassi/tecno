class Trazos {
  PImage []  trazos;
  int cantidad;
  int cantTrazosLargos = 5;
  int ancho, alto;
  int opacidad;
  String estado;
  int contador;
  PFont tipografia;
  float x;
  float y;

  Trazos () {
    cantidad = 5;
    ancho = 220;
    alto = 300;
    opacidad = 200;
    estado = "inicio";
    contador = 0;
    this.tipografia = loadFont("InkFree-48.vlw");

    trazos = new PImage [cantidad];

    for (int i = 0; i < cantidad; i++) {
      String nombre = "0" + i + ".png";
      trazos[i] = loadImage ( nombre );
      trazos[i].filter ( INVERT );
    }
  }

  void trazos(int tint, int ancho, int alto){ //estos valores se los paso en la clase TP1
   translate (-100, -110);
    for (int i = 0; i < cantidad; i++) {
      tint (tint);
      image (trazos[i], random (width), random (height), ancho, alto);
     }
   }
   
     void trazoTransp(int tint, int ancho, int alto){ //estos valores se los paso en la clase TP1
     translate (-100, -110);
    for (int i = 0; i < cantidad; i++) {
      tint (tint,200);
      image (trazos[i], random (width), random (height), ancho, alto);
     }
   }
  
   
    void firma () {
    textFont(this.tipografia);
    fill(#70BBA4);
    textSize(30);
    text("ROMA", 300, 500);
  }
  void estadoObra () {
    if (estado.equals ("inicio")) {
      contador++;
    } 
    if (contador >=1000) {
      estado = "fin";
      contador=0;
      cantidad = 0;
      cantTrazosLargos = 0;
      firma();
    }
    println("estado:" + estado);
    println("contador:" + contador);
  }
}
   
   
   //-----------------------------LOS DEJO POR LAS DUDAS-------------------------------------------------
    /*void trazoLargo() {
    int tancho = 100;
    int tlargo = 230;
    for (int i = 0; i < cantTrazosLargos; i++) {
      tint (paleta.darColorPaletaUno());
      image (trazos[i], random (width), random (height), tancho, tlargo);
    }
  }
  
  /*void trazosNormalesP1 () {
    translate (-100, -110);
    for (int i = 0; i < cantidad; i++) {
      tint (paleta.darColorPaletaUno());
      image (trazos[i], random (width), random (height), ancho, alto);
    }
  }

  void trazosNormalesP2 () {
    translate (-100, -110);
    for (int i = 0; i < cantidad; i++) {
      tint (paleta.darColorPaletaDos(), opacidad);
      image (trazos[i], random (width), random (height), ancho, alto);
    }
  }

  void trazosNormalesP3 () {
    translate (-100, -110);
    for (int i = 0; i < cantidad; i++) {
      tint (paleta.darColorPaletaTres());
      image (trazos[i], random (width), random (height), ancho, alto);
    }
  }

  void trazosNormalesP4 () {
    translate (-100, -110);
    for (int i = 0; i < cantidad; i++) {
      tint (paleta.darColorPaletaCuatro());
      image (trazos[i], random (width), random (height), ancho, alto);
    }
  }*/
//-------------------------------------------------------------------------------------------------
