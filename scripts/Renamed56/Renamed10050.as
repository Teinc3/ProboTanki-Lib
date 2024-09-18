package Renamed56
{
   import Renamed211.Renamed908;
   import Renamed1.Renamed7018;
   import Renamed1.Renamed609;
   import alternativa.engine3d.core.Object3D;
   import alternativa.engine3d.materials.TextureMaterial;
   import alternativa.engine3d.objects.Sprite3D;
   import alternativa.math.Matrix4;
   import alternativa.math.Vector3;
   import alternativa.tanks.camera.Renamed842;
   import alternativa.tanks.engine3d.Renamed843;
   import alternativa.tanks.engine3d.Renamed1650;
   import Renamed356.Renamed1443;
   import Renamed356.Renamed1444;
   
   public class Renamed10050 extends Renamed1444 implements Renamed609
   {
      private static const Renamed7027:Vector3 = new Vector3();
      
      private static const matrix:Matrix4 = new Matrix4();
      
      protected var sprite:Sprite3D;
      
      private var Renamed10051:Number;
      
      private var Renamed3392:Number;
      
      private var Renamed1652:Vector.<Renamed1650>;
      
      private var numFrames:int;
      
      private var Renamed6990:Vector3;
      
      private var turret:Object3D;
      
      private var listener:Renamed7018;
      
      private var container:Renamed908;
      
      public function Renamed10050(param1:Renamed1443)
      {
         this.Renamed6990 = new Vector3();
         super(param1);
         this.sprite = new Sprite3D(1,1);
         this.sprite.useShadowMap = false;
         this.sprite.useLight = false;
      }
      
      public function init(param1:Number, param2:Number, param3:Renamed843, param4:Vector3, param5:Object3D, param6:Number, param7:Number, param8:Renamed7018) : void
      {
         this.Renamed6933(param1,param2,param6,param3.material);
         this.Renamed1652 = param3.Renamed1652;
         this.Renamed10051 = 0.001 * param7;
         this.Renamed6990.copy(param4);
         this.Renamed6990.y += 10;
         this.turret = param5;
         this.listener = param8;
         this.numFrames = this.Renamed1652.length;
         this.Renamed3392 = 0;
      }
      
      public function Renamed1411(param1:Renamed908) : void
      {
         this.container = param1;
         param1.addChild(this.sprite);
      }
      
      public function play(param1:int, param2:Renamed842) : Boolean
      {
         if(this.Renamed3392 >= this.numFrames)
         {
            return false;
         }
         matrix.setMatrix(this.turret.x,this.turret.y,this.turret.z,this.turret.rotationX,this.turret.rotationY,this.turret.rotationZ);
         matrix.transformVector(this.Renamed6990,Renamed7027);
         this.sprite.x = Renamed7027.x;
         this.sprite.y = Renamed7027.y;
         this.sprite.z = Renamed7027.z;
         this.Renamed1655(this.Renamed1652[int(this.Renamed3392)]);
         this.Renamed3392 += this.Renamed10051 * param1;
         return true;
      }
      
      private function Renamed1655(param1:Renamed1650) : void
      {
         this.sprite.topLeftU = param1.topLeftU;
         this.sprite.topLeftV = param1.topLeftV;
         this.sprite.bottomRightU = param1.bottomRightU;
         this.sprite.bottomRightV = param1.bottomRightV;
      }
      
      public function destroy() : void
      {
         this.listener.Renamed7019(this);
         this.listener = null;
         this.container.removeChild(this.sprite);
         this.sprite.material = null;
         this.Renamed1652 = null;
         recycle();
      }
      
      public function kill() : void
      {
         this.Renamed3392 = this.numFrames + 1;
      }
      
      private function Renamed6933(param1:Number, param2:Number, param3:Number, param4:TextureMaterial) : void
      {
         this.sprite.width = param1;
         this.sprite.height = param2;
         this.sprite.rotation = param3;
         this.sprite.material = param4;
      }
   }
}

