package controls.resultassets
{
   import assets.resultwindow.items_mini_CENTER;
   import assets.resultwindow.items_mini_LEFT;
   import assets.resultwindow.items_mini_RIGHT;
   import controls.ButtonState;
   import flash.display.Graphics;
   
   public class WhiteFrame extends ButtonState
   {
      public function WhiteFrame()
      {
         super();
         bmpLeft = new items_mini_LEFT(1,1);
         bmpCenter = new items_mini_CENTER(1,1);
         bmpRight = new items_mini_RIGHT(1,1);
      }
      
      override public function draw() : void
      {
         var _loc1_:Graphics = null;
         _loc1_ = l.graphics;
         _loc1_.clear();
         _loc1_.beginBitmapFill(bmpLeft);
         _loc1_.drawRect(0,0,20,40);
         _loc1_.endFill();
         l.x = 0;
         l.y = 0;
         _loc1_ = c.graphics;
         _loc1_.clear();
         _loc1_.beginBitmapFill(bmpCenter);
         _loc1_.drawRect(0,0,_width - 40,40);
         _loc1_.endFill();
         c.x = 20;
         c.y = 0;
         _loc1_ = r.graphics;
         _loc1_.clear();
         _loc1_.beginBitmapFill(bmpRight);
         _loc1_.drawRect(0,0,20,40);
         _loc1_.endFill();
         r.x = _width - 20;
         r.y = 0;
      }
   }
}

