package Renamed1
{
   import alternativa.math.Vector3;
   import alternativa.tanks.camera.Renamed842;
   import Renamed356.Renamed1443;
   
   public class Renamed7022 extends Renamed7004
   {
      private static const Renamed1519:Number = 3000;
      
      private static const Renamed7023:Number = 1 / 5000;
      
      private static const v:Vector3 = new Vector3();
      
      public function Renamed7022(param1:Renamed1443)
      {
         super(param1);
      }
      
      override public function play(param1:int, param2:Renamed842) : Boolean
      {
         var _loc3_:Number = NaN;
         var _loc4_:Boolean = super.play(param1,param2);
         if(_loc4_)
         {
            v.reset(Renamed5093.x,Renamed5093.y,Renamed5093.z);
            _loc3_ = param2.position.distanceTo(v);
            if(_loc3_ > Renamed1519)
            {
               scale += _loc3_ * Renamed7023;
            }
            return true;
         }
         return false;
      }
   }
}

