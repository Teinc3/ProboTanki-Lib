package Renamed141
{
   import Renamed211.Renamed908;
   import Renamed1.Renamed609;
   import alternativa.engine3d.core.Object3D;
   import alternativa.engine3d.materials.TextureMaterial;
   import alternativa.engine3d.objects.Sprite3D;
   import alternativa.tanks.camera.Renamed842;
   import Renamed356.Renamed1443;
   import Renamed356.Renamed1444;
   
   public class Renamed4947 extends Renamed1444 implements Renamed609
   {
      private var Renamed4948:Sprite3D;
      
      private var delay:int;
      
      private var time:int;
      
      private var Renamed4944:Number;
      
      private var Renamed4949:Number;
      
      private var Renamed4945:Number;
      
      private var x:Number;
      
      private var y:Number;
      
      private var z:Number;
      
      private var object:Object3D;
      
      private var container:Renamed908;
      
      public function Renamed4947(param1:Renamed1443)
      {
         super(param1);
         this.Renamed4948 = new Sprite3D(10,10);
      }
      
      public function init(param1:int, param2:Number, param3:Number, param4:Number, param5:Number, param6:Number, param7:Number, param8:Number, param9:Number, param10:Number, param11:Object3D, param12:TextureMaterial, param13:String) : void
      {
         this.delay = param1;
         this.Renamed4948.width = param2;
         this.Renamed4948.height = param3;
         this.Renamed4948.calculateBounds();
         this.Renamed4948.rotation = param4;
         this.Renamed4944 = param5;
         this.Renamed4949 = param6;
         this.Renamed4945 = param7;
         this.x = param8;
         this.y = param9;
         this.z = param10;
         this.object = param11;
         this.Renamed4948.material = param12;
         this.Renamed4948.softAttenuation = 150;
         this.Renamed4948.depthMapAlphaThreshold = 2;
         this.Renamed4948.shadowMapAlphaThreshold = 2;
         this.Renamed4948.useShadowMap = false;
         this.Renamed4948.useLight = false;
         this.Renamed4948.blendMode = param13;
         this.Renamed4948.alpha = 0;
         this.time = 0;
      }
      
      public function Renamed1411(param1:Renamed908) : void
      {
         this.container = param1;
         param1.addChild(this.Renamed4948);
      }
      
      public function play(param1:int, param2:Renamed842) : Boolean
      {
         var _loc3_:Number = NaN;
         if(this.z >= this.Renamed4944)
         {
            return false;
         }
         this.Renamed4948.x = this.object.x + this.x;
         this.Renamed4948.y = this.object.y + this.y;
         this.Renamed4948.z = this.object.z + this.z;
         this.time += param1;
         if(this.time >= this.delay)
         {
            this.z += this.Renamed4944 * this.Renamed4945 * param1 * 0.001;
            if(this.z < this.Renamed4949)
            {
               this.Renamed4948.alpha = this.z / this.Renamed4949;
            }
            else
            {
               _loc3_ = (this.z - this.Renamed4949) / (this.Renamed4944 - this.Renamed4949);
               this.Renamed4948.alpha = 1 - _loc3_ * _loc3_ * _loc3_ * _loc3_ * _loc3_ * _loc3_ * _loc3_ * _loc3_;
            }
            if(this.Renamed4948.alpha < 0)
            {
               this.Renamed4948.alpha = 0;
            }
            if(this.Renamed4948.alpha > 1)
            {
               this.Renamed4948.alpha = 1;
            }
         }
         else
         {
            this.Renamed4948.alpha = 0;
         }
         return true;
      }
      
      public function destroy() : void
      {
         this.container.removeChild(this.Renamed4948);
         this.container = null;
         this.Renamed4948.material = null;
         recycle();
      }
      
      public function kill() : void
      {
         this.z = this.Renamed4944;
         this.Renamed4948.alpha = 0;
      }
   }
}

