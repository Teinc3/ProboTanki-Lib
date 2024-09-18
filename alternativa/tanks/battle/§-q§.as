package alternativa.tanks.battle
{
   import alternativa.osgi.service.clientlog.IClientLog;
   import alternativa.tanks.battle.events.BattleEventDispatcher;
   import alternativa.tanks.battle.events.§`E§;
   import alternativa.tanks.utils.EncryptedInt;
   import alternativa.tanks.utils.EncryptedIntImpl;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   import flash.utils.getTimer;
   
   public class §-q§
   {
      [Inject]
      public static var clientLog:IClientLog;
      
      private var battleEventDispatcher:BattleEventDispatcher;
      
      private var timer:Timer;
      
      private var §"!7§:int;
      
      private var §in var use§:Number;
      
      private var §[#S§:Array;
      
      public function §-q§(param1:BattleEventDispatcher)
      {
         this.§!"G§ = new EncryptedIntImpl(15000);
         this.threshold = new EncryptedIntImpl(300);
         this.§@#k§ = new EncryptedIntImpl(3);
         this.§switch package each§ = new EncryptedIntImpl(0);
         this.§[#S§ = [];
         super();
         this.battleEventDispatcher = param1;
         this.§"!7§ = getTimer();
         this.§in var use§ = new Date().time;
         this.timer = new Timer(this.§!"G§.getInt());
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
         var _loc4_:Number = _loc2_ - this.§"!7§ - _loc3_ + this.§in var use§;
         if(Math.abs(_loc4_) > this.threshold.getInt())
         {
            this.§[#S§.push(_loc4_);
            this.§switch package each§.setInt(this.§switch package each§.getInt() + 1);
            if(this.§switch package each§.getInt() >= this.§@#k§.getInt())
            {
               this.stop();
               this.battleEventDispatcher.dispatchEvent(new §`E§(this.§[#S§));
            }
         }
         else
         {
            this.§switch package each§.setInt(0);
            this.§[#S§.length = 0;
         }
         this.§"!7§ = _loc2_;
         this.§in var use§ = _loc3_;
      }
   }
}

