import oscP5.*;
OscP5 osc;
GestorSenial gestorAmp;
GestorSenial gestorPitch;

boolean monitor = false;

float amortiguacion = 0.9;

float minPitch = 54;
float maxPitch = 96; 

float minAmp = 60;
float maxAmp = 100; 


float amp = 0;
float pitch = 0;

boolean antesHabiaSonido = false;

Trazos t;

Paleta paleta;

Interaccion i;

void setup () {
  size (400, 600);

  osc = new OscP5(this, 12345);

  gestorAmp = new GestorSenial (minAmp, maxAmp, amortiguacion);
  gestorPitch = new GestorSenial (minPitch, maxPitch, amortiguacion);

  t = new Trazos();
  i =  new Interaccion();
  paleta = new Paleta ("roma1.jpg");
  paleta = new Paleta ("roma2.jpg");
  paleta = new Paleta ("roma3.jpg");
  paleta = new Paleta ("roma4.jpg");
}

void draw () {

  gestorAmp.actualizar(amp);
  gestorPitch.actualizar(pitch);
  
  boolean haySonido = gestorAmp.filtradoNorm() > 0.2;
  
  boolean empezoElSonido = haySonido && !antesHabiaSonido;
  //boolean terminoElSonido = !haySonido && antesHabiaSonido;

if (empezoElSonido) {
  t.dibujar();
  //t.movimientos();
  
  }
  
  if (haySonido) {
    t.trazosNormalesP1();
    }
    
    if ( monitor ) {
    //muestra la señal en pantalla
    gestorPitch.imprimir(100, 100 );
    gestorAmp.imprimir(100, 250 , 500 , 100 ,  false, true);
  }

  //esto era una prueba pero lo dejo por las dudas
  /*  i.actualizar();
   
   if (i.arriba) {
   println("arriba");
   }
   
   if (i.abajo) {
   println("abajo");
   }
   
   if (i.derecha) {
   println("derecha");
   }
   
   if (i.izquierda) {
   println("izquierda");
   }*/
}

void  oscEvent (OscMessage m) {

  if (m.addrPattern().equals("/amp")) {
    amp = m.get(0).floatValue();
  } else if (m.addrPattern().equals("/pitch")) {
    pitch = m.get(0).floatValue();
  }
}
