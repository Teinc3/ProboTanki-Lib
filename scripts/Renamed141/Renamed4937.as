package Renamed141
{
   import Renamed211.Renamed908;
   import Renamed1.Renamed609;
   import alternativa.engine3d.core.Object3D;
   import alternativa.engine3d.materials.TextureMaterial;
   import alternativa.engine3d.objects.Sprite3D;
   import alternativa.math.Vector3;
   import alternativa.tanks.camera.Renamed842;
   import Renamed356.Renamed1443;
   import Renamed356.Renamed1444;
   import flash.display.BlendMode;
   
   public class Renamed4937 extends Renamed1444 implements Renamed609
   {
      private static const vector:Vector3 = new Vector3();
      
      private var Renamed4938:Sprite3D;
      
      private var delay:int;
      
      private var time:int;
      
      private var Renamed4939:Number;
      
      private var direction:Boolean;
      
      private var turret:Object3D;
      
      private var state:int;
      
      private var container:Renamed908;
      
      public function Renamed4937(param1:Renamed1443)
      {
         super(param1);
         this.Renamed4938 = new Sprite3D(10,10);
         this.Renamed4938.blendMode = BlendMode.ADD;
      }
      
      public function init(param1:int, param2:Number, param3:Number, param4:Boolean, param5:Object3D, param6:TextureMaterial) : void
      {
         this.delay = param1;
         this.Renamed4938.width = param2;
         this.Renamed4938.height = param2;
         this.Renamed4938.calculateBounds();
         this.Renamed4939 = param3;
         this.direction = param4;
         this.turret = param5;
         param6.resolution = 5;
         this.Renamed4938.material = param6;
         this.Renamed4938.scaleX = 1;
         this.Renamed4938.scaleY = 1;
         this.Renamed4938.scaleZ = 1;
         this.Renamed4938.rotation = 0;
         this.Renamed4938.alpha = 0;
         this.state = 0;
         this.Renamed4938.softAttenuation = 150;
         this.Renamed4938.depthMapAlphaThreshold = 2;
         this.Renamed4938.shadowMapAlphaThreshold = 2;
         this.Renamed4938.useShadowMap = false;
         this.Renamed4938.useLight = false;
         this.time = 0;
      }
      
      public function Renamed1411(param1:Renamed908) : void
      {
         this.container = param1;
         param1.addChild(this.Renamed4938);
      }
      
      public function play(param1:int, param2:Renamed842) : Boolean
      {
         var _loc3_:Number = NaN;
         var _loc4_:Number = NaN;
         var _loc5_:Number = NaN;
         if(this.state == 2)
         {
            return false;
         }
         var _loc6_:Number = 0.7 * 5;
         var _loc7_:Number = _loc6_ / 3;
         var _loc8_:Number = 0.2;
         _loc3_ = 300;
         vector.x = param2.x - this.turret.x;
         vector.y = param2.y - this.turret.y;
         vector.z = param2.z - this.turret.z;
         vector.normalize();
         vector.scale(_loc3_);
         this.Renamed4938.x = this.turret.x + vector.x;
         this.Renamed4938.y = this.turret.y + vector.y;
         this.Renamed4938.z = this.turret.z + vector.z + 30;
         this.time += param1;
         if(this.time >= this.delay)
         {
            if(this.direction)
            {
               this.Renamed4938.rotation += _loc8_ * param1 * 0.001;
            }
            else
            {
               this.Renamed4938.rotation -= _loc8_ * param1 * 0.001;
            }
            if(this.state == 0)
            {
               _loc4_ = _loc6_ * param1 * 0.001;
               this.Renamed4938.scaleX += _loc4_;
               this.Renamed4938.scaleY += _loc4_;
               this.Renamed4938.scaleZ += _loc4_;
               if(this.Renamed4938.scaleX > this.Renamed4939)
               {
                  this.Renamed4938.scaleX = this.Renamed4939;
                  this.Renamed4938.scaleY = this.Renamed4939;
                  this.Renamed4938.scaleZ = this.Renamed4939;
                  this.state = 1;
               }
               this.Renamed4938.alpha = (this.Renamed4938.scaleX - 1) / (this.Renamed4939 - 1);
            }
            else if(this.state == 1)
            {
               _loc5_ = _loc7_ * param1 * 0.001;
               this.Renamed4938.scaleX -= _loc5_;
               this.Renamed4938.scaleY -= _loc5_;
               this.Renamed4938.scaleZ -= _loc5_;
               if(this.Renamed4938.scaleX < 1)
               {
                  this.Renamed4938.scaleX = 1;
                  this.Renamed4938.scaleY = 1;
                  this.Renamed4938.scaleZ = 1;
                  this.state = 2;
               }
               this.Renamed4938.alpha = (this.Renamed4938.scaleX - 1) / (this.Renamed4939 - 1) - 0.1;
            }
         }
         return true;
      }
      
      public function destroy() : void
      {
         this.container.removeChild(this.Renamed4938);
         this.container = null;
         this.Renamed4938.material = null;
         recycle();
      }
      
      public function kill() : void
      {
         this.state = 2;
         this.Renamed4938.alpha = 0;
      }
   }
}

