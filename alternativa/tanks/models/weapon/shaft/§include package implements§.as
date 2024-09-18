package alternativa.tanks.models.weapon.shaft
{
   import §]#R§.§try set for§;
   import alternativa.tanks.battle.§;!t§;
   import alternativa.tanks.battle.§else package false§;
   import com.alternativaplatform.projects.tanks.client.commons.types.TankSpecification;
   import §while const const§.§^"x§;
   
   public class §include package implements§ extends §else package false§ implements §;!t§
   {
      private var §?"@§:§^"x§;
      
      private var time:int;
      
      private var §-!R§:Boolean;
      
      private var §finally for var§:§try set for§;
      
      private var §^"g§:Number;
      
      private var §include default§:TankSpecification;
      
      public function §include package implements§(param1:§^"x§, param2:§try set for§, param3:TankSpecification)
      {
         super();
         this.§?"@§ = param1;
         this.§finally for var§ = param2;
         this.§include default§ = param3;
         this.§-!R§ = false;
         this.time = 0;
      }
      
      public function start() : void
      {
         §'x§().§%#9§(this);
         this.§^"g§ = this.§finally for var§.getTurnAcceleration();
      }
      
      public function stop() : void
      {
         §'x§().§%"7§(this);
         this.§-!R§ = true;
         this.§finally for var§.setMaxTurnSpeed(this.§include default§.turretRotationSpeed,true);
         this.§finally for var§.setTurnAcceleration(this.§^"g§);
      }
      
      public function §var package implements§(param1:int, param2:int) : void
      {
         var _loc3_:Number = NaN;
         if(!this.§-!R§)
         {
            this.time += param2;
            _loc3_ = this.§?"@§.§!§ * (this.time + this.§?"@§.targetingTransitionTime) / 1000 / this.§?"@§.§]!n§;
            if(_loc3_ > 1)
            {
               _loc3_ = 1;
            }
            this.§finally for var§.setMaxTurnSpeed(this.§false const if§(_loc3_) * this.§?"@§.§="S§ * this.§finally for var§.getTurnAcceleration(),false);
            this.§finally for var§.setTurnAcceleration(this.§?"@§.targetingAcceleration);
         }
      }
      
      private function §false const if§(param1:Number) : Number
      {
         var _loc2_:Number = this.§?"@§.rotationCoeffT1;
         if(param1 < _loc2_)
         {
            return 1;
         }
         var _loc3_:Number = this.§?"@§.rotationCoeffT2;
         var _loc4_:Number = this.§?"@§.rotationCoeffKmin;
         if(param1 < _loc3_)
         {
            return 1 - (1 - _loc4_) * (param1 - _loc2_) / (_loc3_ - _loc2_);
         }
         return _loc4_;
      }
   }
}

