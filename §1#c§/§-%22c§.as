package §1#c§
{
   public class §-"c§
   {
      private var §try for dynamic§:int;
      
      private var §@!Q§:int;
      
      private var §7+§:Boolean;
      
      private var _state:Number;
      
      private var §+e§:int;
      
      private var §]"x§:Number;
      
      public function §-"c§(param1:int = 0, param2:int = 0, param3:Boolean = false, param4:Number = 0, param5:int = 0, param6:Number = 0)
      {
         super();
         this.§try for dynamic§ = param1;
         this.§@!Q§ = param2;
         this.§7+§ = param3;
         this._state = param4;
         this.§+e§ = param5;
         this.§]"x§ = param6;
      }
      
      public function get spinDownTime() : int
      {
         return this.§try for dynamic§;
      }
      
      public function set spinDownTime(param1:int) : void
      {
         this.§try for dynamic§ = param1;
      }
      
      public function get spinUpTime() : int
      {
         return this.§@!Q§;
      }
      
      public function set spinUpTime(param1:int) : void
      {
         this.§@!Q§ = param1;
      }
      
      public function get started() : Boolean
      {
         return this.§7+§;
      }
      
      public function set started(param1:Boolean) : void
      {
         this.§7+§ = param1;
      }
      
      public function get state() : Number
      {
         return this._state;
      }
      
      public function set state(param1:Number) : void
      {
         this._state = param1;
      }
      
      public function get temperatureHittingTime() : int
      {
         return this.§+e§;
      }
      
      public function set temperatureHittingTime(param1:int) : void
      {
         this.§+e§ = param1;
      }
      
      public function get weaponTurnDecelerationCoeff() : Number
      {
         return this.§]"x§;
      }
      
      public function set weaponTurnDecelerationCoeff(param1:Number) : void
      {
         this.§]"x§ = param1;
      }
      
      public function toString() : String
      {
         var _loc1_:String = "MachineGunCC [";
         _loc1_ += "spinDownTime = " + this.spinDownTime + " ";
         _loc1_ += "spinUpTime = " + this.spinUpTime + " ";
         _loc1_ += "started = " + this.started + " ";
         _loc1_ += "state = " + this.state + " ";
         _loc1_ += "temperatureHittingTime = " + this.temperatureHittingTime + " ";
         _loc1_ += "weaponTurnDecelerationCoeff = " + this.weaponTurnDecelerationCoeff + " ";
         return _loc1_ + "]";
      }
   }
}

