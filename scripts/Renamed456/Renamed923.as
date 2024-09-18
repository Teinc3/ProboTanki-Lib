package Renamed456
{
   import alternativa.engine3d.core.Object3D;
   import alternativa.math.Matrix4;
   import alternativa.math.Vector3;
   
   public class Renamed923
   {
      private var Renamed3412:Vector3;
      
      private var transform:Matrix4;
      
      public function Renamed923(param1:Object3D)
      {
         super();
         this.Renamed3412 = new Vector3(param1.boundMaxX - param1.boundMinX,param1.boundMaxY - param1.boundMinY,param1.boundMaxZ - param1.boundMinZ);
         this.Renamed3412 = this.Renamed3412.scale(0.5);
         this.transform = new Matrix4();
         var _loc2_:Vector3 = new Vector3(param1.boundMaxX + param1.boundMinX,param1.boundMinY + param1.boundMaxY,param1.boundMinZ + param1.boundMaxZ);
         _loc2_.scale(0.5);
         this.transform.setMatrix(_loc2_.x + param1.x,_loc2_.y + param1.y,_loc2_.z + param1.z,param1.rotationX,param1.rotationY,param1.rotationZ);
      }
      
      public function Renamed1046() : Vector3
      {
         return this.Renamed3412;
      }
      
      public function Renamed1100() : Matrix4
      {
         return this.transform;
      }
   }
}

