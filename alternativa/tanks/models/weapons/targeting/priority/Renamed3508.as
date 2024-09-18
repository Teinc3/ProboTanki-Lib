package alternativa.tanks.models.weapons.targeting.priority
{
   import Renamed3505.Renamed3532;
   import alternativa.physics.Body;
   import alternativa.physics.collision.types.RayHit;
   import Renamed439.Renamed3533;
   
   public class Renamed3508
   {
      private var Renamed3534:Renamed3532;
      
      private var Renamed3535:Number;
      
      public function Renamed3508(param1:Renamed3532, param2:Number = 0)
      {
         super();
         this.Renamed3534 = param1;
         this.Renamed3535 = param2;
      }
      
      public function Renamed3536(param1:Number, param2:Vector.<Renamed3533>) : Number
      {
         var _loc3_:Renamed3533 = null;
         var _loc4_:Number = 0;
         var _loc5_:int = int(param2.length - 1);
         while(_loc5_ >= 0)
         {
            _loc3_ = param2[_loc5_];
            _loc4_ = Math.max(this.Renamed3537(_loc3_,param1) + this.Renamed3535 * _loc4_,_loc4_);
            _loc5_--;
         }
         return _loc4_;
      }
      
      private function Renamed3537(param1:Renamed3533, param2:Number) : Number
      {
         return this.Renamed3534.Renamed3385(param1.getTank(),param1.Renamed3429(),param2);
      }
      
      public function Renamed3525(param1:Number, param2:Vector.<RayHit>) : Number
      {
         var _loc3_:RayHit = null;
         var _loc4_:Number = 1;
         var _loc5_:Number = 0;
         for each(_loc3_ in param2)
         {
            _loc5_ += this.Renamed3538(param1,_loc3_) * _loc4_;
            _loc4_ *= this.Renamed3535;
         }
         return _loc5_;
      }
      
      private function Renamed3538(param1:Number, param2:RayHit) : Number
      {
         var _loc3_:Body = param2.shape.body;
         if(param2.staticHit)
         {
            return 0;
         }
         return this.Renamed3534.Renamed3385(_loc3_.tank,param2.t,param1);
      }
   }
}

