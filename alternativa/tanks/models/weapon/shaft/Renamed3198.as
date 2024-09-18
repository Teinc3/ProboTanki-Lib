package alternativa.tanks.models.weapon.shaft
{
   import Renamed479.Renamed915;
   import alternativa.tanks.battle.Renamed768;
   import alternativa.tanks.battle.Renamed832;
   import com.alternativaplatform.projects.tanks.client.commons.types.TankSpecification;
   import Renamed94.Renamed96;
   
   public class Renamed3198 extends Renamed832 implements Renamed768
   {
      private var Renamed3196:Renamed96;
      
      private var time:int;
      
      private var Renamed3363:Boolean;
      
      private var Renamed991:Renamed915;
      
      private var Renamed3364:Number;
      
      private var Renamed3365:TankSpecification;
      
      public function Renamed3198(param1:Renamed96, param2:Renamed915, param3:TankSpecification)
      {
         super();
         this.Renamed3196 = param1;
         this.Renamed991 = param2;
         this.Renamed3365 = param3;
         this.Renamed3363 = false;
         this.time = 0;
      }
      
      public function start() : void
      {
         Renamed619().Renamed815(this);
         this.Renamed3364 = this.Renamed991.getTurnAcceleration();
      }
      
      public function stop() : void
      {
         Renamed619().Renamed816(this);
         this.Renamed3363 = true;
         this.Renamed991.setMaxTurnSpeed(this.Renamed3365.turretRotationSpeed,true);
         this.Renamed991.setTurnAcceleration(this.Renamed3364);
      }
      
      public function Renamed769(param1:int, param2:int) : void
      {
         var _loc3_:Number = NaN;
         if(!this.Renamed3363)
         {
            this.time += param2;
            _loc3_ = this.Renamed3196.Renamed126 * (this.time + this.Renamed3196.targetingTransitionTime) / 1000 / this.Renamed3196.Renamed129;
            if(_loc3_ > 1)
            {
               _loc3_ = 1;
            }
            this.Renamed991.setMaxTurnSpeed(this.Renamed3366(_loc3_) * this.Renamed3196.Renamed127 * this.Renamed991.getTurnAcceleration(),false);
            this.Renamed991.setTurnAcceleration(this.Renamed3196.targetingAcceleration);
         }
      }
      
      private function Renamed3366(param1:Number) : Number
      {
         var _loc2_:Number = this.Renamed3196.rotationCoeffT1;
         if(param1 < _loc2_)
         {
            return 1;
         }
         var _loc3_:Number = this.Renamed3196.rotationCoeffT2;
         var _loc4_:Number = this.Renamed3196.rotationCoeffKmin;
         if(param1 < _loc3_)
         {
            return 1 - (1 - _loc4_) * (param1 - _loc2_) / (_loc3_ - _loc2_);
         }
         return _loc4_;
      }
   }
}

