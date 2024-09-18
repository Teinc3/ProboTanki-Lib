package alternativa.tanks.model.item.temporary
{
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.type.IGameObject;
   
   public class ITemporaryItemEvents implements ITemporaryItem
   {
      private var object:IGameObject;
      
      private var impl:Vector.<ITemporaryItem>;
      
      public function ITemporaryItemEvents(param1:IGameObject, param2:Vector.<IModel>)
      {
         super();
         this.object = param1;
         this.impl = new Vector.<ITemporaryItem>();
         var _loc3_:int = 0;
         while(_loc3_ < param2.length)
         {
            this.impl.push(param2[_loc3_]);
            _loc3_++;
         }
      }
      
      public function getStopDate() : Date
      {
         var result:Date = null;
         var i:int = 0;
         var m:ITemporaryItem = null;
         try
         {
            Model.object = this.object;
            i = 0;
            while(i < this.impl.length)
            {
               m = this.impl[i];
               result = m.getStopDate();
               i++;
            }
         }
         finally
         {
            Model.popObject();
         }
         return result;
      }
      
      public function startTiming(param1:int) : void
      {
         var i:int = 0;
         var m:ITemporaryItem = null;
         var remainingTime:int = param1;
         try
         {
            Model.object = this.object;
            i = 0;
            while(i < this.impl.length)
            {
               m = this.impl[i];
               m.startTiming(remainingTime);
               i++;
            }
         }
         finally
         {
            Model.popObject();
         }
      }
      
      public function getTimeRemainingInMSec() : Number
      {
         var result:Number = NaN;
         var i:int = 0;
         var m:ITemporaryItem = null;
         try
         {
            Model.object = this.object;
            i = 0;
            while(i < this.impl.length)
            {
               m = this.impl[i];
               result = m.getTimeRemainingInMSec();
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

