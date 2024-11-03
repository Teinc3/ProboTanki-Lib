package Renamed19
{
   import Renamed211.Renamed908;
   import Renamed1.Renamed609;
   import alternativa.engine3d.core.Object3D;
   import alternativa.engine3d.materials.FillMaterial;
   import alternativa.engine3d.materials.Material;
   import alternativa.engine3d.objects.Mesh;
   import alternativa.engine3d.objects.Sprite3D;
   import alternativa.math.Matrix3;
   import alternativa.math.Matrix4;
   import alternativa.math.Vector3;
   import alternativa.tanks.camera.Renamed842;
   import Renamed356.Renamed1443;
   import Renamed356.Renamed1444;
   import flash.display.BlendMode;
   
   public class Renamed5827 extends Renamed1444 implements Renamed609
   {
      public static const Renamed5839:Number = 120;
      
      private static const Renamed5840:Number = 99.75;
      
      private static const Renamed5841:Number = 79.5;
      
      private static const Renamed5842:Number = 500;
      
      private static const Renamed5843:Number = 1000;
      
      private static const Renamed5844:Number = 1500;
      
      private static const Renamed5845:Number = 1500;
      
      private static const Renamed5846:Number = 2500;
      
      private static const Renamed5847:Number = 1300;
      
      private static const Renamed5848:Vector3 = new Vector3();
      
      private static const direction:Vector3 = new Vector3();
      
      private static const axis:Vector3 = new Vector3();
      
      private static const eulerAngles:Vector3 = new Vector3();
      
      private static const Renamed5849:FillMaterial = new FillMaterial(4294753806);
      
      private static const Renamed1273:Matrix4 = new Matrix4();
      
      private static const Renamed5850:Matrix3 = new Matrix3();
      
      private static const Renamed5851:Matrix3 = new Matrix3();
      
      private var turret:Object3D;
      
      private var Renamed5852:Vector3;
      
      private var Renamed5853:Sprite3D;
      
      private var Renamed5854:Sprite3D;
      
      private var Renamed5855:Sprite3D;
      
      private var Renamed5856:Renamed5832;
      
      private var Renamed5857:Renamed5832;
      
      private var Renamed5858:Renamed5832;
      
      private var Renamed5859:Number = 40;
      
      private var Renamed5860:Number = 75;
      
      private var Renamed5861:Number = 80;
      
      private var Renamed5862:Number = 0;
      
      private var Renamed5863:Number = 0;
      
      private var Renamed5864:Number = 0;
      
      private var Renamed5865:Number;
      
      private var angle2:Number;
      
      private var Renamed5866:Number;
      
      private var Renamed5867:int;
      
      private var container:Renamed908;
      
      public function Renamed5827(param1:Renamed1443)
      {
         super(param1);
         this.Renamed5868();
      }
      
      private static function Renamed5869(param1:Mesh, param2:Number, param3:Vector3, param4:Vector3, param5:Number, param6:Number, param7:Number) : void
      {
         Renamed5850.fromAxisAngle(Vector3.Y_AXIS,param2);
         if(param4.y < -0.99999 || param4.y > 0.99999)
         {
            axis.x = 0;
            axis.y = 0;
            axis.z = 1;
            param2 = param4.y < 0 ? Number(Math.PI) : Number(0);
         }
         else
         {
            axis.x = param4.z;
            axis.y = 0;
            axis.z = -param4.x;
            axis.normalize();
            param2 = Math.acos(param4.y);
         }
         Renamed5851.fromAxisAngle(axis,param2);
         Renamed5850.append(Renamed5851);
         Renamed5850.getEulerAngles(eulerAngles);
         param1.rotationX = eulerAngles.x;
         param1.rotationY = eulerAngles.y;
         param1.rotationZ = eulerAngles.z;
         param1.x = param3.x + param4.x * param5 + param6 * Renamed5850.m00 + param7 * Renamed5850.m02;
         param1.y = param3.y + param4.y * param5 + param6 * Renamed5850.m10 + param7 * Renamed5850.m12;
         param1.z = param3.z + param4.z * param5 + param6 * Renamed5850.m20 + param7 * Renamed5850.m22;
      }
      
      private static function Renamed5870(param1:Number) : Sprite3D
      {
         var _loc2_:Sprite3D = null;
         _loc2_ = new Sprite3D(param1,param1);
         _loc2_.rotation = 2 * Math.PI * Math.random();
         _loc2_.blendMode = BlendMode.SCREEN;
         _loc2_.useShadowMap = false;
         _loc2_.useLight = false;
         return _loc2_;
      }
      
      private static function Renamed5871(param1:Sprite3D, param2:Vector3, param3:Vector3, param4:Number) : void
      {
         param1.x = param2.x + param3.x * param4;
         param1.y = param2.y + param3.y * param4;
         param1.z = param2.z + param3.z * param4;
      }
      
      public function init(param1:Object3D, param2:Vector3, param3:Material) : void
      {
         this.turret = param1;
         this.Renamed5852 = param2;
         this.Renamed5853.material = param3;
         this.Renamed5854.material = param3;
         this.Renamed5855.material = param3;
         this.Renamed5867 = 50;
         this.Renamed5859 = 40;
         this.Renamed5860 = 75;
         this.Renamed5861 = 80;
         this.Renamed5862 = 0;
         this.Renamed5863 = 0;
         this.Renamed5864 = 0;
         this.Renamed5865 = Math.random() * 2 * Math.PI;
         this.angle2 = Math.random() * 2 * Math.PI;
         this.Renamed5866 = Math.random() * 2 * Math.PI;
      }
      
      public function Renamed1411(param1:Renamed908) : void
      {
         this.container = param1;
         param1.addChild(this.Renamed5853);
         param1.addChild(this.Renamed5854);
         param1.addChild(this.Renamed5855);
         param1.addChild(this.Renamed5856);
         param1.addChild(this.Renamed5857);
         param1.addChild(this.Renamed5858);
      }
      
      public function play(param1:int, param2:Renamed842) : Boolean
      {
         if(this.Renamed5867 < 0)
         {
            return false;
         }
         Renamed1273.setMatrix(this.turret.x,this.turret.y,this.turret.z,this.turret.rotationX,this.turret.rotationY,this.turret.rotationZ);
         Renamed1273.transformVector(this.Renamed5852,Renamed5848);
         direction.x = Renamed1273.m01;
         direction.y = Renamed1273.m11;
         direction.z = Renamed1273.m21;
         var _loc3_:Number = 0.001 * param1;
         this.Renamed5862 += _loc3_ * Renamed5845;
         this.Renamed5863 += _loc3_ * Renamed5846;
         this.Renamed5864 += _loc3_ * Renamed5847;
         Renamed5871(this.Renamed5853,Renamed5848,direction,this.Renamed5859);
         Renamed5871(this.Renamed5854,Renamed5848,direction,this.Renamed5860);
         Renamed5871(this.Renamed5855,Renamed5848,direction,this.Renamed5861);
         Renamed5869(this.Renamed5856,this.Renamed5865,Renamed5848,direction,this.Renamed5862,0,10);
         Renamed5869(this.Renamed5857,this.angle2,Renamed5848,direction,this.Renamed5863,-7,0);
         Renamed5869(this.Renamed5858,this.Renamed5866,Renamed5848,direction,this.Renamed5864,7,0);
         this.Renamed5859 += _loc3_ * Renamed5842;
         this.Renamed5860 += _loc3_ * Renamed5843;
         this.Renamed5861 += _loc3_ * Renamed5844;
         this.Renamed5867 -= param1;
         return true;
      }
      
      public function destroy() : void
      {
         this.container.removeChild(this.Renamed5853);
         this.container.removeChild(this.Renamed5854);
         this.container.removeChild(this.Renamed5855);
         this.container.removeChild(this.Renamed5856);
         this.container.removeChild(this.Renamed5858);
         this.container.removeChild(this.Renamed5857);
         this.container = null;
         recycle();
      }
      
      public function kill() : void
      {
         this.Renamed5867 = -1;
      }
      
      private function Renamed5868() : void
      {
         this.Renamed5853 = Renamed5870(Renamed5839);
         this.Renamed5854 = Renamed5870(Renamed5840);
         this.Renamed5855 = Renamed5870(Renamed5841);
         this.Renamed5856 = new Renamed5832(0.8,Renamed5849);
         this.Renamed5857 = new Renamed5832(0.75,Renamed5849);
         this.Renamed5858 = new Renamed5832(0.82,Renamed5849);
      }
   }
}

