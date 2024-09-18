package Renamed1
{
   import alternativa.engine3d.core.Object3D;
   import alternativa.math.Vector3;
   import alternativa.tanks.camera.Renamed842;
   import Renamed356.Renamed1443;
   import Renamed356.Renamed1444;
   
   public class Renamed7009 extends Renamed1444 implements Renamed6901
   {
      private var normal:Vector3;
      
      private var position:Vector3;
      
      private var distance:Number;
      
      private var Renamed7010:Vector3;
      
      public function Renamed7009(param1:Renamed1443)
      {
         this.normal = new Vector3();
         this.position = new Vector3();
         this.Renamed7010 = new Vector3();
         super(param1);
      }
      
      public function init(param1:Vector3, param2:Vector3, param3:Number) : void
      {
         this.position.copy(param1);
         this.normal.copy(param2);
         this.distance = param3;
         this.normal.normalize();
         this.compute();
      }
      
      private function compute() : void
      {
         this.Renamed7010.copy(this.normal);
         this.Renamed7010.scale(this.distance);
         this.Renamed7010.add(this.position);
      }
      
      public function Renamed6904(param1:Object3D) : void
      {
         param1.x = this.Renamed7010.x;
         param1.y = this.Renamed7010.y;
         param1.z = this.Renamed7010.z;
      }
      
      public function Renamed6905(param1:Object3D, param2:Renamed842, param3:int) : void
      {
         this.Renamed6904(param1);
      }
      
      public function destroy() : void
      {
         recycle();
      }
   }
}

