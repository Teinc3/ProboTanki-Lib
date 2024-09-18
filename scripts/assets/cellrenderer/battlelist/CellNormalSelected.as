package assets.cellrenderer.battlelist
{
   import controls.ButtonState;
   import flash.display.Graphics;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol25")]
   public class CellNormalSelected extends ButtonState
   {
      public function CellNormalSelected()
      {
         super();
         bmpLeft = new cell_normal_SELECTED_LEFT(1,1);
         bmpCenter = new cell_normal_SELECTED_CENTER(1,1);
         bmpRight = new cell_normal_SELECTED_RIGHT(1,1);
      }
      
      override public function draw() : void
      {
         var _loc1_:Graphics = null;
         _loc1_ = l.graphics;
         _loc1_.clear();
         _loc1_.beginBitmapFill(bmpLeft);
         _loc1_.drawRect(0,0,5,20);
         _loc1_.endFill();
         l.x = 0;
         l.y = 0;
         _loc1_ = c.graphics;
         _loc1_.clear();
         _loc1_.beginBitmapFill(bmpCenter);
         _loc1_.drawRect(0,0,_width - 10,20);
         _loc1_.endFill();
         c.x = 5;
         c.y = 0;
         _loc1_ = r.graphics;
         _loc1_.clear();
         _loc1_.beginBitmapFill(bmpRight);
         _loc1_.drawRect(0,0,5,20);
         _loc1_.endFill();
         r.x = _width - 5;
         r.y = 0;
      }
   }
}

