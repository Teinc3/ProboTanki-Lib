package §in set else§
{
   import §7"j§.§final var super§;
   import §7"j§.§implements for break§;
   import alternativa.math.Vector3;
   import alternativa.tanks.camera.§3!0§;
   import §extends for const§.§1Q§;
   import §extends for const§.§["D§;
   
   public class §6",§ extends §["D§ implements §final var super§
   {
      private static const §=s§:int = 99999;
      
      private var tankHitSound:§implements for break§;
      
      private var hitSound:§implements for break§;
      
      private var §function for static§:§implements for break§;
      
      private var §4g§:§implements for break§;
      
      private var position:Vector3;
      
      private var alive:Boolean;
      
      public function §6",§(param1:§1Q§)
      {
         this.position = new Vector3();
         super(param1);
      }
      
      public function init(param1:§implements for break§, param2:§implements for break§) : void
      {
         this.hitSound = param1;
         this.tankHitSound = param2;
         this.alive = true;
         this.§function for static§ = param1;
      }
      
      public function §return const do§(param1:Vector3, param2:Boolean) : void
      {
         this.position.copy(param1);
         this.§4g§ = this.§function for static§;
         this.§function for static§ = param2 ? this.tankHitSound : this.hitSound;
         if(this.§4g§ != this.§function for static§)
         {
            this.§return override§();
         }
      }
      
      public function play(param1:int, param2:§3!0§) : void
      {
         if(!this.§function for static§.§case package case§())
         {
            this.§function for static§.play(0,§=s§);
         }
         this.§function for static§.§class catch switch§(param2.position,this.position,param2.§null for in§);
      }
      
      public function destroy() : void
      {
         this.§return override§();
         this.hitSound = null;
         this.tankHitSound = null;
         this.§function for static§ = null;
         this.§4g§ = null;
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
            this.§return override§();
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
      
      private function §return override§() : void
      {
         this.hitSound.stop();
         this.tankHitSound.stop();
      }
   }
}

