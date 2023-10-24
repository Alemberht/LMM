import processing.serial.*;
Serial port;
import java.awt.AWTException; 
import java.awt.Robot; // La clase Robot en cuestión
import java.awt.event.KeyEvent; // Los eventos del teclado que ejecutaremos

Robot r;
void setup(){
  size(500, 500);
  background(0);

  // INICIALIZAR PUERTO SERIAL
  println(Serial.list());
  if (Serial.list()[0] != null)
    port = new Serial(this, Serial.list()[0], 9600);

  port.clear(); // Vaciamos el puerto preventivamente.
   try {
    r = new Robot();
    r.mouseMove(displayWidth/2, displayHeight/2); // Muevo el mouse para probar si funciona
  }
  catch (AWTException e) {
    println("Robot class not supported by your system!");
    println("La clase Robot no tiene soporte en su sistema");
    exit();
  }
}
void draw() {
  if (port.available()>0) {
    String full = port.readString();
    String s[] = split(full, ',');

    println(full);

   
    boolean leftPressed = false;
    boolean rightPressed = false;

    boolean iPressed = false;
    boolean jPressed = false;
    boolean kPressed = false;
    boolean lPressed = false;

    for(int i = 0; i < s.length; i++) {
      if(s[i].equals("D")) rightPressed = true;
      if(s[i].equals("A")) leftPressed = true;

      if(s[i].equals("I")) iPressed = true;
      if(s[i].equals("J")) jPressed = true;
      if(s[i].equals("K")) kPressed = true;
      if(s[i].equals("L")) lPressed = true;
    }
    if(rightPressed) r.keyPress(KeyEvent.VK_D);
    else r.keyRelease(KeyEvent.VK_D);

    if(leftPressed) r.keyPress(KeyEvent.VK_A);
    else r.keyRelease(KeyEvent.VK_A);

    if(iPressed) r.keyPress(KeyEvent.VK_I);
    else r.keyRelease(KeyEvent.VK_I);

    if(jPressed) r.keyPress(KeyEvent.VK_J);
    else r.keyRelease(KeyEvent.VK_J);

    if(kPressed) r.keyPress(KeyEvent.VK_K);
    else r.keyRelease(KeyEvent.VK_K);

    if(lPressed) r.keyPress(KeyEvent.VK_L);
    else r.keyRelease(KeyEvent.VK_L);

  } else {
    r.keyRelease(KeyEvent.VK_A);
    r.keyRelease(KeyEvent.VK_D);

    r.keyRelease(KeyEvent.VK_I);
    r.keyRelease(KeyEvent.VK_J);
    r.keyRelease(KeyEvent.VK_K);
    r.keyRelease(KeyEvent.VK_L);
  }

  port.clear();
  // println(".");

}
