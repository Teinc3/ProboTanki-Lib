package alternativa.tanks.service.temporaryitem
{
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   import flash.utils.getTimer;
   import platform.client.fp10.core.type.IGameObject;
   
   public class Renamed3790 extends EventDispatcher
   {
      private var _item:IGameObject;
      
      private var _timer:Timer;
      
      private var Renamed3794:Number;
      
      private var _remainingTimeInSec:int;
      
      public function Renamed3790(param1:IGameObject, param2:int)
      {
         super();
         this._item = param1;
         this._remainingTimeInSec = param2;
         this.Renamed3794 = getTimer();
         this._timer = new Timer(1000);
         this._timer.addEventListener(TimerEvent.TIMER,this.onTimer);
         this._timer.start();
      }
      
      private function onTimer(param1:TimerEvent) : void
      {
         var _loc2_:int = (getTimer() - this.Renamed3794) / 1000;
         if(_loc2_ > this._remainingTimeInSec)
         {
            dispatchEvent(new Event(Event.COMPLETE));
            this._timer.stop();
            this.destroy();
         }
      }
      
      public function destroy() : void
      {
         if(this._timer != null)
         {
            this._timer.removeEventListener(TimerEvent.TIMER,this.onTimer);
            this._timer.stop();
            this._timer = null;
         }
      }
      
      public function get item() : IGameObject
      {
         return this._item;
      }
      
      public function get Renamed3791() : Number
      {
         return this._remainingTimeInSec * 1000 - (getTimer() - this.Renamed3794);
      }
   }
}

