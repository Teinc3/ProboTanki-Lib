package alternativa.tanks.camera
{
   import alternativa.engine3d.core.Camera3D;
   import alternativa.math.Matrix3;
   import alternativa.math.Vector3;
   import alternativa.tanks.battle.scene3d.Renamed1334;
   
   public class Renamed842 extends Camera3D
   {
      private static const m:Matrix3 = new Matrix3();
      
      public var position:Vector3;
      
      public var Renamed594:Vector3;
      
      public var Renamed595:Vector3;
      
      public var Renamed596:Vector3;
      
      public function Renamed842()
      {
         this.position = new Vector3();
         this.Renamed594 = new Vector3();
         this.Renamed595 = new Vector3();
         this.Renamed596 = new Vector3();
         super();
         nearClipping = 40;
         farClipping = 200000;
         z = 10000;
         rotationX = -0.01;
         diagramVerticalMargin = 35;
      }
      
      public function Renamed1413() : void
      {
         var _loc1_:Number = NaN;
         var _loc2_:Number = Math.cos(rotationX);
         var _loc3_:Number = Math.sin(rotationX);
         var _loc4_:Number = Math.cos(rotationY);
         var _loc5_:Number = Math.sin(rotationY);
         _loc1_ = Math.cos(rotationZ);
         var _loc6_:Number = Math.sin(rotationZ);
         var _loc7_:Number = _loc1_ * _loc5_;
         var _loc8_:Number = _loc6_ * _loc5_;
         this.Renamed594.x = _loc1_ * _loc4_;
         this.Renamed595.x = _loc7_ * _loc3_ - _loc6_ * _loc2_;
         this.Renamed596.x = _loc7_ * _loc2_ + _loc6_ * _loc3_;
         this.Renamed594.y = _loc6_ * _loc4_;
         this.Renamed595.y = _loc8_ * _loc3_ + _loc1_ * _loc2_;
         this.Renamed596.y = _loc8_ * _loc2_ - _loc1_ * _loc3_;
         this.Renamed594.z = -_loc5_;
         this.Renamed595.z = _loc4_ * _loc3_;
         this.Renamed596.z = _loc4_ * _loc2_;
         this.position.x = x;
         this.position.y = y;
         this.position.z = z;
      }
      
      public function Renamed1479(param1:Vector3, param2:Vector3) : void
      {
         m.setRotationMatrix(rotationX,rotationY,rotationZ);
         m.transformVector(param1,param2);
      }
      
      public function Renamed1480(param1:Vector3, param2:Vector3) : void
      {
         m.setRotationMatrix(rotationX,rotationY,rotationZ);
         m.transformVectorInverse(param1,param2);
      }
      
      public function setPosition(param1:Vector3) : void
      {
         x = param1.x;
         y = param1.y;
         z = param1.z;
      }
      
      public function Renamed743() : void
      {
         fov = Renamed1334.Renamed1339(view.width,view.height);
      }
   }
}

