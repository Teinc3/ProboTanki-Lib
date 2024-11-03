package alternativa.tanks.model.item.buyable
{
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.type.IGameObject;
   
   public class IBuyableEvents implements IBuyable
   {
      private var object:IGameObject;
      
      private var impl:Vector.<IBuyable>;
      
      public function IBuyableEvents(param1:IGameObject, param2:Vector.<IModel>)
      {
         super();
         this.object = param1;
         this.impl = new Vector.<IBuyable>();
         var _loc3_:int = 0;
         while(_loc3_ < param2.length)
         {
            this.impl.push(param2[_loc3_]);
            _loc3_++;
         }
      }
      
      public function getPriceWithoutDiscount() : int
      {
         var result:int = 0;
         var i:int = 0;
         var m:IBuyable = null;
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
      
      public function getPrice() : int
      {
         var result:int = 0;
         var i:int = 0;
         var m:IBuyable = null;
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
      
      public function isBuyable() : Boolean
      {
         var result:Boolean = false;
         var i:int = 0;
         var m:IBuyable = null;
         try
         {
            Model.object = this.object;
            i = 0;
            while(i < this.impl.length)
            {
               m = this.impl[i];
               result = m.isBuyable();
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

