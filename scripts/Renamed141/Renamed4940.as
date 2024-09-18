package Renamed141
{
   import Renamed211.Renamed908;
   import Renamed1.Renamed609;
   import alternativa.engine3d.core.Object3D;
   import alternativa.engine3d.materials.TextureMaterial;
   import alternativa.tanks.camera.Renamed842;
   import Renamed356.Renamed1443;
   import Renamed356.Renamed1444;
   import flash.display.BlendMode;
   
   public class Renamed4940 extends Renamed1444 implements Renamed609
   {
      private static const Renamed4941:Number = 300;
      
      private var Renamed4942:Renamed4943;
      
      private var delay:int;
      
      private var time:int;
      
      private var height:Number;
      
      private var Renamed4944:Number;
      
      private var Renamed4945:Number;
      
      private var Renamed4946:Number;
      
      private var x:Number;
      
      private var y:Number;
      
      private var z:Number;
      
      private var turret:Object3D;
      
      private var container:Renamed908;
      
      public function Renamed4940(param1:Renamed1443)
      {
         super(param1);
         this.Renamed4942 = new Renamed4943(Renamed4941);
         this.Renamed4942.blendMode = BlendMode.ADD;
      }
      
      public function init(param1:int, param2:Number, param3:Number, param4:Number, param5:Number, param6:Number, param7:Number, param8:Number, param9:Number, param10:Object3D, param11:TextureMaterial) : void
      {
         this.delay = param1;
         this.Renamed4942.scaleX = param2 / Renamed4941;
         this.height = param3;
         this.Renamed4944 = param4;
         this.Renamed4945 = param5;
         this.Renamed4946 = param6;
         this.x = param7;
         this.y = param8;
         this.z = param9;
         this.turret = param10;
         this.Renamed4942.init(param11);
         this.Renamed4942.softAttenuation = 150;
         this.Renamed4942.depthMapAlphaThreshold = 2;
         this.Renamed4942.shadowMapAlphaThreshold = 2;
         this.Renamed4942.useShadowMap = false;
         this.Renamed4942.useLight = false;
         this.Renamed4942.alpha = 0;
         this.time = 0;
      }
      
      public function Renamed1411(param1:Renamed908) : void
      {
         this.container = param1;
         param1.addChild(this.Renamed4942);
      }
      
      public function play(param1:int, param2:Renamed842) : Boolean
      {
         if(this.height >= this.Renamed4944 && this.Renamed4942.alpha <= 0)
         {
            return false;
         }
         this.Renamed4942.x = this.turret.x + this.x;
         this.Renamed4942.y = this.turret.y + this.y;
         this.Renamed4942.z = this.turret.z + this.z;
         this.Renamed4942.rotationZ = param2.rotationZ;
         this.time += param1;
         if(this.time >= this.delay)
         {
            if(this.height < this.Renamed4944)
            {
               this.height += this.Renamed4944 * this.Renamed4945 * param1 * 0.001;
               if(this.height >= this.Renamed4944)
               {
                  this.height = this.Renamed4944;
               }
               this.Renamed4942.scaleZ = this.height / Renamed4941;
               this.Renamed4942.alpha = this.height / this.Renamed4944;
            }
            else
            {
               this.Renamed4942.alpha -= this.Renamed4946 * param1 * 0.001;
               if(this.Renamed4942.alpha < 0)
               {
                  this.Renamed4942.alpha = 0;
               }
            }
         }
         return true;
      }
      
      public function destroy() : void
      {
         this.container.removeChild(this.Renamed4942);
         this.container = null;
         this.turret = null;
         this.Renamed4942.clear();
         recycle();
      }
      
      public function kill() : void
      {
         this.height = this.Renamed4944;
         this.Renamed4942.alpha = 0;
      }
   }
}

