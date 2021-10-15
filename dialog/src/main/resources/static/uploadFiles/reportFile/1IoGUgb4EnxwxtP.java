import acm.graphics.*;
import acm.program.*;
import acm.util.*;
import java.awt.*;
import java.awt.event.*;

public class PicturePanel extends GraphicsProgram {
   
   public void run() {
      GImage daisy = new GImage("res/img/daisy.jpg");
      double daisyWidth = daisy.getWidth();
      double daisyHeight = daisy.getHeight();
      setCanvasSize(daisyWidth, daisyHeight);
      add(daisy);
      createBlocks();
   }
   
   public void createBlocks() {
      for(int i=0; i<4; i++) {
         for(int j=0; j<4; j++) {
            GRect grayBlocks = new GRect(0,0);
            double blockWidth = getWidth()/4;
            double blockHeight = getHeight()/4;
            grayBlocks.setSize(blockWidth, blockHeight);
            grayBlocks.setColor(Color.WHITE);
            grayBlocks.setFilled(true);
            grayBlocks.setFillColor(Color.GRAY);
            double blockX = j*blockWidth;
            double blockY = i*blockHeight;
            add(grayBlocks,blockX,blockY);
         }
      }
   }
   
   public void mouseClicked(MouseEvent event) {
      double mouseX = event.getX();
      double mouseY = event.getY();
      GObject block = getElementAt(mouseX,mouseY);
      remove(block);
   }
   
}