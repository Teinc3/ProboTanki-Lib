package Renamed23
{
   public class Renamed24
   {
      private var Renamed6468:int;
      
      private var Renamed6469:int;
      
      private var Renamed6470:Boolean;
      
      private var _state:Number;
      
      private var Renamed6471:int;
      
      private var Renamed6472:Number;
      
      public function Renamed24(param1:int = 0, param2:int = 0, param3:Boolean = false, param4:Number = 0, param5:int = 0, param6:Number = 0)
      {
         super();
         this.Renamed6468 = param1;
         this.Renamed6469 = param2;
         this.Renamed6470 = param3;
         this._state = param4;
         this.Renamed6471 = param5;
         this.Renamed6472 = param6;
      }
      
      public function get spinDownTime() : int
      {
         return this.Renamed6468;
      }
      
      public function set spinDownTime(param1:int) : void
      {
         this.Renamed6468 = param1;
      }
      
      public function get spinUpTime() : int
      {
         return this.Renamed6469;
      }
      
      public function set spinUpTime(param1:int) : void
      {
         this.Renamed6469 = param1;
      }
      
      public function get started() : Boolean
      {
         return this.Renamed6470;
      }
      
      public function set started(param1:Boolean) : void
      {
         this.Renamed6470 = param1;
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
         return this.Renamed6471;
      }
      
      public function set temperatureHittingTime(param1:int) : void
      {
         this.Renamed6471 = param1;
      }
      
      public function get weaponTurnDecelerationCoeff() : Number
      {
         return this.Renamed6472;
      }
      
      public function set weaponTurnDecelerationCoeff(param1:Number) : void
      {
         this.Renamed6472 = param1;
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

