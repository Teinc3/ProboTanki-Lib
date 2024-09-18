package projects.tanks.client.garage.models.item.kit
{
   import platform.client.fp10.core.resource.types.ImageResource;
   
   public class Renamed4317
   {
      private var Renamed4319:int;
      
      private var _image:ImageResource;
      
      private var ProtectionContexts0:Vector.<KitItem>;
      
      public function Renamed4317(param1:int = 0, param2:ImageResource = null, param3:Vector.<KitItem> = null)
      {
         super();
         this.Renamed4319 = param1;
         this._image = param2;
         this.ProtectionContexts0 = param3;
      }
      
      public function get discountInPercent() : int
      {
         return this.Renamed4319;
      }
      
      public function set discountInPercent(param1:int) : void
      {
         this.Renamed4319 = param1;
      }
      
      public function get image() : ImageResource
      {
         return this._image;
      }
      
      public function set image(param1:ImageResource) : void
      {
         this._image = param1;
      }
      
      public function get kitItems() : Vector.<KitItem>
      {
         return this.ProtectionContexts0;
      }
      
      public function set kitItems(param1:Vector.<KitItem>) : void
      {
         this.ProtectionContexts0 = param1;
      }
      
      public function toString() : String
      {
         var _loc1_:String = "GarageKitCC [";
         _loc1_ += "discountInPercent = " + this.discountInPercent + " ";
         _loc1_ += "image = " + this.image + " ";
         _loc1_ += "kitItems = " + this.kitItems + " ";
         return _loc1_ + "]";
      }
   }
}

