package §7"j§
{
   import alternativa.math.Vector3;
   import alternativa.tanks.battle.BattleService;
   import alternativa.tanks.camera.§3!0§;
   import §extends for const§.§1Q§;
   import §extends for const§.§["D§;
   import flash.events.Event;
   import flash.media.SoundChannel;
   
   public class §do set case§ extends §["D§ implements §final var super§
   {
      [Inject]
      public static var battleService:BattleService;
      
      private var position:Vector3;
      
      private var sound:§implements for break§;
      
      private var §default set extends§:int;
      
      private var startTime:int;
      
      private var channel:SoundChannel;
      
      private var _enabled:Boolean = false;
      
      private var §2%§:Boolean = false;
      
      private var listener:§ q§;
      
      public function §do set case§(param1:§1Q§)
      {
         this.position = new Vector3();
         super(param1);
      }
      
      public static function create(param1:Vector3, param2:§implements for break§, param3:int = 0, param4:int = 0, param5:§ q§ = null) : §do set case§
      {
         var _loc6_:§do set case§ = §do set case§(battleService.§class while§().getObject(§do set case§));
         _loc6_.init(param1,param2,param3,param4,param5);
         return _loc6_;
      }
      
      public function init(param1:Vector3, param2:§implements for break§, param3:int = 0, param4:int = 0, param5:§ q§ = null) : void
      {
         this.position.copy(param1);
         this.sound = param2;
         this.§default set extends§ = param3;
         this.startTime = param4;
         this.listener = param5;
         this._enabled = false;
         this.§2%§ = false;
      }
      
      public function play(param1:int, param2:§3!0§) : void
      {
         this.§default set extends§ -= param1;
         if(this.§default set extends§ > 0)
         {
            return;
         }
         if(!this.§2%§)
         {
            this.§2%§ = true;
            this.channel = this.sound.play(this.startTime,1);
            if(this.channel == null)
            {
               return;
            }
            this.channel.addEventListener(Event.SOUND_COMPLETE,this.§import var§);
         }
         this.sound.§class catch switch§(param2.position,this.position,param2.§null for in§);
      }
      
      public function destroy() : void
      {
         §implements for break§.destroy(this.sound);
         this.sound = null;
         this.§import var§(null);
         if(this.listener != null)
         {
            this.listener.§dynamic var each§(this);
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
            this.§import var§(null);
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
      
      private function §import var§(param1:Event) : void
      {
         if(this.channel != null)
         {
            this.channel.removeEventListener(Event.SOUND_COMPLETE,this.§import var§);
         }
         this._enabled = false;
         this.channel = null;
      }
   }
}

