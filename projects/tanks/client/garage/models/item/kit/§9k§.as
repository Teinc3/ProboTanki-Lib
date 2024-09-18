package projects.tanks.client.garage.models.item.kit
{
   import platform.client.fp10.core.resource.types.ImageResource;
   
   public class §9k§
   {
      private var §6"K§:int;
      
      private var _image:ImageResource;
      
      private var §2"E§:Vector.<KitItem>;
      
      public function §9k§(param1:int = 0, param2:ImageResource = null, param3:Vector.<KitItem> = null)
      {
         super();
         this.§6"K§ = param1;
         this._image = param2;
         this.§2"E§ = param3;
      }
      
      public function get discountInPercent() : int
      {
         return this.§6"K§;
      }
      
      public function set discountInPercent(param1:int) : void
      {
         this.§6"K§ = param1;
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
         return this.§2"E§;
      }
      
      public function set kitItems(param1:Vector.<KitItem>) : void
      {
         this.§2"E§ = param1;
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

