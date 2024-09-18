package §class for§
{
   import §-!!§.§6!<§;
   import §7"j§.§each var set§;
   import §7"j§.§finally const package§;
   import §7"j§.§null catch while§;
   import alternativa.math.Vector3;
   import alternativa.tanks.camera.§3!0§;
   import alternativa.tanks.engine3d.§throw const switch§;
   import §extends for const§.§1Q§;
   import §extends for const§.§["D§;
   
   public class §%?§ extends §["D§ implements §finally const package§
   {
      private var position:Vector3;
      
      private var direction:Vector3;
      
      private var currentTime:int;
      
      private var maxTime:int;
      
      private var §for package try§:§each var set§;
      
      private var container:§6!<§;
      
      public function §%?§(param1:§1Q§)
      {
         this.position = new Vector3();
         this.direction = new Vector3();
         super(param1);
         this.§for package try§ = new §each var set§(30,200,0,-100,0);
      }
      
      public function init(param1:Vector3, param2:Vector3, param3:§throw const switch§) : void
      {
         this.position.copy(param1);
         this.direction.copy(param2);
         this.§for package try§.init(param3,0.001 * param3.fps);
         this.maxTime = this.§for package try§.§8a§();
         this.currentTime = 0;
         this.§for package try§.x = param1.x;
         this.§for package try§.y = param1.y;
         this.§for package try§.z = param1.z;
      }
      
      public function play(param1:int, param2:§3!0§) : Boolean
      {
         if(this.currentTime >= this.maxTime)
         {
            return false;
         }
         this.§for package try§.setTime(this.currentTime);
         this.currentTime += param1;
         §null catch while§.§native var static§(this.§for package try§,this.position,this.direction,param2.position);
         return true;
      }
      
      public function §&"-§(param1:§6!<§) : void
      {
         this.container = param1;
         param1.addChild(this.§for package try§);
      }
      
      public function destroy() : void
      {
         this.container.removeChild(this.§for package try§);
         this.container = null;
         this.§for package try§.clear();
         recycle();
      }
      
      public function kill() : void
      {
         this.currentTime = this.maxTime;
      }
   }
}

