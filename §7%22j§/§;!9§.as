package §7"j§
{
   import alternativa.engine3d.core.Object3D;
   import alternativa.math.Vector3;
   import alternativa.tanks.camera.§3!0§;
   import §extends for const§.§1Q§;
   import §extends for const§.§["D§;
   import flash.events.Event;
   import flash.media.SoundChannel;
   
   public class §;!9§ extends §["D§ implements §final var super§
   {
      private static const §native in§:Vector3 = new Vector3();
      
      private var sound:§implements for break§;
      
      private var §default set extends§:int;
      
      private var startTime:int;
      
      private var §with static§:int;
      
      private var object:Object3D;
      
      private var channel:SoundChannel;
      
      private var alive:Boolean;
      
      private var time:int;
      
      private var § G§:Number;
      
      private var §""U§:Number;
      
      private var listener:§ q§;
      
      public function §;!9§(param1:§1Q§)
      {
         super(param1);
      }
      
      public function §get set package§(param1:§implements for break§, param2:Object3D, param3:§ q§ = null) : void
      {
         this.init(param1,param2,0,1,0,param3);
      }
      
      public function init(param1:§implements for break§, param2:Object3D, param3:int = 0, param4:int = 1, param5:int = 0, param6:§ q§ = null) : void
      {
         this.sound = param1;
         this.object = param2;
         this.§default set extends§ = param3;
         this.§with static§ = param4;
         this.startTime = param5;
         this.listener = param6;
         this.alive = true;
         this.time = 0;
         this.§ G§ = param1.volume;
         this.§""U§ = 0;
      }
      
      public function play(param1:int, param2:§3!0§) : void
      {
         if(!this.alive)
         {
            return;
         }
         if(this.time < this.§default set extends§)
         {
            this.time += param1;
            return;
         }
         if(!this.sound.§case package case§())
         {
            this.channel = this.sound.play(this.startTime,this.§with static§);
            if(this.channel != null)
            {
               this.channel.addEventListener(Event.SOUND_COMPLETE,this.§import var§);
            }
         }
         §native in§.x = this.object.x;
         §native in§.y = this.object.y;
         §native in§.z = this.object.z;
         if(this.§""U§ > 0)
         {
            this.§ G§ -= this.§""U§ * param1;
            if(this.§ G§ <= 0)
            {
               this.§""U§ = 0;
               this.§ G§ = 0;
            }
            this.sound.volume = this.§ G§;
         }
         this.sound.§class catch switch§(param2.position,§native in§,param2.§null for in§);
      }
      
      public function destroy() : void
      {
         this.§]#V§();
         §implements for break§.destroy(this.sound);
         this.object = null;
         this.sound = null;
         if(this.listener != null)
         {
            this.listener.§dynamic var each§(this);
            this.listener = null;
         }
         recycle();
      }
      
      public function kill() : void
      {
         this.alive = false;
      }
      
      public function set enabled(param1:Boolean) : void
      {
         if(!param1)
         {
            this.§]#V§();
         }
      }
      
      public function readPosition(param1:Vector3) : void
      {
         param1.x = this.object.x;
         param1.y = this.object.y;
         param1.z = this.object.z;
      }
      
      public function get numSounds() : int
      {
         return this.alive ? int(1) : int(0);
      }
      
      public function §'f§(param1:int) : void
      {
         this.§""U§ = this.§ G§ / param1;
      }
      
      private function §import var§(param1:Event) : void
      {
         this.§]#V§();
         this.alive = false;
      }
      
      private function §]#V§() : void
      {
         if(this.channel != null)
         {
            this.channel.removeEventListener(Event.SOUND_COMPLETE,this.§import var§);
            this.channel = null;
         }
         this.sound.stop();
         if(this.§with static§ <= 1)
         {
            this.alive = false;
         }
      }
   }
}

