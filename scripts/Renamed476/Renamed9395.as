package Renamed476
{
   import base.DiscreteSprite;
   import Renamed454.Renamed2268;
   
   public class Renamed8554 extends DiscreteSprite
   {
      private static const GAP:int = 10;
      
      public var headerText:String;
      
      public var Renamed9392:String;
      
      public var Renamed8925:String;
      
      public var header:Renamed9393;
      
      public var items:Renamed9394;
      
      public function Renamed8554(param1:String, param2:String, param3:String)
      {
         super();
         this.headerText = param1;
         this.Renamed9392 = param2;
         this.Renamed8925 = param3;
         this.init();
      }
      
      private function init() : void
      {
         this.header = new Renamed9393(this.headerText,this.Renamed9392);
         addChild(this.header);
         this.items = new Renamed9394();
         addChild(this.items);
      }
      
      public function addItem(param1:Renamed2268) : void
      {
         this.items.addItem(param1);
      }
      
      public function render(param1:int) : void
      {
         this.header.render(param1);
         this.items.render();
         this.items.y = this.header.y + this.header.height + GAP;
      }
      
      public function destroy() : void
      {
         this.header = null;
         this.items.destroy();
         this.items = null;
      }
   }
}

