package Renamed194
{
   public class TargetTankDamage
   {
      private var _damageAmount:Number;
      
      private var _damageType:DamageType;
      
      private var _target:String;
      
      public function TargetTankDamage(param1:Number = 0, param2:DamageType = null, param3:String = null)
      {
         super();
         this._damageAmount = param1;
         this._damageType = param2;
         this._target = param3;
      }
      
      public function get damageAmount() : Number
      {
         return this._damageAmount;
      }
      
      public function set damageAmount(param1:Number) : void
      {
         this._damageAmount = param1;
      }
      
      public function get damageType() : DamageType
      {
         return this._damageType;
      }
      
      public function set damageType(param1:DamageType) : void
      {
         this._damageType = param1;
      }
      
      public function get target() : String
      {
         return this._target;
      }
      
      public function set target(param1:String) : void
      {
         this._target = param1;
      }
      
      public function toString() : String
      {
         var _loc1_:String = "TargetTankDamage [";
         _loc1_ += "damageAmount = " + this.damageAmount + " ";
         _loc1_ += "damageIndicatorType = " + this.damageType + " ";
         _loc1_ += "target = " + this.target + " ";
         return _loc1_ + "]";
      }
   }
}

