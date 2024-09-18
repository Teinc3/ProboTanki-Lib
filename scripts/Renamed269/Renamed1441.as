package Renamed1
{
   import alternativa.math.Vector3;
   import alternativa.tanks.battle.BattleService;
   import alternativa.tanks.camera.Renamed842;
   import Renamed356.Renamed1443;
   import Renamed356.Renamed1444;
   import flash.events.Event;
   import flash.media.SoundChannel;
   
   public class Renamed1441 extends Renamed1444 implements Renamed608
   {
      [Inject]
      public static var battleService:BattleService;
      
      private var position:Vector3;
      
      private var sound:Renamed1442;
      
      private var Renamed6997:int;
      
      private var startTime:int;
      
      private var channel:SoundChannel;
      
      private var _enabled:Boolean = false;
      
      private var Renamed7017:Boolean = false;
      
      private var listener:Renamed6441;
      
      public function Renamed1441(param1:Renamed1443)
      {
         this.position = new Vector3();
         super(param1);
      }
      
      public static function create(param1:Vector3, param2:Renamed1442, param3:int = 0, param4:int = 0, param5:Renamed6441 = null) : Renamed1441
      {
         var _loc6_:Renamed1441 = Renamed1441(battleService.Renamed618().getObject(Renamed1441));
         _loc6_.init(param1,param2,param3,param4,param5);
         return _loc6_;
      }
      
      public function init(param1:Vector3, param2:Renamed1442, param3:int = 0, param4:int = 0, param5:Renamed6441 = null) : void
      {
         this.position.copy(param1);
         this.sound = param2;
         this.Renamed6997 = param3;
         this.startTime = param4;
         this.listener = param5;
         this._enabled = false;
         this.Renamed7017 = false;
      }
      
      public function play(param1:int, param2:Renamed842) : void
      {
         this.Renamed6997 -= param1;
         if(this.Renamed6997 > 0)
         {
            return;
         }
         if(!this.Renamed7017)
         {
            this.Renamed7017 = true;
            this.channel = this.sound.play(this.startTime,1);
            if(this.channel == null)
            {
               return;
            }
            this.channel.addEventListener(Event.SOUND_COMPLETE,this.Renamed6540);
         }
         this.sound.Renamed6974(param2.position,this.position,param2.Renamed594);
      }
      
      public function destroy() : void
      {
         Renamed1442.destroy(this.sound);
         this.sound = null;
         this.Renamed6540(null);
         if(this.listener != null)
         {
            this.listener.Renamed6447(this);
            this.listener = null;
         }
         recycle();
      }
      
      public function kill() : void
      {
         this._enabled = false;
      }
      
      public function set enabled(param1:Boolean) : void
      {
         if(this._enabled == param1)
         {
            return;
         }
         if(!(this._enabled = param1))
         {
            this.Renamed6540(null);
         }
      }
      
      public function readPosition(param1:Vector3) : void
      {
         param1.x = this.position.x;
         param1.y = this.position.y;
         param1.z = this.position.z;
      }
      
      public function get numSounds() : int
      {
         return this._enabled ? int(1) : int(0);
      }
      
      private function Renamed6540(param1:Event) : void
      {
         if(this.channel != null)
         {
            this.channel.removeEventListener(Event.SOUND_COMPLETE,this.Renamed6540);
         }
         this._enabled = false;
         this.channel = null;
      }
   }
}

