package controls.statassets
{
   import assets.stat.hall_ARROW;
   import assets.stat.hall_HEADER;
   import flash.display.BitmapData;
   
   public class StatLineHeader extends StatLineBase
   {
      protected var _selected:Boolean = false;
      
      protected var ar:BitmapData;
      
      public function StatLineHeader()
      {
         super();
         tl = new hall_HEADER(1,1);
         px = new BitmapData(1,1,false,5898034);
         this.ar = new hall_ARROW(1,1);
      }
      
      public function set selected(param1:Boolean) : void
      {
         this._selected = param1;
         this.draw();
      }
      
      override protected function draw() : void
      {
         super.draw();
      }
   }
}

