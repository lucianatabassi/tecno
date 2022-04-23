class Interaccion {

  Dir_y_Vel mouse; //devuelve dir y vel del mouse

  //PARA COLORES
  boolean seMoviaEnElFrameAnterior; // determinar cambio de estado: lo que ocurria antes
  boolean arriba;
  boolean abajo;
  boolean derecha;
  boolean izquierda;

  //PARA LARGO DEL TRAZO
  boolean movGrande;
  boolean movPeq;
  float tiempoGrande;
  float tiempoPeq;

  Interaccion () {
    mouse = new Dir_y_Vel();
  }

  void actualizar () {
    mouse.calcularTodo (mouseX, mouseY);
    
    //PARA LARGO DEL TRAZO
    movGrande = false;
    movPeq = false;
    tiempoGrande --;
    tiempoPeq --;
    tiempoGrande = constrain(tiempoGrande, 0, 90); // no puede ser mas chico que 0 ni mas grande que 90
    tiempoPeq = constrain(tiempoPeq, 0, 90);

    if (mouse.velocidad() > 10) {
      float umbral = 40;
      if (mouse.velocidad()>umbral) {
        tiempoGrande+=10;
        tiempoPeq-=10;
      } else {
        if (tiempoGrande<10) {
          tiempoPeq +=10;
        }
      }
    }

    if (tiempoGrande>55) {
      movGrande = true;
    } 
    if (tiempoPeq>55) {
      movPeq = true;
    }



    //PARA CAMBIOS DE COLORES
    // que pasa con el mouse en este frame//
    boolean seMueveElMouseEnEsteFrame = false;
    float sensibilidad = 5;
    if (mouse.velocidad()>sensibilidad && mouse.velocidad()<50) {
      seMueveElMouseEnEsteFrame = true;
    }
    arriba = false;
    abajo = false;
    derecha = false;
    izquierda = false;

    if (seMueveElMouseEnEsteFrame && 
      !seMoviaEnElFrameAnterior ) { // ! significa no
      arriba = mouse.direccionY()<-sensibilidad?true:false;      
      abajo = mouse.direccionY()>sensibilidad?true:false;
      derecha = mouse.direccionX()>sensibilidad?true:false;
      izquierda = mouse.direccionX()<-sensibilidad?true:false;
    } 



    // dejo listo todo para el sig frame //
    seMoviaEnElFrameAnterior = seMueveElMouseEnEsteFrame;
  }
}
