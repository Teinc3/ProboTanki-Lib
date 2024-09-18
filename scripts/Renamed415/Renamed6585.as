package Renamed415
{
   import Renamed322.Renamed6582;
   import Renamed322.Renamed6583;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   import flash.utils.getTimer;
   
   public class Renamed6585 extends Renamed6583
   {
      private var timer:Timer;
      
      private var Renamed8655:uint;
      
      private var Renamed8656:Boolean;
      
      public function Renamed6585(param1:int, param2:int, param3:Renamed6582, param4:Boolean)
      {
         super(param1,param2,param3);
         this.Renamed8656 = param4;
         this.timer = new Timer(1000);
         this.timer.addEventListener(TimerEvent.TIMER,this.onTimer);
      }
      
      private static function Renamed8657(param1:int) : String
      {
         var _loc2_:int = param1 / 60;
         return _loc2_ > 9 ? _loc2_.toString() : "0" + _loc2_.toString();
      }
      
      private static function Renamed8658(param1:int) : String
      {
         var _loc2_:int = param1 % 60;
         return _loc2_ > 9 ? _loc2_.toString() : "0" + _loc2_.toString();
      }
      
      public function Renamed6608(param1:int) : void
      {
         this.Renamed8655 = Math.round(getTimer() / 1000 + param1);
         value = param1;
         if(_value > 0)
         {
            this.timer.stop();
            this.timer.start();
         }
         else
         {
            Renamed6605();
         }
      }
      
      public function Renamed6611() : void
      {
         this.timer.stop();
      }
      
      override protected function updateLabel() : void
      {
         if(this.Renamed8656)
         {
            label.text = _value < 10 ? "0" + _value.toString() : _value.toString();
         }
         else
         {
            label.text = Renamed8657(_value) + " : " + Renamed8658(_value);
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
            _loc2_ = Math.round(this.Renamed8655 - getTimer() / 1000);
            value = _loc2_ < 0 ? int(0) : int(_loc2_);
         }
         else
         {
            this.timer.stop();
         }
      }
   }
}

