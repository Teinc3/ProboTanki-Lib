package alternativa.tanks.model.item.discount
{
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.type.IGameObject;
   
   public class ICollectDiscountEvents implements ICollectDiscount
   {
      private var object:IGameObject;
      
      private var impl:Vector.<ICollectDiscount>;
      
      public function ICollectDiscountEvents(param1:IGameObject, param2:Vector.<IModel>)
      {
         super();
         this.object = param1;
         this.impl = new Vector.<ICollectDiscount>();
         var _loc3_:int = 0;
         while(_loc3_ < param2.length)
         {
            this.impl.push(param2[_loc3_]);
            _loc3_++;
         }
      }
      
      public function collectDiscountsInfo(param1:IDiscountCollector) : void
      {
         var i:int = 0;
         var m:ICollectDiscount = null;
         var collector:IDiscountCollector = param1;
         try
         {
            Model.object = this.object;
            i = 0;
            while(i < this.impl.length)
            {
               m = this.impl[i];
               m.collectDiscountsInfo(collector);
               i++;
            }
            return;
         }
         finally
         {
            Model.popObject();
         }
      }
   }
}

