package controls.containers
{
   import base.DiscreteSprite;
   import controls.base.TankInputBase;
   import flash.display.DisplayObject;
   
   public class §if package get§ extends DiscreteSprite
   {
      private var margin:int;
      
      public var items:Vector.<DisplayObject>;
      
      public function §if package get§()
      {
         this.items = new Vector.<DisplayObject>();
         super();
      }
      
      public function addItem(param1:DisplayObject) : void
      {
         addChild(param1);
         this.items.push(param1);
         this.§final for try§(param1);
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
         this.§<u§(itemIndex,item);
         return item;
      }
      
      protected function §set const case§(param1:DisplayObject) : int
      {
         return int(param1 is TankInputBase ? param1.width - 10 : param1.width);
      }
      
      protected function §<u§(param1:int, param2:DisplayObject) : void
      {
      }
      
      protected function §final for try§(param1:DisplayObject) : void
      {
      }
      
      public function §use var default§() : int
      {
         return this.margin;
      }
      
      public function §!!t§(param1:int) : void
      {
         this.margin = param1;
      }
      
      public function §var for false§() : int
      {
         return this.items.length;
      }
      
      public function getItems() : Vector.<DisplayObject>
      {
         return this.items;
      }
   }
}

