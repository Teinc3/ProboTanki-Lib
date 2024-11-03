package controls.containers
{
   import base.DiscreteSprite;
   import controls.base.TankInputBase;
   import flash.display.DisplayObject;
   
   public class Renamed4027 extends DiscreteSprite
   {
      private var margin:int;
      
      public var items:Vector.<DisplayObject>;
      
      public function Renamed4027()
      {
         this.items = new Vector.<DisplayObject>();
         super();
      }
      
      public function addItem(param1:DisplayObject) : void
      {
         addChild(param1);
         this.items.push(param1);
         this.Renamed4028(param1);
      }
      
      public function removeItem(param1:DisplayObject) : DisplayObject
      {
         var item:DisplayObject = param1;
         var itemIndex:int = int(this.items.indexOf(item));
         if(itemIndex < 0)
         {
            return null;
         }
         try
         {
            removeChild(item);
         }
         catch(e:ArgumentError)
         {
            return null;
         }
         this.items.splice(itemIndex,1);
         this.Renamed4031(itemIndex,item);
         return item;
      }
      
      protected function Renamed4029(param1:DisplayObject) : int
      {
         return int(param1 is TankInputBase ? param1.width - 10 : param1.width);
      }
      
      protected function Renamed4031(param1:int, param2:DisplayObject) : void
      {
      }
      
      protected function Renamed4028(param1:DisplayObject) : void
      {
      }
      
      public function Renamed4030() : int
      {
         return this.margin;
      }
      
      public function Renamed1987(param1:int) : void
      {
         this.margin = param1;
      }
      
      public function Renamed4033() : int
      {
         return this.items.length;
      }
      
      public function getItems() : Vector.<DisplayObject>
      {
         return this.items;
      }
   }
}

