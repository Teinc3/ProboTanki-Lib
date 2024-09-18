package §7"j§
{
   import §-!!§.§6!<§;
   import alternativa.math.Vector3;
   import alternativa.tanks.camera.§3!0§;
   import alternativa.tanks.engine3d.§throw const switch§;
   import §extends for const§.§1Q§;
   import §extends for const§.§["D§;
   
   public class §;#w§ extends §["D§ implements §finally const package§
   {
      private static const §null var get§:Number = 100;
      
      private var §switch catch use§:Number;
      
      protected var scale:Number;
      
      protected var §2"u§:Number;
      
      protected var §for package try§:§extends package dynamic§;
      
      private var currentTime:int;
      
      private var maxTime:int;
      
      private var container:§6!<§;
      
      public function §;#w§(param1:§1Q§)
      {
         super(param1);
         this.§for package try§ = new §extends package dynamic§(§null var get§);
         this.§for package try§.useShadowMap = false;
         this.§for package try§.useLight = false;
         this.§for package try§.shadowMapAlphaThreshold = 2;
         this.§for package try§.depthMapAlphaThreshold = 2;
         this.§for package try§.softAttenuation = 0;
      }
      
      public function init(param1:Number, param2:Vector3, param3:Vector3, param4:§throw const switch§, param5:Number) : void
      {
         this.§for package try§.init(param4,0.001 * param4.fps);
         this.maxTime = this.§for package try§.§8a§();
         this.currentTime = 0;
         this.§switch catch use§ = 0.001 * param5;
         this.§2"u§ = param1 / §null var get§;
         this.scale = this.§2"u§;
         this.§for package try§.x = param2.x;
         this.§for package try§.y = param2.y;
         this.§for package try§.z = param2.z;
         this.§for package try§.rotationX = param3.x;
         this.§for package try§.rotationY = param3.y;
         this.§for package try§.rotationZ = param3.z;
      }
      
      public function §&"-§(param1:§6!<§) : void
      {
         this.container = param1;
         param1.addChild(this.§for package try§);
      }
      
      public function play(param1:int, param2:§3!0§) : Boolean
      {
         if(this.currentTime >= this.maxTime)
         {
            return false;
         }
         this.§for package try§.setTime(this.currentTime);
         this.currentTime += param1;
         this.§for package try§.scaleX = this.scale;
         this.§for package try§.scaleY = this.scale;
         this.scale = this.§2"u§ + this.§2"u§ * this.§switch catch use§ * this.currentTime;
         return true;
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

