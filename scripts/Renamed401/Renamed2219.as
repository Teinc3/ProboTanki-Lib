package Renamed401
{
   import Renamed476.Renamed8554;
   import Renamed315.Renamed2234;
   import Renamed440.Renamed8555;
   import Renamed454.Renamed2268;
   
   public class Renamed2219 extends Renamed2234
   {
      private var view:Renamed8555;
      
      private var _width:int;
      
      private var _height:int;
      
      public function Renamed2219()
      {
         super();
         this.view = new Renamed8555();
         addChild(this.view);
      }
      
      public function Renamed2223(param1:String, param2:String, param3:String) : void
      {
         var _loc4_:Renamed8554 = new Renamed8554(param2,param3,param1);
         this.view.Renamed8556(_loc4_);
      }
      
      public function addItem(param1:Renamed2268, param2:String) : void
      {
         this.view.addItem(param2,param1);
      }
      
      override public function render(param1:int, param2:int) : void
      {
         this._width = param1;
         this._height = param2;
         this.view.render(param1,param2);
      }
      
      override public function Renamed2241() : void
      {
      }
      
      override public function destroy() : void
      {
         super.destroy();
         this.view.destroy();
         this.view = null;
      }
      
      override public function get width() : Number
      {
         return this._width;
      }
      
      override public function get height() : Number
      {
         return this._height;
      }
      
      public function Renamed8557(param1:String) : void
      {
      }
   }
}

