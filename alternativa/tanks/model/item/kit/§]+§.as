package alternativa.tanks.model.item.kit
{
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.resource.types.ImageResource;
   import platform.client.fp10.core.type.IGameObject;
   import projects.tanks.client.garage.models.item.kit.KitItem;
   
   public class §]+§ implements GarageKit
   {
      private var object:IGameObject;
      
      private var impl:GarageKit;
      
      public function §]+§(param1:IGameObject, param2:GarageKit)
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
      
      public function §set super§() : int
      {
         var §0!J§:int = 0;
         try
         {
            Model.object = this.object;
            §0!J§ = this.impl.§set super§();
         }
         finally
         {
            Model.popObject();
         }
         return §0!J§;
      }
      
      public function §static if§() : int
      {
         var §0!J§:int = 0;
         try
         {
            Model.object = this.object;
            §0!J§ = this.impl.§static if§();
         }
         finally
         {
            Model.popObject();
         }
         return §0!J§;
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

