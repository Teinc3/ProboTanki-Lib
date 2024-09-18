package §case include§
{
   import §7"j§.§final var super§;
   import §7"j§.§implements for break§;
   import alternativa.engine3d.core.Object3D;
   import alternativa.math.Vector3;
   import alternativa.tanks.camera.§3!0§;
   import §extends for const§.§1Q§;
   import §extends for const§.§["D§;
   import flash.media.Sound;
   import flash.media.SoundChannel;
   import flash.media.SoundTransform;
   import §set break§.§try var finally§;
   
   public class §0!H§ extends §["D§ implements §final var super§
   {
      private static const §get for final§:int = 100000;
      
      private static const §false package native§:Number = 1000;
      
      private static const §+!R§:Number = 2000;
      
      private static const §%!t§:Number = 2;
      
      private static const §%m§:Number = 1;
      
      private static const §^!<§:int = 200;
      
      private static const position:Vector3 = new Vector3();
      
      private var sfxData:§&!$§;
      
      private var object:Object3D;
      
      private var _type:§try var finally§;
      
      private var _enabled:Boolean;
      
      private var dead:Boolean;
      
      private var §%!h§:§implements for break§;
      
      private var §>#n§:SoundChannel;
      
      public function §0!H§(param1:§1Q§)
      {
         super(param1);
      }
      
      public function init(param1:§&!$§, param2:Object3D) : void
      {
         this.sfxData = param1;
         this.object = param2;
         this._type = §try var finally§.OFF;
         this.dead = false;
         this._enabled = false;
      }
      
      public function set type(param1:§try var finally§) : void
      {
         if(this._type != param1)
         {
            this._type = param1;
            this.§function var native§();
         }
      }
      
      public function set enabled(param1:Boolean) : void
      {
         if(this._enabled != param1)
         {
            this._enabled = param1;
            if(!this._enabled)
            {
               this.§%!h§.stop();
               this.§>#n§ = null;
            }
         }
      }
      
      public function play(param1:int, param2:§3!0§) : void
      {
         if(!this.dead)
         {
            if(this.§>#n§ == null)
            {
               this.§>#n§ = this.§%!h§.play(§^!<§,§get for final§);
            }
            position.x = this.object.x;
            position.y = this.object.y;
            position.z = this.object.z;
            this.§%!h§.§class catch switch§(param2.position,position,param2.§null for in§);
         }
      }
      
      public function readPosition(param1:Vector3) : void
      {
         param1.x = this.object.x;
         param1.y = this.object.y;
         param1.z = this.object.z;
      }
      
      public function destroy() : void
      {
         if(this.§%!h§ != null)
         {
            §implements for break§.destroy(this.§%!h§);
            this.§%!h§ = null;
            this.§>#n§ = null;
         }
         this.sfxData = null;
         this.object = null;
         recycle();
      }
      
      public function get numSounds() : int
      {
         return this.dead ? int(0) : int(1);
      }
      
      public function kill() : void
      {
         this.dead = true;
      }
      
      private function §function var native§() : void
      {
         var _loc1_:SoundTransform = null;
         if(this.§>#n§ != null)
         {
            _loc1_ = this.§>#n§.soundTransform;
            this.§>#n§ = null;
         }
         if(this.§%!h§ != null)
         {
            §implements for break§.destroy(this.§%!h§);
         }
         var _loc2_:Sound = this.§@#S§();
         this.§%!h§ = §implements for break§.create(_loc2_,§%m§,§false package native§,§+!R§,§%!t§);
         if(_loc1_ != null)
         {
            this.§>#n§ = this.§%!h§.play(§^!<§,§get for final§);
            if(this.§>#n§ != null)
            {
               this.§>#n§.soundTransform = _loc1_;
            }
         }
      }
      
      private function §@#S§() : Sound
      {
         switch(this._type)
         {
            case §try var finally§.IDLE:
               return this.sfxData.idleSound;
            case §try var finally§.HEALING:
               return this.sfxData.§!#=§;
            case §try var finally§.DAMAGING:
               return this.sfxData.§false const package§;
            default:
               throw new Error();
         }
      }
   }
}

