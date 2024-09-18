package Renamed322
{
   import flash.events.TimerEvent;
   import flash.utils.Dictionary;
   import flash.utils.Timer;
   
   public class Renamed6582
   {
      private static var _instance:Renamed6582;
      
      private var timer:Timer;
      
      private var Renamed7726:Dictionary;
      
      private var Renamed7727:int;
      
      private var visible:Boolean;
      
      public function Renamed6582(param1:int)
      {
         super();
         this.Renamed7726 = new Dictionary();
         this.timer = new Timer(param1);
         this.timer.addEventListener(TimerEvent.TIMER,this.onTimer);
      }
      
      public static function init(param1:int) : void
      {
         if(_instance == null)
         {
            _instance = new Renamed6582(param1);
         }
      }
      
      public static function get instance() : Renamed6582
      {
         return _instance;
      }
      
      public function Renamed7728(param1:Renamed6583) : void
      {
         if(this.Renamed7726[param1] != null)
         {
            return;
         }
         this.Renamed7726[param1] = param1;
         ++this.Renamed7727;
         if(this.Renamed7727 == 1)
         {
            this.timer.start();
         }
      }
      
      public function Renamed7729(param1:Renamed6583) : void
      {
         if(this.Renamed7726[param1] == null)
         {
            return;
         }
         delete this.Renamed7726[param1];
         --this.Renamed7727;
         if(this.Renamed7727 == 0)
         {
            this.timer.stop();
            this.visible = true;
         }
      }
      
      private function onTimer(param1:TimerEvent) : void
      {
         var _loc2_:Renamed6583 = null;
         if(this.Renamed7727 == 0)
         {
            return;
         }
         this.visible = !this.visible;
         for each(_loc2_ in this.Renamed7726)
         {
            _loc2_.Renamed7730 = this.visible;
         }
      }
   }
}

