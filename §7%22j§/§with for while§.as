package §7"j§
{
   import alternativa.math.Vector3;
   import alternativa.tanks.battle.objects.tank.Tank;
   import alternativa.tanks.camera.§3!0§;
   import flash.events.Event;
   import flash.media.Sound;
   import flash.media.SoundChannel;
   
   public class §with for while§ implements §final var super§
   {
      private static const §!#D§:Vector3 = new Vector3();
      
      private var §use extends§:Tank;
      
      private var §3"<§:§1"7§;
      
      private var §,U§:§implements for break§;
      
      private var §with for switch§:int = 1;
      
      private var _enabled:Boolean = false;
      
      private var §default set while§:Boolean;
      
      public function §with for while§(param1:Sound, param2:Sound, param3:Sound, param4:Sound)
      {
         super();
         this.§3"<§ = new §1"7§(param1,param2,param3);
         this.§,U§ = §implements for break§.create(param4,0.5,500,2000,5);
      }
      
      public function §null for for§() : void
      {
         this.§with for switch§ = §1"7§.IDLE;
         if(this._enabled)
         {
            this.§3"<§.§null for for§();
         }
      }
      
      public function §;#9§() : void
      {
         this.§with for switch§ = §1"7§.§get const with§;
         if(this._enabled)
         {
            this.§3"<§.§;#9§();
         }
      }
      
      public function §case set false§() : void
      {
         this.§with for switch§ = §1"7§.§implements package implements§;
         if(this._enabled)
         {
            this.§3"<§.§case set false§();
         }
      }
      
      public function §with for with§(param1:Tank) : void
      {
         this.§use extends§ = param1;
      }
      
      public function § $§(param1:Boolean) : void
      {
         var _loc2_:SoundChannel = null;
         if(this._enabled)
         {
            if(param1 && this.§default set while§)
            {
               if(!this.§,U§.§case package case§())
               {
                  _loc2_ = this.§,U§.play(100,0);
                  if(_loc2_ != null)
                  {
                     _loc2_.addEventListener(Event.SOUND_COMPLETE,this.§3#I§);
                  }
               }
            }
            else if(this.§,U§.§case package case§())
            {
               this.§,U§.stop();
            }
         }
      }
      
      private function §3#I§(param1:Event) : void
      {
         if(this.§default set while§)
         {
            this.§,U§.play(3000,9999);
         }
      }
      
      public function set §2#!§(param1:Boolean) : void
      {
         if(this.§default set while§ != param1)
         {
            this.§default set while§ = param1;
            if(!this.§default set while§)
            {
               this.§,U§.stop();
            }
         }
      }
      
      public function play(param1:int, param2:§3!0§) : void
      {
         if(this.§use extends§ != null && this._enabled)
         {
            §!#D§.copy(this.§use extends§.§0"t§().state.position);
            this.§3"<§.update(param1,param2.position,§!#D§,param2.§null for in§);
            this.§,U§.§class catch switch§(param2.position,§!#D§,param2.§null for in§);
         }
      }
      
      public function destroy() : void
      {
         this.§3"<§.stop();
         this.§,U§.stop();
      }
      
      public function kill() : void
      {
      }
      
      public function get numSounds() : int
      {
         return 2;
      }
      
      public function readPosition(param1:Vector3) : void
      {
         param1.copy(this.§use extends§.§0"t§().state.position);
      }
      
      public function set enabled(param1:Boolean) : void
      {
         if(this._enabled != param1)
         {
            this._enabled = param1;
            this.§6" §();
         }
      }
      
      private function §6" §() : void
      {
         if(this._enabled)
         {
            switch(this.§with for switch§)
            {
               case §1"7§.IDLE:
                  this.§3"<§.§null for for§();
                  break;
               case §1"7§.§get const with§:
                  this.§3"<§.§;#9§();
                  break;
               case §1"7§.§implements package implements§:
                  this.§3"<§.§case set false§();
            }
         }
         else
         {
            this.§,U§.stop();
            this.§3"<§.§final var set§();
         }
      }
   }
}

