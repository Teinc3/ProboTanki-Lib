package Renamed1
{
   import alternativa.engine3d.core.Object3D;
   import alternativa.math.Vector3;
   import alternativa.tanks.camera.Renamed842;
   import Renamed356.Renamed1443;
   import Renamed356.Renamed1444;
   
   public class Renamed7028 extends Renamed1444 implements Renamed6901
   {
      private var position:Vector3;
      
      public function Renamed7028(param1:Renamed1443)
      {
         this.position = new Vector3();
         super(param1);
      }
      
      public function setPosition(param1:Vector3) : void
      {
         this.position.copy(param1);
      }
      
      public function Renamed6904(param1:Object3D) : void
      {
         param1.x = this.position.x;
         param1.y = this.position.y;
         param1.z = this.position.z;
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

