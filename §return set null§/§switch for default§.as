package §return set null§
{
   import §catch for null§.§!#Q§;
   import §catch for null§.§6#`§;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   import flash.utils.getTimer;
   
   public class §switch for default§ extends §6#`§
   {
      private var timer:Timer;
      
      private var §break const catch§:uint;
      
      private var §99§:Boolean;
      
      public function §switch for default§(param1:int, param2:int, param3:§!#Q§, param4:Boolean)
      {
         super(param1,param2,param3);
         this.§99§ = param4;
         this.timer = new Timer(1000);
         this.timer.addEventListener(TimerEvent.TIMER,this.onTimer);
      }
      
      private static function §extends package else§(param1:int) : String
      {
         var _loc2_:int = param1 / 60;
         return _loc2_ > 9 ? _loc2_.toString() : "0" + _loc2_.toString();
      }
      
      private static function §use for else§(param1:int) : String
      {
         var _loc2_:int = param1 % 60;
         return _loc2_ > 9 ? _loc2_.toString() : "0" + _loc2_.toString();
      }
      
      public function §'!z§(param1:int) : void
      {
         this.§break const catch§ = Math.round(getTimer() / 1000 + param1);
         value = param1;
         if(_value > 0)
         {
            this.timer.stop();
            this.timer.start();
         }
         else
         {
            §default var extends§();
         }
      }
      
      public function §3!-§() : void
      {
         this.timer.stop();
      }
      
      override protected function updateLabel() : void
      {
         if(this.§99§)
         {
            label.text = _value < 10 ? "0" + _value.toString() : _value.toString();
         }
         else
         {
            label.text = §extends package else§(_value) + " : " + §use for else§(_value);
         }
      }
      
      override protected function onRemovedFromStage(param1:Event) : void
      {
         super.onRemovedFromStage(param1);
         this.timer.stop();
      }
      
      private function onTimer(param1:TimerEvent) : void
      {
         var _loc2_:int = 0;
         if(_value > 0)
         {
            _loc2_ = Math.round(this.§break const catch§ - getTimer() / 1000);
            value = _loc2_ < 0 ? int(0) : int(_loc2_);
         }
         else
         {
            this.timer.stop();
         }
      }
   }
}

