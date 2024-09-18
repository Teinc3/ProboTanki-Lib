package §native package break§
{
   import §7"j§.§final var super§;
   import §7"j§.§implements for break§;
   import alternativa.math.Vector3;
   import alternativa.tanks.camera.§3!0§;
   import §extends for const§.§1Q§;
   import §extends for const§.§["D§;
   import flash.media.Sound;
   
   public class §=#t§ extends §["D§ implements §final var super§
   {
      private static const §false package native§:Number = 1500;
      
      private static const §+!R§:Number = 5000;
      
      private static const §%!t§:Number = 10;
      
      private static const §%m§:Number = 1.3;
      
      private var §9#?§:§implements for break§;
      
      private var position:Vector3;
      
      private var alive:Boolean;
      
      public function §=#t§(param1:§1Q§)
      {
         this.position = new Vector3();
         super(param1);
      }
      
      public function init(param1:Sound, param2:Vector3) : void
      {
         this.§9#?§ = §implements for break§.create(param1,§%m§,§false package native§,§+!R§,§%!t§);
         this.position.copy(param2);
         this.alive = true;
      }
      
      public function play(param1:int, param2:§3!0§) : void
      {
         if(!this.§9#?§.§case package case§())
         {
            this.§9#?§.play(0,99999);
         }
         this.§9#?§.§class catch switch§(param2.position,this.position,param2.§null for in§);
      }
      
      public function destroy() : void
      {
         this.§9#?§.stop();
         §implements for break§.destroy(this.§9#?§);
         this.§9#?§ = null;
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
            this.§9#?§.stop();
         }
      }
      
      public function readPosition(param1:Vector3) : void
      {
         param1.copy(this.position);
      }
      
      public function get numSounds() : int
      {
         return this.alive ? int(1) : int(0);
      }
   }
}

