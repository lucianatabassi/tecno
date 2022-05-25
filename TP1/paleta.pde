class Paleta {

  PImage img1, img2, img3, img4;

  Paleta ( String NombrePaleta ) {

    img1 = loadImage (NombrePaleta);
    img2 = loadImage (NombrePaleta);
    img3 = loadImage (NombrePaleta);
    img4 = loadImage (NombrePaleta);
  }


  color darColorPaletaUno () {
    int x = int (random (img1.width));
    int y = int (random (img1.height));
    return img1.get ( x, y );
  }
  
  color darColorPaletaDos () { 
    int x = int (random (img2.width));
    int y = int (random (img2.height));
    return img2.get ( x, y );
  }
  
  color darColorPaletaTres () {
    int x = int (random (img3.width));
    int y = int (random (img3.height));
    return img3.get ( x, y );
  }
  
  color darColorPaletaCuatro () {
    int x = int (random (img4.width));
    int y = int (random (img4.height));
    return img4.get ( x, y );
  }
  
}
