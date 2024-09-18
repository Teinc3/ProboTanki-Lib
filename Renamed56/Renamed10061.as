package Renamed56
{
   import alternativa.math.Vector3;
   
   public class Renamed10058
   {
      private static const Renamed10059:Number = 100000;
      
      public function Renamed10058()
      {
         super();
      }
      
      public static function Renamed10060(param1:Vector3, param2:Vector3) : Vector3
      {
         var _loc3_:Vector3 = param1.clone();
         _loc3_.addScaled(Renamed10058.Renamed10059,param2);
         return _loc3_;
      }
   }
}

