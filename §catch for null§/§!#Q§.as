package §catch for null§
{
   import flash.events.TimerEvent;
   import flash.utils.Dictionary;
   import flash.utils.Timer;
   
   public class §!#Q§
   {
      private static var _instance:§!#Q§;
      
      private var timer:Timer;
      
      private var §,#!§:Dictionary;
      
      private var §null for super§:int;
      
      private var visible:Boolean;
      
      public function §!#Q§(param1:int)
      {
         super();
         this.§,#!§ = new Dictionary();
         this.timer = new Timer(param1);
         this.timer.addEventListener(TimerEvent.TIMER,this.onTimer);
      }
      
      public static function init(param1:int) : void
      {
         if(_instance == null)
         {
            _instance = new §!#Q§(param1);
         }
      }
      
      public static function get instance() : §!#Q§
      {
         return _instance;
      }
      
      public function §8=§(param1:§6#`§) : void
      {
         if(this.§,#!§[param1] != null)
         {
            return;
         }
         this.§,#!§[param1] = param1;
         ++this.§null for super§;
         if(this.§null for super§ == 1)
         {
            this.timer.start();
         }
      }
      
      public function §continue catch switch§(param1:§6#`§) : void
      {
         if(this.§,#!§[param1] == null)
         {
            return;
         }
         delete this.§,#!§[param1];
         --this.§null for super§;
         if(this.§null for super§ == 0)
         {
            this.timer.stop();
            this.visible = true;
         }
      }
      
      private function onTimer(param1:TimerEvent) : void
      {
         var _loc2_:§6#`§ = null;
         if(this.§null for super§ == 0)
         {
            return;
         }
         this.visible = !this.visible;
         for each(_loc2_ in this.§,#!§)
         {
            _loc2_.§implements false§ = this.visible;
         }
      }
   }
}

