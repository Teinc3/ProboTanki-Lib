package alternativa.tanks.battle
{
   import alternativa.osgi.service.clientlog.IClientLog;
   import alternativa.tanks.battle.events.BattleEventDispatcher;
   import alternativa.tanks.battle.events.Renamed702;
   import alternativa.tanks.utils.EncryptedInt;
   import alternativa.tanks.utils.EncryptedIntImpl;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   import flash.utils.getTimer;
   
   public class Renamed703
   {
      [Inject]
      public static var clientLog:IClientLog;
      
      private var battleEventDispatcher:BattleEventDispatcher;
      
      private var timer:Timer;
      
      private var Renamed704:int;
      
      private var Renamed705:Number;
      
      private var Renamed706:Array;
      
      public function Renamed703(param1:BattleEventDispatcher)
      {
         this.Renamed707 = new EncryptedIntImpl(15000);
         this.threshold = new EncryptedIntImpl(300);
         this.Renamed708 = new EncryptedIntImpl(3);
         this.Renamed709 = new EncryptedIntImpl(0);
         this.Renamed706 = [];
         super();
         this.battleEventDispatcher = param1;
         this.Renamed704 = getTimer();
         this.Renamed705 = new Date().time;
         this.timer = new Timer(this.Renamed707.getInt());
         this.timer.addEventListener(TimerEvent.TIMER,this.onTimer);
         this.timer.start();
      }
      
      public function stop() : void
      {
         this.timer.stop();
      }
      
      private function onTimer(param1:TimerEvent) : void
      {
         var _loc2_:int = getTimer();
         var _loc3_:Number = new Date().time;
         var _loc4_:Number = _loc2_ - this.Renamed704 - _loc3_ + this.Renamed705;
         if(Math.abs(_loc4_) > this.threshold.getInt())
         {
            this.Renamed706.push(_loc4_);
            this.Renamed709.setInt(this.Renamed709.getInt() + 1);
            if(this.Renamed709.getInt() >= this.Renamed708.getInt())
            {
               this.stop();
               this.battleEventDispatcher.dispatchEvent(new Renamed702(this.Renamed706));
            }
         }
         else
         {
            this.Renamed709.setInt(0);
            this.Renamed706.length = 0;
         }
         this.Renamed704 = _loc2_;
         this.Renamed705 = _loc3_;
      }
   }
}

