package alternativa.tanks.model.item.temporary
{
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.type.IGameObject;
   
   public class ITemporaryItemAdapt implements ITemporaryItem
   {
      private var object:IGameObject;
      
      private var impl:ITemporaryItem;
      
      public function ITemporaryItemAdapt(param1:IGameObject, param2:ITemporaryItem)
      {
         super();
         this.object = param1;
         this.impl = param2;
      }
      
      public function getStopDate() : Date
      {
         var result:Date = null;
         try
         {
            Model.object = this.object;
            result = this.impl.getStopDate();
         }
         finally
         {
            Model.popObject();
         }
         return result;
      }
      
      public function startTiming(param1:int) : void
      {
         var remainingTime:int = param1;
         try
         {
            Model.object = this.object;
            this.impl.startTiming(remainingTime);
         }
         finally
         {
            Model.popObject();
         }
      }
      
      public function getTimeRemainingInMSec() : Number
      {
         var result:Number = NaN;
         try
         {
            Model.object = this.object;
            result = this.impl.getTimeRemainingInMSec();
         }
         finally
         {
            Model.popObject();
         }
         return result;
      }
   }
}

