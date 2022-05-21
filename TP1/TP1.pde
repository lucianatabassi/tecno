import oscP5.*;
OscP5 osc;
GestorSenial gestorAmp;
GestorSenial gestorPitch;

boolean monitor = true;

float amortiguacion = 0.9;

float minPitch = 61;
float maxPitch = 96; 

float minAmp = 60;
float maxAmp = 100; 


float amp = 0;
float pitch = 0;

boolean antesHabiaSonido = false;

PGraphics grafico;
Trazos t;

Paleta paleta;

Interaccion i;

void setup () {
  size (400, 600);

  osc = new OscP5(this, 12345);

  gestorAmp = new GestorSenial (minAmp, maxAmp, amortiguacion); //min y max de entrada q queremos evaluar
  gestorPitch = new GestorSenial (minPitch, maxPitch, amortiguacion);

  t = new Trazos();
  i =  new Interaccion();
  paleta = new Paleta ("roma1.jpg");
  paleta = new Paleta ("roma2.jpg");
  paleta = new Paleta ("roma3.jpg");
  paleta = new Paleta ("roma4.jpg");
  
  grafico = createGraphics (width, height);
}

void draw () {
 // background (0);
  gestorAmp.actualizar(amp);
  gestorPitch.actualizar(pitch);

  //boolean haySonido  =  gestorAmp.filtradoNorm() > 0.2;

  /*--- aca lo que hice fue limitar el volumen y la altura (los numeros estan normalizados)*/
  boolean agudoYalto = gestorAmp.filtradoNorm() > 0.3 && gestorPitch.filtradoNorm() > 0.1;
  boolean bajoYagudo = gestorAmp.filtradoNorm() > 0.1 && gestorAmp.filtradoNorm() < 0.4 && gestorPitch.filtradoNorm() > 0.1;
  boolean altaYgrave = gestorAmp.filtradoNorm() > 0.3 && gestorPitch.filtradoNorm() < 0.1 ;
  boolean bajoYgrave = gestorAmp.filtradoNorm() > 0.1 && gestorAmp.filtradoNorm() < 0.3 ;
  
  t.estadoObra();
   
  /*---sonidos largos para trazos normales--- */
  grafico.beginDraw();
  
 if (agudoYalto) {
   t.trazosNormalesP1();
   println ("agudo y alto");
  } 
 if (bajoYgrave) {
    t.trazosNormalesP2();
    println ("bajo y grave");
  } 
  if (altaYgrave) {
    t.trazosNormalesP3();
    println ("aalto y grave");
  } 
 if (bajoYagudo) {
    t.trazosNormalesP4();
    println ("bajo y agudo");
  } 
  grafico.endDraw();
  
 // tint (255, 100);
  
  image (grafico, 0, 0);



//boolean empezoElSonido = haySonido && !antesHabiaSonido;
  //boolean terminoElSonido = !haySonido && antesHabiaSonido;

  /*  if (empezoElSonido) {
   t.dibujar();
   }*/




  if ( monitor ) {
    //muestra la señal en pantalla
    gestorAmp.imprimir( 100, 100, 400, 200);
    gestorPitch.imprimir( 100, 350, 400, 200, false, true);
  }
}

void  oscEvent (OscMessage m) {

  if (m.addrPattern().equals("/amp")) {
    amp = m.get(0).floatValue();
  } else if (m.addrPattern().equals("/pitch")) {
    pitch = m.get(0).floatValue();
  }
}
