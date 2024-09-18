package §7"j§
{
   import §-!!§.§6!<§;
   import alternativa.engine3d.lights.OmniLight;
   import alternativa.tanks.camera.§3!0§;
   import §extends for const§.§1Q§;
   import §extends for const§.§["D§;
   
   public class §break set switch§ extends §["D§ implements §finally const package§
   {
      public static const §native for class§:Number = 1 / 2.2;
      
      private var light:OmniLight;
      
      private var time:int;
      
      private var currentTime:int;
      
      private var §default set with§:Number;
      
      private var container:§6!<§;
      
      private var §native package§:Number;
      
      public function §break set switch§(param1:§1Q§)
      {
         super(param1);
         this.light = new OmniLight(0,0,0);
      }
      
      public function init(param1:OmniLight, param2:int, param3:Number = 0.45454545454545453) : void
      {
         this.light.intensity = param1.intensity;
         this.light.color = param1.color;
         this.light.attenuationBegin = param1.attenuationBegin;
         this.light.attenuationEnd = param1.attenuationEnd;
         this.light.x = param1.x;
         this.light.y = param1.y;
         this.light.z = param1.z;
         this.light.calculateBounds();
         this.time = param2;
         this.§default set with§ = param3;
         this.§native package§ = param1.intensity;
         this.currentTime = 0;
      }
      
      public function §&"-§(param1:§6!<§) : void
      {
         this.container = param1;
         param1.addChild(this.light);
      }
      
      public function play(param1:int, param2:§3!0§) : Boolean
      {
         this.currentTime += param1;
         this.currentTime = Math.min(this.currentTime,this.time);
         var _loc3_:Number = 1 - this.currentTime / this.time;
         this.light.intensity = this.§native package§ * Math.pow(_loc3_,this.§default set with§);
         return this.currentTime < this.time;
      }
      
      public function destroy() : void
      {
         if(this.container != null)
         {
            this.container.removeChild(this.light);
            this.container = null;
         }
         recycle();
      }
      
      public function kill() : void
      {
         this.light = null;
      }
   }
}

