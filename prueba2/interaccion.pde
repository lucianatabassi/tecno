class Interaccion {

  Dir_y_Vel mouse;
  boolean seMoviaEnElFrameAnterior; // determinar cambio de estado: lo que ocurria antes
  boolean arriba;
  boolean abajo;
  boolean derecha;
  boolean izquierda;

  Interaccion () {
    mouse = new Dir_y_Vel();
  }
  
  void actualizar () {
    mouse.calcularTodo (mouseX, mouseY);


    // que pasa con el mouse en este frame//
    boolean seMueveElMouseEnEsteFrame = false;
    float sensibilidad = 10;
    if (mouse.velocidad()>sensibilidad && mouse.velocidad()<150) {
      seMueveElMouseEnEsteFrame = true;
    }
    arriba = false;
    abajo = false;
    derecha = false;
    izquierda = false;
    if (seMueveElMouseEnEsteFrame && 
      !seMoviaEnElFrameAnterior ) {
      arriba = mouse.direccionY()<-sensibilidad?true:false;
      abajo = mouse.direccionY()>sensibilidad?true:false;
      derecha = mouse.direccionX()>sensibilidad?true:false;
      izquierda = mouse.direccionX()<-sensibilidad?true:false;
    }

    // dejo listo todo para el sig frame //
    seMoviaEnElFrameAnterior = seMueveElMouseEnEsteFrame;
  }
}
