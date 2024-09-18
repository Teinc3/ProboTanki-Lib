package alternativa.tanks.models.weapons.targeting
{
   import Renamed258.Renamed3513;
   import Renamed278.Renamed3514;
   import Renamed278.Renamed3515;
   import alternativa.physics.collision.types.RayHit;
   import alternativa.tanks.models.weapon.Renamed664;
   import alternativa.tanks.models.weapons.targeting.priority.Renamed3508;
   import Renamed327.Renamed3516;
   
   public class Renamed3071
   {
      private static const Renamed3517:Renamed3516 = new Renamed3516();
      
      private var Renamed3518:Renamed3514;
      
      private var Renamed3519:Renamed3508;
      
      private var Renamed3520:Renamed3513;
      
      private var result:Renamed3072;
      
      public function Renamed3071(param1:Renamed3514, param2:Renamed3513, param3:Renamed3508)
      {
         this.result = new Renamed3072();
         super();
         this.Renamed3518 = param1;
         this.Renamed3520 = param2;
         this.Renamed3519 = param3;
      }
      
      public function Renamed3521() : Renamed3513
      {
         return this.Renamed3520;
      }
      
      public function target(param1:Renamed664) : Renamed3072
      {
         var _loc2_:Renamed3515 = null;
         var _loc3_:Vector.<RayHit> = null;
         var _loc4_:Number = NaN;
         var _loc5_:Vector.<Renamed3515> = this.Renamed3518.Renamed3522(param1);
         _loc5_.push(new Renamed3515(param1.direction,0,0));
         _loc5_.sort(Renamed3515.comparator);
         var _loc6_:Number = Number.NEGATIVE_INFINITY;
         Renamed3517.reset();
         for each(_loc2_ in _loc5_)
         {
            if(_loc2_.Renamed3523() < _loc6_)
            {
               break;
            }
            _loc3_ = this.Renamed3520.Renamed3524(param1,_loc2_.Renamed1013());
            _loc4_ = this.Renamed3519.Renamed3525(_loc2_.Renamed3526(),_loc3_);
            if(_loc4_ > 0)
            {
               _loc4_ += _loc2_.Renamed3527();
            }
            if(_loc4_ > _loc6_ || _loc4_ == _loc6_ && _loc2_.Renamed3526() == 0)
            {
               _loc6_ = _loc4_;
               this.result.Renamed3528(_loc2_.Renamed1013(),_loc3_);
            }
         }
         return this.result;
      }
   }
}

