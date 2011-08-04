//"C:\Program Files\Java\jdk1.7.0\bin\javac.exe" Keys.java
import java.awt.Robot;
import java.awt.AWTException;
import java.awt.event.InputEvent;
import java.awt.event.KeyEvent;

// don't know how to do all the cool dynamic stuff like
// you can do in javascript
class Keys {
    Robot robot;
    int delay = 50;
    public Keys() throws AWTException {
      Robot robot = new Robot();
      this.robot = robot;
    }
    public void altPrintScreen() {
      keyCombo(KeyEvent.VK_ALT, KeyEvent.VK_PRINTSCREEN);
    }
    public void altTab() {
      keyCombo(KeyEvent.VK_ALT, KeyEvent.VK_TAB);
    }
    public void altF1() {
      keyCombo(KeyEvent.VK_ALT, KeyEvent.VK_F1);
    }
    public void altF2() {
      keyCombo(KeyEvent.VK_ALT, KeyEvent.VK_F22);
    }
    public void altF3() {
      keyCombo(KeyEvent.VK_ALT, KeyEvent.VK_F3);
    }
    public void altF4() {
      keyCombo(KeyEvent.VK_ALT, KeyEvent.VK_F4);
    }
    public void altF5() {
      keyCombo(KeyEvent.VK_ALT, KeyEvent.VK_F5);
    }
    public void altF6() {
      keyCombo(KeyEvent.VK_ALT, KeyEvent.VK_F6);
    }
    public void altF7() {
      keyCombo(KeyEvent.VK_ALT, KeyEvent.VK_F7);
    }
    public void altF8() {
      keyCombo(KeyEvent.VK_ALT, KeyEvent.VK_F8);
    }
    public void F1() {
      simplePress(KeyEvent.VK_F1);
    }
    public void F2() {
      simplePress(KeyEvent.VK_F2);
    }
    public void F3() {
      simplePress(KeyEvent.VK_F3);
    }
    public void F4() {
      simplePress(KeyEvent.VK_F4);
    }
    public void F5() {
      simplePress(KeyEvent.VK_F5);
    }
    public void F6() {
      simplePress(KeyEvent.VK_F6);
    }
    public void F7() {
      simplePress(KeyEvent.VK_F7);
    }
    public void F8() {
      simplePress(KeyEvent.VK_F8);
    }

    public void keyCombo(int first, int second) {
      robot.keyPress(first);
      robot.delay(delay);
      robot.keyPress(second);
      robot.delay(delay);
      robot.keyRelease(first);
      robot.delay(delay);
      robot.keyRelease(second);
    }

    public void simplePress(int key) {
      robot.keyPress(key);
      robot.delay(delay);
      robot.keyRelease(key);
    }

    // not sure how to do this with reflection and a hash
    // i wish this was js
    public void runCommand(String arg) {
      System.out.println(arg);
      if (arg.equals("alt_printscreen")) {
        altPrintScreen();
      } else if (arg.equals("alt_tab")) {
        altTab();
      } else if (arg.equals("alt_f1")) {
        altF1();
      } else if (arg.equals("alt_f2")) {
        altF2();
      } else if (arg.equals("alt_f3")) {
        altF3();
      } else if (arg.equals("alt_f4")) {
        altF4();
      } else if (arg.equals("alt_f5")) {
        altF5();
      } else if (arg.equals("alt_f6")) {
        altF6();
      } else if (arg.equals("alt_f7")) {
        altF7();
      } else if (arg.equals("alt_f8")) {
        altF8();
      } else if (arg.equals("f1")) {
        altF1();
      } else if (arg.equals("f2")) {
        altF2();
      } else if (arg.equals("f3")) {
        altF3();
      } else if (arg.equals("f4")) {
        altF4();
      } else if (arg.equals("f5")) {
        altF5();
      } else if (arg.equals("f6")) {
        altF6();
      } else if (arg.equals("f7")) {
        altF7();
      } else if (arg.equals("f8")) {
        altF8();
      } else {
        altPrintScreen();
      }
    }
    public void runCommands(String[] args) {
       int i;
       String arg;
       for (i=0; i<args.length; i++) {
         arg = args[i];
         runCommand(arg);
         robot.delay(delay);
       }
    }


    public static void main(String[] args) {
      try {
        System.out.println("Keys!"); // Display the string.
        Keys keys = new Keys();
        keys.runCommands(args);
      } catch (Exception e){
        e.printStackTrace();
      }
    }
}

