package alternativa.tanks.model.item.kit
{
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.resource.types.ImageResource;
   import platform.client.fp10.core.type.IGameObject;
   import projects.tanks.client.garage.models.item.kit.KitItem;
   
   public class §]!^§ implements GarageKit
   {
      private var object:IGameObject;
      
      private var impl:Vector.<GarageKit>;
      
      public function §]!^§(param1:IGameObject, param2:Vector.<IModel>)
      {
         super();
         this.object = param1;
         this.impl = new Vector.<GarageKit>();
         var _loc3_:int = 0;
         while(_loc3_ < param2.length)
         {
            this.impl.push(param2[_loc3_]);
            _loc3_++;
         }
      }
      
      public function getImage() : ImageResource
      {
         var result:ImageResource = null;
         var i:int = 0;
         var m:GarageKit = null;
         try
         {
            Model.object = this.object;
            i = 0;
            while(i < this.impl.length)
            {
               m = this.impl[i];
               result = m.getImage();
               i++;
            }
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
         var i:int = 0;
         var m:GarageKit = null;
         try
         {
            Model.object = this.object;
            i = 0;
            while(i < this.impl.length)
            {
               m = this.impl[i];
               result = m.getPrice();
               i++;
            }
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
         var i:int = 0;
         var m:GarageKit = null;
         try
         {
            Model.object = this.object;
            i = 0;
            while(i < this.impl.length)
            {
               m = this.impl[i];
               result = m.getPriceWithoutDiscount();
               i++;
            }
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
         var §final package§:int = 0;
         var §finally const catch§:GarageKit = null;
         try
         {
            Model.object = this.object;
            §final package§ = 0;
            while(§final package§ < this.impl.length)
            {
               §finally const catch§ = this.impl[§final package§];
               §0!J§ = §finally const catch§.§set super§();
               §final package§++;
            }
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
         var §final package§:int = 0;
         var §finally const catch§:GarageKit = null;
         try
         {
            Model.object = this.object;
            §final package§ = 0;
            while(§final package§ < this.impl.length)
            {
               §finally const catch§ = this.impl[§final package§];
               §0!J§ = §finally const catch§.§static if§();
               §final package§++;
            }
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
         var i:int = 0;
         var m:GarageKit = null;
         try
         {
            Model.object = this.object;
            i = 0;
            while(i < this.impl.length)
            {
               m = this.impl[i];
               result = m.getItems();
               i++;
            }
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
         var i:int = 0;
         var m:GarageKit = null;
         try
         {
            Model.object = this.object;
            i = 0;
            while(i < this.impl.length)
            {
               m = this.impl[i];
               result = m.canBuy();
               i++;
            }
         }
         finally
         {
            Model.popObject();
         }
         return result;
      }
   }
}

