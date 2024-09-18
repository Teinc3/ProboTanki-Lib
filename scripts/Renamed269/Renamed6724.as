package Renamed1
{
   import Renamed211.Renamed908;
   import alternativa.engine3d.core.Object3D;
   import alternativa.engine3d.materials.TextureMaterial;
   import alternativa.math.Matrix4;
   import alternativa.math.Vector3;
   import alternativa.tanks.camera.Renamed842;
   import Renamed356.Renamed1443;
   import Renamed356.Renamed1444;
   
   public class Renamed6724 extends Renamed1444 implements Renamed609
   {
      private static const Renamed7012:Vector3 = new Vector3();
      
      private static const Renamed6988:Vector3 = new Vector3();
      
      private static const Renamed1273:Matrix4 = new Matrix4();
      
      private var Renamed5093:Renamed6978;
      
      private var Renamed7013:int;
      
      private var turret:Object3D;
      
      private var Renamed6990:Vector3;
      
      private var container:Renamed908;
      
      public function Renamed6724(param1:Renamed1443)
      {
         this.Renamed6990 = new Vector3();
         super(param1);
         this.Renamed5093 = new Renamed6978(1,1,0.5,0);
         this.Renamed5093.Renamed6980(0,0,0,1,1,1,1,0);
         this.Renamed5093.shadowMapAlphaThreshold = 2;
         this.Renamed5093.depthMapAlphaThreshold = 2;
         this.Renamed5093.useShadowMap = false;
         this.Renamed5093.useLight = false;
      }
      
      public function init(param1:Vector3, param2:Object3D, param3:TextureMaterial, param4:int, param5:Number, param6:Number) : void
      {
         this.Renamed6990.copy(param1);
         this.turret = param2;
         this.Renamed7013 = param4;
         this.Renamed5093.setMaterialToAllFaces(param3);
         this.Renamed5093.width = param5;
         this.Renamed5093.length = param6;
      }
      
      public function play(param1:int, param2:Renamed842) : Boolean
      {
         if(this.Renamed7013 < 0)
         {
            return false;
         }
         this.Renamed7013 -= param1;
         Renamed1273.setMatrix(this.turret.x,this.turret.y,this.turret.z,this.turret.rotationX,this.turret.rotationY,this.turret.rotationZ);
         Renamed1273.transformVector(this.Renamed6990,Renamed6988);
         Renamed1273.getAxis(1,Renamed7012);
         Renamed6378.Renamed6415(this.Renamed5093,Renamed6988,Renamed7012,param2.position);
         return true;
      }
      
      public function destroy() : void
      {
         this.container.removeChild(this.Renamed5093);
         this.container = null;
         this.turret = null;
         recycle();
      }
      
      public function kill() : void
      {
         this.Renamed7013 = -1;
      }
      
      public function Renamed1411(param1:Renamed908) : void
      {
         this.container = param1;
         param1.addChild(this.Renamed5093);
      }
   }
}

