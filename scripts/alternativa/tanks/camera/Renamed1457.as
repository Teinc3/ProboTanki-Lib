package alternativa.tanks.camera
{
   import alternativa.math.Vector3;
   
   public class Renamed1457 extends Renamed1458
   {
      public function Renamed1457()
      {
         super();
      }
      
      protected function setPosition(param1:Vector3) : void
      {
         var _loc2_:Renamed842 = Renamed739();
         _loc2_.x = param1.x;
         _loc2_.y = param1.y;
         _loc2_.z = param1.z;
      }
      
      protected function setOrientation(param1:Vector3) : void
      {
         var _loc2_:Renamed842 = null;
         _loc2_ = Renamed739();
         _loc2_.rotationX = param1.x;
         _loc2_.rotationY = param1.y;
         _loc2_.rotationZ = param1.z;
      }
      
      protected function Renamed1459(param1:Number, param2:Number, param3:Number) : void
      {
         var _loc4_:Renamed842 = null;
         _loc4_ = null;
         _loc4_ = Renamed739();
         _loc4_.rotationX += param1;
         _loc4_.rotationY += param2;
         _loc4_.rotationZ += param3;
      }
      
      protected function Renamed1460() : Vector3
      {
         var _loc1_:Renamed842 = Renamed739();
         return _loc1_.position;
      }
      
      protected function Renamed1461() : Number
      {
         var _loc1_:Renamed842 = Renamed739();
         return _loc1_.rotationX;
      }
      
      protected function Renamed1462() : Number
      {
         var _loc1_:Renamed842 = Renamed739();
         return _loc1_.rotationY;
      }
      
      protected function Renamed1463() : Number
      {
         var _loc1_:Renamed842 = Renamed739();
         return _loc1_.rotationZ;
      }
   }
}

