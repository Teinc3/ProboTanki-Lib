package projects.tanks.clients.fp10.libraries.tanksservices.service
{
   import flash.utils.Dictionary;
   import flash.utils.clearInterval;
   import flash.utils.setInterval;
   
   public class TimeOutTruncateConsumers
   {
      private const TRUNCATE_PERIOD:int = 300000;
      
      private var _intervalId:uint;
      
      private var _consumersLastAccessTime:Dictionary;
      
      private var _consumers:Dictionary;
      
      private var _truncateFunction:Function;
      
      public function TimeOutTruncateConsumers()
      {
         this._consumersLastAccessTime = new Dictionary();
         super();
         this._intervalId = setInterval(this.truncateOutdatedConsumers,this.TRUNCATE_PERIOD);
      }
      
      public function get truncateFunction() : Function
      {
         return this._truncateFunction;
      }
      
      public function set truncateFunction(param1:Function) : void
      {
         this._truncateFunction = param1;
      }
      
      private function truncateOutdatedConsumers() : void
      {
         var _loc1_:* = undefined;
         var _loc2_:IInfoLabelUpdater = null;
         if(this.truncateFunction == null)
         {
            return;
         }
         var _loc3_:Vector.<String> = new Vector.<String>();
         var _loc4_:Number = new Date().time - this.TRUNCATE_PERIOD;
         for(_loc1_ in this._consumers)
         {
            _loc2_ = this._consumers[_loc1_];
            if(_loc2_.lastAccessTime < _loc4_ && _loc2_.visibleLabelsCounter == 0)
            {
               _loc3_.push(_loc1_);
            }
         }
         if(_loc3_.length > 0)
         {
            this.truncateFunction(_loc3_);
         }
      }
      
      public function updateLastAccessTime(param1:String) : void
      {
         this._consumersLastAccessTime[param1] = new Date().time;
      }
      
      public function set consumers(param1:Dictionary) : void
      {
         this._consumers = param1;
      }
      
      public function stop() : void
      {
         clearInterval(this._intervalId);
      }
   }
}

