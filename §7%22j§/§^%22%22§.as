package §7"j§
{
   import §-!!§.§6!<§;
   import alternativa.engine3d.core.Light3D;
   import alternativa.tanks.camera.§3!0§;
   import §extends for const§.§1Q§;
   import §extends for const§.§["D§;
   
   public class §^""§ extends §["D§ implements §finally const package§
   {
      private static const §implements for try§:int = 250;
      
      protected var light:Light3D;
      
      protected var §[#k§:§include finally§;
      
      protected var §9!3§:§include finally§;
      
      protected var startTime:int;
      
      protected var §?">§:int;
      
      protected var §-!O§:int;
      
      protected var currentTime:int;
      
      protected var §@!r§:Boolean;
      
      protected var §true var var§:§super const class§;
      
      protected var alive:Boolean;
      
      protected var random:int;
      
      protected var §continue for use§:Boolean;
      
      protected var fadeTime:int;
      
      protected var container:§6!<§;
      
      public function §^""§(param1:§1Q§, param2:Light3D)
      {
         super(param1);
         this.light = param2;
      }
      
      public function §&"-§(param1:§6!<§) : void
      {
         this.container = param1;
         param1.addChild(this.light);
      }
      
      private function §`!z§() : void
      {
         this.§-!O§ = this.§?">§ + (Math.random() * this.random - this.random / 2);
      }
      
      public function play(param1:int, param2:§3!0§) : Boolean
      {
         if(!this.alive)
         {
            return false;
         }
         if(this.§@!r§)
         {
            this.currentTime += param1;
            this.§[#k§.§ !Z§(this.light,this.currentTime,this.startTime);
            if(this.currentTime >= this.startTime)
            {
               this.§@!r§ = false;
               this.currentTime = 0;
               this.§`!z§();
            }
         }
         else
         {
            this.currentTime += param1;
            if(this.currentTime > this.§-!O§)
            {
               this.currentTime %= this.§-!O§;
               this.§`!z§();
            }
            this.§9!3§.§ !Z§(this.light,this.currentTime,this.§?">§);
         }
         this.§true var var§.§'!g§(this.light,param2,param1);
         if(this.§continue for use§)
         {
            this.fadeTime += param1;
            if(this.fadeTime <= §implements for try§)
            {
               this.light.intensity *= 1 - this.fadeTime / §implements for try§;
            }
            else
            {
               this.light.intensity = 0;
               this.kill();
            }
         }
         return true;
      }
      
      public function destroy() : void
      {
         this.container.removeChild(this.light);
         this.container = null;
         this.§[#k§ = null;
         this.§9!3§ = null;
         this.§true var var§.destroy();
         this.§true var var§ = null;
         recycle();
      }
      
      public function kill() : void
      {
         this.alive = false;
      }
      
      public function stop() : void
      {
         this.§continue for use§ = true;
         this.fadeTime = 0;
      }
   }
}

