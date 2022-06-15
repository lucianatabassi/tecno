class Trazos {
  PImage trazos;
  int cantidad;
  int ancho, alto;
  int opacidad;
  String estado;
  int contador;
  PFont tipografia;

  Trazos () {
    cantidad = 1;
    ancho = 220;
    alto = 300;
    opacidad = 200;
    estado = "Inicio";
    contador = 0;
    this.tipografia = loadFont("InkFree-48.vlw");


    for (int i = 0; i < cantidad; i++) {
      String nombre = "0" + i + ".png";
      trazos = loadImage ( nombre );
      trazos.filter ( INVERT );
    }
  }
  void trazos(int tint, int ancho, int alto, int tranps) { //estos valores se los paso en la clase TP1
    translate (-100, -110);
    for (int i = 0; i < cantidad; i++) {
      tint (tint, tranps );
      image (trazos, random (width), random (height), ancho, alto);
    }
  }

  void firma () {
    textFont(this.tipografia);
    fill(#05A97A);
    textSize(30);
    text("ROMA", 300, 500);
  }
  void estadoObra () {
    if (estado.equals ("Inicio")) {
      contador++;
    } 
    if (contador >=1000) {
      estado = "Fin";
      contador=0;
      cantidad = 0;
      firma();
    }
    println("Estado:" + estado);
    println("Contador:" + contador);
  }

  void reiniciarObra() {
    estado = "inicio";
    cantidad = 1;
  }
}
