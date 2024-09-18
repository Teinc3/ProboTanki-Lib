package alternativa.tanks.models.tank
{
   import Renamed602.Renamed603;
   import alternativa.math.Vector3;
   import Renamed461.Renamed2772;
   
   public class Renamed2732
   {
      private static const nearDistance:Number = 30;
      
      private static const Renamed2989:Number = nearDistance * nearDistance;
      
      private static const Renamed2990:Number = 50;
      
      private static const Renamed2991:Number = Renamed2990 * Renamed2990;
      
      private static const Renamed2992:Number = 4;
      
      private static const Renamed2993:Number = Renamed2992 / 180 * Math.PI;
      
      private static const Renamed2994:Number = 10;
      
      private static const Renamed2995:Number = Renamed2994 / 180 * Math.PI;
      
      public function Renamed2732()
      {
         super();
      }
      
      public static function Renamed2936(param1:Renamed2772, param2:Renamed2772) : void
      {
         Renamed680(param1.angularVelocity,param2.angularVelocity);
         Renamed680(param1.Renamed2904,param2.Renamed2904);
         Renamed680(param1.orientation,param2.orientation);
         Renamed680(param1.position,param2.position);
         param2.control = param1.control;
      }
      
      public static function Renamed680(param1:Renamed603, param2:Renamed603) : void
      {
         param2.x = param1.x;
         param2.y = param1.y;
         param2.z = param1.z;
      }
      
      public static function Renamed2733(param1:Vector3, param2:Renamed603) : Number
      {
         var _loc3_:Number = param1.x - param2.x;
         var _loc4_:Number = param1.y - param2.y;
         var _loc5_:Number = param1.z - param2.z;
         return _loc3_ * _loc3_ + _loc4_ * _loc4_ + _loc5_ * _loc5_;
      }
      
      public static function Renamed2937(param1:Renamed2772, param2:Renamed2772) : Boolean
      {
         return Renamed2996(param1,param2) && Renamed2997(param1,param2) && Renamed2998(param1,param2) && Renamed2999(param1,param2);
      }
      
      private static function Renamed2996(param1:Renamed2772, param2:Renamed2772) : Boolean
      {
         return Renamed3000(param1.position,param2.position) < Renamed2989;
      }
      
      private static function Renamed2998(param1:Renamed2772, param2:Renamed2772) : Boolean
      {
         return Renamed3000(param1.Renamed2904,param2.Renamed2904) < Renamed2991;
      }
      
      private static function Renamed2997(param1:Renamed2772, param2:Renamed2772) : Boolean
      {
         var _loc3_:Renamed603 = param2.orientation;
         var _loc4_:Renamed603 = param1.orientation;
         return Math.abs(_loc4_.x - _loc3_.x) < Renamed2993 && Math.abs(_loc4_.y - _loc3_.y) < Renamed2993 && Math.abs(_loc4_.z - _loc3_.z) < Renamed2993;
      }
      
      private static function Renamed2999(param1:Renamed2772, param2:Renamed2772) : Boolean
      {
         var _loc3_:Renamed603 = param2.angularVelocity;
         var _loc4_:Renamed603 = param1.angularVelocity;
         return Math.abs(_loc4_.x - _loc3_.x) < Renamed2995 && Math.abs(_loc4_.y - _loc3_.y) < Renamed2995 && Math.abs(_loc4_.z - _loc3_.z) < Renamed2995;
      }
      
      private static function Renamed3000(param1:Renamed603, param2:Renamed603) : Number
      {
         var _loc3_:Number = param1.x - param2.x;
         var _loc4_:Number = param1.y - param2.y;
         var _loc5_:Number = param1.z - param2.z;
         return _loc3_ * _loc3_ + _loc4_ * _loc4_ + _loc5_ * _loc5_;
      }
      
      private static function Renamed3001(param1:Renamed603, param2:Renamed603) : Number
      {
         var _loc3_:Number = length(param1);
         var _loc4_:Number = length(param2);
         return (param1.x * param2.x + param1.y * param2.y + param1.z * param2.z) / _loc3_ / _loc4_;
      }
      
      private static function length(param1:Renamed603) : Number
      {
         return Math.sqrt(param1.x * param1.x + param1.y * param1.y + param1.z * param1.z);
      }
      
      public static function Renamed3002(param1:Renamed2772, param2:Renamed2772) : String
      {
         return Renamed3003(param1,param2) + " " + Renamed3004(param1,param2) + " " + Renamed3005(param1,param2) + " " + Renamed3006(param1,param2) + " " + Renamed3007(param1,param2);
      }
      
      private static function Renamed3007(param1:Renamed2772, param2:Renamed2772) : String
      {
         return (Renamed2996(param1,param2) ? "T" : "F") + (Renamed2997(param1,param2) ? "T" : "F") + (Renamed2998(param1,param2) ? "T" : "F") + (Renamed2999(param1,param2) ? "T" : "F");
      }
      
      private static function Renamed3003(param1:Renamed2772, param2:Renamed2772) : String
      {
         return "dist: [" + Renamed3000(param1.position,param2.position) + "/" + Renamed2989 + "]";
      }
      
      private static function Renamed3004(param1:Renamed2772, param2:Renamed2772) : String
      {
         var _loc3_:Renamed603 = param2.orientation;
         var _loc4_:Renamed603 = param1.orientation;
         return "ori: [X:" + Math.abs(_loc4_.x - _loc3_.x) + "/" + Renamed2993 + "];[Y:" + Math.abs(_loc4_.x - _loc3_.x) + "/" + Renamed2993 + "];[Z:" + Math.abs(_loc4_.x - _loc3_.x) + "/" + Renamed2993 + "]";
      }
      
      private static function Renamed3005(param1:Renamed2772, param2:Renamed2772) : String
      {
         return "lV: [" + Renamed3000(param1.Renamed2904,param2.Renamed2904) + "/" + Renamed2991 + "]";
      }
      
      private static function Renamed3006(param1:Renamed2772, param2:Renamed2772) : String
      {
         var _loc3_:Renamed603 = param2.angularVelocity;
         var _loc4_:Renamed603 = param1.angularVelocity;
         return "oV: [X:" + Math.abs(_loc4_.x - _loc3_.x) + "/" + Renamed2995 + "];[Y:" + Math.abs(_loc4_.x - _loc3_.x) + "/" + Renamed2995 + "];[Z:" + Math.abs(_loc4_.x - _loc3_.x) + "/" + Renamed2995 + "]";
      }
   }
}

