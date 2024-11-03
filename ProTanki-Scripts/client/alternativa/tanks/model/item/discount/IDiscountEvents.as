package alternativa.tanks.model.item.discount
{
   import controls.timer.CountDownTimer;
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.type.IGameObject;
   
   public class IDiscountEvents implements IDiscount
   {
      private var object:IGameObject;
      
      private var impl:Vector.<IDiscount>;
      
      public function IDiscountEvents(param1:IGameObject, param2:Vector.<IModel>)
      {
         super();
         this.object = param1;
         this.impl = new Vector.<IDiscount>();
         var _loc3_:int = 0;
         while(_loc3_ < param2.length)
         {
            this.impl.push(param2[_loc3_]);
            _loc3_++;
         }
      }
      
      public function getDiscountInPercent() : int
      {
         var result:int = 0;
         var i:int = 0;
         var m:IDiscount = null;
         try
         {
            Model.object = this.object;
            i = 0;
            while(i < this.impl.length)
            {
               m = this.impl[i];
               result = m.getDiscountInPercent();
               i++;
            }
         }
         finally
         {
            Model.popObject();
         }
         return result;
      }
      
      public function applyDiscount(param1:int) : int
      {
         var result:int = 0;
         var i:int = 0;
         var m:IDiscount = null;
         var price:int = param1;
         try
         {
            Model.object = this.object;
            i = 0;
            while(i < this.impl.length)
            {
               m = this.impl[i];
               result = m.applyDiscount(price);
               i++;
            }
         }
         finally
         {
            Model.popObject();
         }
         return result;
      }
      
      public function getEndDiscountTimer() : CountDownTimer
      {
         var result:CountDownTimer = null;
         var i:int = 0;
         var m:IDiscount = null;
         try
         {
            Model.object = this.object;
            i = 0;
            while(i < this.impl.length)
            {
               m = this.impl[i];
               result = m.getEndDiscountTimer();
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

