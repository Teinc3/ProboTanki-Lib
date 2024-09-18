package §]3§
{
   import §-!!§.§6!<§;
   import §7"j§.§finally const package§;
   import §7"j§.§super const class§;
   import alternativa.engine3d.core.MipMapping;
   import alternativa.engine3d.lights.OmniLight;
   import alternativa.engine3d.materials.TextureMaterial;
   import alternativa.engine3d.objects.Sprite3D;
   import alternativa.math.Vector3;
   import alternativa.tanks.camera.§3!0§;
   import §extends for const§.§1Q§;
   import §extends for const§.§["D§;
   import flash.display.BlendMode;
   import projects.tanks.clients.flash.commons.models.gpu.GPUCapabilities;
   
   public class §6#a§ extends §["D§ implements §finally const package§
   {
      private static const SIZE:Number = 256;
      
      private static const §0@§:Number = 2;
      
      private static const §true set import§:Class = §;#=§;
      
      private static const §`#v§:Class = §for set each§;
      
      private static const §0#m§:Class = §else var continue§;
      
      private static const §'$"§:Class = §break package function§;
      
      private static const §case const set§:Number = 100;
      
      private static const §=",§:Number = 300;
      
      private static const §5v§:Number = 500;
      
      private static const §null for final§:Number = 1000;
      
      private static const §+!C§:Number = 0.3;
      
      private static const §;!d§:Number = 1.3;
      
      private static const §override var class§:Number = Math.PI / 2;
      
      private static const §`#h§:Number = 3;
      
      private var sprite:Sprite3D;
      
      private var omni:OmniLight;
      
      private var container:§6!<§;
      
      private var §true var var§:§super const class§;
      
      private var alive:Boolean;
      
      private var time:Number;
      
      public function §6#a§(param1:§1Q§)
      {
         this.§for const dynamic§ = new TextureMaterial(new §true set import§().bitmapData,false,true,MipMapping.PER_PIXEL,§0@§);
         this.§super for const§ = new TextureMaterial(new §`#v§().bitmapData,false,true,MipMapping.PER_PIXEL,§0@§);
         this.§use import§ = new TextureMaterial(new §0#m§().bitmapData,false,true,MipMapping.PER_PIXEL,§0@§);
         this.§switch package false§ = new TextureMaterial(new §'$"§().bitmapData,false,true,MipMapping.PER_PIXEL,§0@§);
         this.omni = new OmniLight(0,0,0);
         super(param1);
      }
      
      public function §&"-§(param1:§6!<§) : void
      {
         this.container = param1;
         param1.addChild(this.sprite);
         if(GPUCapabilities.gpuEnabled && !GPUCapabilities.constrained)
         {
            param1.addChild(this.omni);
         }
      }
      
      public function init(param1:Sprite3D, param2:§super const class§, param3:Vector3) : void
      {
         this.sprite = param1;
         this.§true var var§ = param2;
         param1.width = SIZE;
         param1.height = SIZE;
         param1.originX = 0.5;
         param1.originY = 0.5;
         param1.softAttenuation = 50;
         param1.useLight = false;
         param1.useShadowMap = false;
         param1.shadowMapAlphaThreshold = 2;
         param1.depthMapAlphaThreshold = 2;
         param1.blendMode = BlendMode.ADD;
         if(param1.name.indexOf("1") >= 0)
         {
            param1.material = this.§for const dynamic§;
            this.omni.color = 16727074;
         }
         else if(param1.name.indexOf("2") >= 0)
         {
            param1.material = this.§super for const§;
            this.omni.color = 6356736;
         }
         else if(param1.name.indexOf("3") >= 0)
         {
            param1.material = this.§use import§;
            this.omni.color = 34047;
         }
         else if(param1.name.indexOf("4") >= 0)
         {
            param1.material = this.§switch package false§;
            this.omni.color = 16771584;
         }
         this.omni.intensity = 0.7;
         this.omni.attenuationBegin = §=",§;
         this.omni.attenuationEnd = §null for final§;
         this.omni.calculateBounds();
         var _loc4_:Number = 200;
         var _loc5_:Number = param1.x - param3.x;
         var _loc6_:Number = param1.y - param3.y;
         var _loc7_:Number = Math.sqrt(_loc5_ * _loc5_ + _loc6_ * _loc6_);
         this.omni.x = param1.x + _loc5_ * _loc4_ / _loc7_;
         this.omni.y = param1.y + _loc6_ * _loc4_ / _loc7_;
         this.omni.z = param1.z + _loc4_ / 2;
         this.time = Math.random() * §`#h§;
         this.alive = true;
      }
      
      public function play(param1:int, param2:§3!0§) : Boolean
      {
         if(!this.alive)
         {
            return false;
         }
         this.§true var var§.§'!g§(this.sprite,param2,param1);
         var _loc3_:Number = param1 / 1000;
         this.time += _loc3_;
         this.time %= §`#h§;
         var _loc4_:Number = Math.sin(Math.PI * 2 * this.time / §`#h§) * 0.5 + 0.5;
         var _loc5_:Number = §+!C§ + (§;!d§ - §+!C§) * _loc4_;
         this.sprite.scaleX = _loc5_;
         this.sprite.scaleY = _loc5_;
         this.sprite.scaleZ = _loc5_;
         this.sprite.rotation += §override var class§ * _loc3_ * _loc4_;
         this.omni.attenuationBegin = §case const set§ + (§=",§ - §case const set§) * _loc4_;
         this.omni.attenuationEnd = §5v§ + (§null for final§ - §5v§) * _loc4_;
         return true;
      }
      
      public function destroy() : void
      {
         this.container.removeChild(this.sprite);
         if(GPUCapabilities.gpuEnabled && !GPUCapabilities.constrained)
         {
            this.container.removeChild(this.omni);
         }
         this.sprite = null;
         this.container = null;
         this.§true var var§.destroy();
         this.§true var var§ = null;
         recycle();
      }
      
      public function kill() : void
      {
         this.alive = false;
      }
   }
}

