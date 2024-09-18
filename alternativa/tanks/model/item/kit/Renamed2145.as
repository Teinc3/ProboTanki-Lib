package alternativa.tanks.model.item.kit
{
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.resource.types.ImageResource;
   import platform.client.fp10.core.type.IGameObject;
   import projects.tanks.client.garage.models.item.kit.KitItem;
   
   public class Renamed2145 implements GarageKit
   {
      private var object:IGameObject;
      
      private var impl:GarageKit;
      
      public function Renamed2145(param1:IGameObject, param2:GarageKit)
      {
         super();
         this.object = param1;
         this.impl = param2;
      }
      
      public function getImage() : ImageResource
      {
         var result:ImageResource = null;
         try
         {
            Model.object = this.object;
            result = this.impl.getImage();
         }
         finally
         {
            Model.popObject();
         }
         return result;
      }
      
      public function getPrice() : int
      {
         var result:int = 0;
         try
         {
            Model.object = this.object;
            result = this.impl.getPrice();
         }
         finally
         {
            Model.popObject();
         }
         return result;
      }
      
      public function getPriceWithoutDiscount() : int
      {
         var result:int = 0;
         try
         {
            Model.object = this.object;
            result = this.impl.getPriceWithoutDiscount();
         }
         finally
         {
            Model.popObject();
         }
         return result;
      }
      
      public function Renamed2136() : int
      {
         var Renamed2142:int = 0;
         try
         {
            Model.object = this.object;
            Renamed2142 = this.impl.Renamed2136();
         }
         finally
         {
            Model.popObject();
         }
         return Renamed2142;
      }
      
      public function Renamed2137() : int
      {
         var Renamed2142:int = 0;
         try
         {
            Model.object = this.object;
            Renamed2142 = this.impl.Renamed2137();
         }
         finally
         {
            Model.popObject();
         }
         return Renamed2142;
      }
      
      public function getItems() : Vector.<KitItem>
      {
         var result:Vector.<KitItem> = null;
         try
         {
            Model.object = this.object;
            result = this.impl.getItems();
         }
         finally
         {
            Model.popObject();
         }
         return result;
      }
      
      public function canBuy() : Boolean
      {
         var result:Boolean = false;
         try
         {
            Model.object = this.object;
            result = this.impl.canBuy();
         }
         finally
         {
            Model.popObject();
         }
         return result;
      }
   }
}

