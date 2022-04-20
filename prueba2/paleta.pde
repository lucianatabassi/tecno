class Paleta {

  PImage imagen;

  Paleta (String nombreImagen) {

    imagen = loadImage ( nombreImagen );
  }


  color darColor () {
    int x = int (random (imagen.width));
    int y = int (random (imagen.height));
    return imagen.get ( x, y );
  }
}
