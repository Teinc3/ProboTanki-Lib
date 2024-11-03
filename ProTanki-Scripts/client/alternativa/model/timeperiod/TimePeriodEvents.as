package alternativa.model.timeperiod
{
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.type.IGameObject;
   
   public class TimePeriodEvents implements TimePeriod
   {
      private var object:IGameObject;
      
      private var impl:Vector.<TimePeriod>;
      
      public function TimePeriodEvents(param1:IGameObject, param2:Vector.<IModel>)
      {
         super();
         this.object = param1;
         this.impl = new Vector.<TimePeriod>();
         var _loc3_:int = 0;
         while(_loc3_ < param2.length)
         {
            this.impl.push(param2[_loc3_]);
            _loc3_++;
         }
      }
      
      public function isEnabled() : Boolean
      {
         var result:Boolean = false;
         var i:int = 0;
         var m:TimePeriod = null;
         try
         {
            Model.object = this.object;
            i = 0;
            while(i < this.impl.length)
            {
               m = this.impl[i];
               result = m.isEnabled();
               i++;
            }
         }
         finally
         {
            Model.popObject();
         }
         return result;
      }
      
      public function isTimeless() : Boolean
      {
         var result:Boolean = false;
         var i:int = 0;
         var m:TimePeriod = null;
         try
         {
            Model.object = this.object;
            i = 0;
            while(i < this.impl.length)
            {
               m = this.impl[i];
               result = m.isTimeless();
               i++;
            }
         }
         finally
         {
            Model.popObject();
         }
         return result;
      }
      
      public function getModelLoadingTimeInMillis() : int
      {
         var result:int = 0;
         var i:int = 0;
         var m:TimePeriod = null;
         try
         {
            Model.object = this.object;
            i = 0;
            while(i < this.impl.length)
            {
               m = this.impl[i];
               result = m.getModelLoadingTimeInMillis();
               i++;
            }
         }
         finally
         {
            Model.popObject();
         }
         return result;
      }
      
      public function getTimeLeftInSeconds() : int
      {
         var result:int = 0;
         var i:int = 0;
         var m:TimePeriod = null;
         try
         {
            Model.object = this.object;
            i = 0;
            while(i < this.impl.length)
            {
               m = this.impl[i];
               result = m.getTimeLeftInSeconds();
               i++;
            }
         }
         finally
         {
            Model.popObject();
         }
         return result;
      }
      
      public function getTimeToStartInSeconds() : int
      {
         var result:int = 0;
         var i:int = 0;
         var m:TimePeriod = null;
         try
         {
            Model.object = this.object;
            i = 0;
            while(i < this.impl.length)
            {
               m = this.impl[i];
               result = m.getTimeToStartInSeconds();
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

