package Renamed483
{
   import Renamed211.Renamed908;
   import Renamed1.Renamed609;
   import Renamed1.Renamed6901;
   import alternativa.engine3d.core.MipMapping;
   import alternativa.engine3d.lights.OmniLight;
   import alternativa.engine3d.materials.TextureMaterial;
   import alternativa.engine3d.objects.Sprite3D;
   import alternativa.math.Vector3;
   import alternativa.tanks.camera.Renamed842;
   import Renamed356.Renamed1443;
   import Renamed356.Renamed1444;
   import flash.display.BlendMode;
   import projects.tanks.clients.flash.commons.models.gpu.GPUCapabilities;
   
   public class Renamed7969 extends Renamed1444 implements Renamed609
   {
      private static const SIZE:Number = 256;
      
      private static const Renamed9533:Number = 2;
      
      private static const Renamed9534:Class = Renamed9535;
      
      private static const Renamed9536:Class = Renamed9537;
      
      private static const Renamed9538:Class = Renamed9539;
      
      private static const Renamed9540:Class = Renamed9541;
      
      private static const Renamed9542:Number = 100;
      
      private static const Renamed9543:Number = 300;
      
      private static const Renamed9544:Number = 500;
      
      private static const Renamed9545:Number = 1000;
      
      private static const Renamed9206:Number = 0.3;
      
      private static const Renamed9546:Number = 1.3;
      
      private static const Renamed9547:Number = Math.PI / 2;
      
      private static const Renamed9204:Number = 3;
      
      private var sprite:Sprite3D;
      
      private var omni:OmniLight;
      
      private var container:Renamed908;
      
      private var Renamed6909:Renamed6901;
      
      private var alive:Boolean;
      
      private var time:Number;
      
      public function Renamed7969(param1:Renamed1443)
      {
         this.Renamed9548 = new TextureMaterial(new Renamed9534().bitmapData,false,true,MipMapping.PER_PIXEL,Renamed9533);
         this.Renamed9549 = new TextureMaterial(new Renamed9536().bitmapData,false,true,MipMapping.PER_PIXEL,Renamed9533);
         this.Renamed9550 = new TextureMaterial(new Renamed9538().bitmapData,false,true,MipMapping.PER_PIXEL,Renamed9533);
         this.Renamed9551 = new TextureMaterial(new Renamed9540().bitmapData,false,true,MipMapping.PER_PIXEL,Renamed9533);
         this.omni = new OmniLight(0,0,0);
         super(param1);
      }
      
      public function Renamed1411(param1:Renamed908) : void
      {
         this.container = param1;
         param1.addChild(this.sprite);
         if(GPUCapabilities.gpuEnabled && !GPUCapabilities.constrained)
         {
            param1.addChild(this.omni);
         }
      }
      
      public function init(param1:Sprite3D, param2:Renamed6901, param3:Vector3) : void
      {
         this.sprite = param1;
         this.Renamed6909 = param2;
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
            param1.material = this.Renamed9548;
            this.omni.color = 16727074;
         }
         else if(param1.name.indexOf("2") >= 0)
         {
            param1.material = this.Renamed9549;
            this.omni.color = 6356736;
         }
         else if(param1.name.indexOf("3") >= 0)
         {
            param1.material = this.Renamed9550;
            this.omni.color = 34047;
         }
         else if(param1.name.indexOf("4") >= 0)
         {
            param1.material = this.Renamed9551;
            this.omni.color = 16771584;
         }
         this.omni.intensity = 0.7;
         this.omni.attenuationBegin = Renamed9543;
         this.omni.attenuationEnd = Renamed9545;
         this.omni.calculateBounds();
         var _loc4_:Number = 200;
         var _loc5_:Number = param1.x - param3.x;
         var _loc6_:Number = param1.y - param3.y;
         var _loc7_:Number = Math.sqrt(_loc5_ * _loc5_ + _loc6_ * _loc6_);
         this.omni.x = param1.x + _loc5_ * _loc4_ / _loc7_;
         this.omni.y = param1.y + _loc6_ * _loc4_ / _loc7_;
         this.omni.z = param1.z + _loc4_ / 2;
         this.time = Math.random() * Renamed9204;
         this.alive = true;
      }
      
      public function play(param1:int, param2:Renamed842) : Boolean
      {
         if(!this.alive)
         {
            return false;
         }
         this.Renamed6909.Renamed6905(this.sprite,param2,param1);
         var _loc3_:Number = param1 / 1000;
         this.time += _loc3_;
         this.time %= Renamed9204;
         var _loc4_:Number = Math.sin(Math.PI * 2 * this.time / Renamed9204) * 0.5 + 0.5;
         var _loc5_:Number = Renamed9206 + (Renamed9546 - Renamed9206) * _loc4_;
         this.sprite.scaleX = _loc5_;
         this.sprite.scaleY = _loc5_;
         this.sprite.scaleZ = _loc5_;
         this.sprite.rotation += Renamed9547 * _loc3_ * _loc4_;
         this.omni.attenuationBegin = Renamed9542 + (Renamed9543 - Renamed9542) * _loc4_;
         this.omni.attenuationEnd = Renamed9544 + (Renamed9545 - Renamed9544) * _loc4_;
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
         this.Renamed6909.destroy();
         this.Renamed6909 = null;
         recycle();
      }
      
      public function kill() : void
      {
         this.alive = false;
      }
   }
}

