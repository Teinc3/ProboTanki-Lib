package Renamed194
{
   public class Renamed5920
   {
      private var Renamed5921:Number;
      
      private var Renamed5922:Renamed5918;
      
      private var _target:String;
      
      public function Renamed5920(param1:Number = 0, param2:Renamed5918 = null, param3:String = null)
      {
         super();
         this.Renamed5921 = param1;
         this.Renamed5922 = param2;
         this._target = param3;
      }
      
      public function get Renamed5923() : Number
      {
         return this.Renamed5921;
      }
      
      public function set Renamed5923(param1:Number) : void
      {
         this.Renamed5921 = param1;
      }
      
      public function get Renamed5924() : Renamed5918
      {
         return this.Renamed5922;
      }
      
      public function set Renamed5924(param1:Renamed5918) : void
      {
         this.Renamed5922 = param1;
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
         _loc1_ += "damageAmount = " + this.Renamed5923 + " ";
         _loc1_ += "damageIndicatorType = " + this.Renamed5924 + " ";
         _loc1_ += "target = " + this.target + " ";
         return _loc1_ + "]";
      }
   }
}

