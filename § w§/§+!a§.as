package § w§
{
   import §-!!§.§6!<§;
   import §7"j§.§finally const package§;
   import alternativa.engine3d.core.Object3D;
   import alternativa.engine3d.materials.TextureMaterial;
   import alternativa.tanks.camera.§3!0§;
   import §extends for const§.§1Q§;
   import §extends for const§.§["D§;
   import flash.display.BlendMode;
   
   public class §+!a§ extends §["D§ implements §finally const package§
   {
      private static const §null var get§:Number = 300;
      
      private var §-#E§:§static var include§;
      
      private var delay:int;
      
      private var time:int;
      
      private var height:Number;
      
      private var §null super§:Number;
      
      private var §&1§:Number;
      
      private var §case set get§:Number;
      
      private var x:Number;
      
      private var y:Number;
      
      private var z:Number;
      
      private var turret:Object3D;
      
      private var container:§6!<§;
      
      public function §+!a§(param1:§1Q§)
      {
         super(param1);
         this.§-#E§ = new §static var include§(§null var get§);
         this.§-#E§.blendMode = BlendMode.ADD;
      }
      
      public function init(param1:int, param2:Number, param3:Number, param4:Number, param5:Number, param6:Number, param7:Number, param8:Number, param9:Number, param10:Object3D, param11:TextureMaterial) : void
      {
         this.delay = param1;
         this.§-#E§.scaleX = param2 / §null var get§;
         this.height = param3;
         this.§null super§ = param4;
         this.§&1§ = param5;
         this.§case set get§ = param6;
         this.x = param7;
         this.y = param8;
         this.z = param9;
         this.turret = param10;
         this.§-#E§.init(param11);
         this.§-#E§.softAttenuation = 150;
         this.§-#E§.depthMapAlphaThreshold = 2;
         this.§-#E§.shadowMapAlphaThreshold = 2;
         this.§-#E§.useShadowMap = false;
         this.§-#E§.useLight = false;
         this.§-#E§.alpha = 0;
         this.time = 0;
      }
      
      public function §&"-§(param1:§6!<§) : void
      {
         this.container = param1;
         param1.addChild(this.§-#E§);
      }
      
      public function play(param1:int, param2:§3!0§) : Boolean
      {
         if(this.height >= this.§null super§ && this.§-#E§.alpha <= 0)
         {
            return false;
         }
         this.§-#E§.x = this.turret.x + this.x;
         this.§-#E§.y = this.turret.y + this.y;
         this.§-#E§.z = this.turret.z + this.z;
         this.§-#E§.rotationZ = param2.rotationZ;
         this.time += param1;
         if(this.time >= this.delay)
         {
            if(this.height < this.§null super§)
            {
               this.height += this.§null super§ * this.§&1§ * param1 * 0.001;
               if(this.height >= this.§null super§)
               {
                  this.height = this.§null super§;
               }
               this.§-#E§.scaleZ = this.height / §null var get§;
               this.§-#E§.alpha = this.height / this.§null super§;
            }
            else
            {
               this.§-#E§.alpha -= this.§case set get§ * param1 * 0.001;
               if(this.§-#E§.alpha < 0)
               {
                  this.§-#E§.alpha = 0;
               }
            }
         }
         return true;
      }
      
      public function destroy() : void
      {
         this.container.removeChild(this.§-#E§);
         this.container = null;
         this.turret = null;
         this.§-#E§.clear();
         recycle();
      }
      
      public function kill() : void
      {
         this.height = this.§null super§;
         this.§-#E§.alpha = 0;
      }
   }
}

