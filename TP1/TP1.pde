import oscP5.*;
OscP5 osc;
GestorSenial gestorAmp;
GestorSenial gestorPitch;

boolean monitor = false;

//float amortiguacion = 0.9;

float minPitch = 61;
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

  gestorAmp = new GestorSenial (minAmp, maxAmp); //min y max de entrada q queremos evaluar
  gestorPitch = new GestorSenial (minPitch, maxPitch);

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

  //boolean haySonido  =  gestorAmp.filtradoNorm() > 0.2;
  
  /*--- aca lo que hice fue limitar el volumen y la altura (los numeros estan normalizados)*/
  boolean agudoYalto = gestorAmp.filtradoNorm() > 0.4 && gestorPitch.filtradoNorm() > 0.1;
  boolean bajoYagudo = gestorAmp.filtradoNorm() > 0.1 && gestorAmp.filtradoNorm() < 0.4 && gestorPitch.filtradoNorm() > 0.1;
  boolean altaYgrave = gestorAmp.filtradoNorm() > 0.4 && gestorPitch.filtradoNorm() < 0.1 ;
  boolean bajoYgrave = gestorAmp.filtradoNorm() > 0.1 && gestorAmp.filtradoNorm() < 0.3 ;

  //boolean empezoElSonido = haySonido && !antesHabiaSonido;
  //boolean terminoElSonido = !haySonido && antesHabiaSonido;

  /*  if (empezoElSonido) {
   t.dibujar();
   }*/

  /*---sonidos largos para trazos normales--- */
  
  if (agudoYalto) {
    t.dibujar();
    t.trazosNormalesP1();
  } 
  if (bajoYgrave) {
    t.dibujar();
    t.trazosNormalesP2();
  } 
  if (altaYgrave) {
    t.dibujar();
    t.trazosNormalesP3();
  } 
  if (bajoYagudo) {
    t.dibujar();
    t.trazosNormalesP4();
  } 










  if ( monitor ) {
    //muestra la señal en pantalla
    gestorPitch.imprimir(100, 100 );
    gestorAmp.imprimir(100, 250, 500, 100, false, true);
  }
}

void  oscEvent (OscMessage m) {

  if (m.addrPattern().equals("/amp")) {
    amp = m.get(0).floatValue();
  } else if (m.addrPattern().equals("/pitch")) {
    pitch = m.get(0).floatValue();
  }
}