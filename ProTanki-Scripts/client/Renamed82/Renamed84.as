package Renamed82
{
   public class Renamed84
   {
      private var _capacity:Number;
      
      private var Renamed10344:Number;
      
      private var Renamed10345:int;
      
      private var Renamed6808:Number;
      
      private var Renamed10346:Number;
      
      private var Renamed10347:Number;
      
      private var Renamed10348:Number;
      
      private var _radius:Number;
      
      public function Renamed84(param1:Number = 0, param2:Number = 0, param3:int = 0, param4:Number = 0, param5:Number = 0, param6:Number = 0, param7:Number = 0, param8:Number = 0)
      {
         super();
         this._capacity = param1;
         this.Renamed10344 = param2;
         this.Renamed10345 = param3;
         this.Renamed6808 = param4;
         this.Renamed10346 = param5;
         this.Renamed10347 = param6;
         this.Renamed10348 = param7;
         this._radius = param8;
      }
      
      public function get capacity() : Number
      {
         return this._capacity;
      }
      
      public function set capacity(param1:Number) : void
      {
         this._capacity = param1;
      }
      
      public function get chargeRate() : Number
      {
         return this.Renamed10344;
      }
      
      public function set chargeRate(param1:Number) : void
      {
         this.Renamed10344 = param1;
      }
      
      public function get checkPeriodMsec() : int
      {
         return this.Renamed10345;
      }
      
      public function set checkPeriodMsec(param1:int) : void
      {
         this.Renamed10345 = param1;
      }
      
      public function get coneAngle() : Number
      {
         return this.Renamed6808;
      }
      
      public function set coneAngle(param1:Number) : void
      {
         this.Renamed6808 = param1;
      }
      
      public function get dischargeDamageRate() : Number
      {
         return this.Renamed10346;
      }
      
      public function set dischargeDamageRate(param1:Number) : void
      {
         this.Renamed10346 = param1;
      }
      
      public function get dischargeHealingRate() : Number
      {
         return this.Renamed10347;
      }
      
      public function set dischargeHealingRate(param1:Number) : void
      {
         this.Renamed10347 = param1;
      }
      
      public function get dischargeIdleRate() : Number
      {
         return this.Renamed10348;
      }
      
      public function set dischargeIdleRate(param1:Number) : void
      {
         this.Renamed10348 = param1;
      }
      
      public function get radius() : Number
      {
         return this._radius;
      }
      
      public function set radius(param1:Number) : void
      {
         this._radius = param1;
      }
      
      public function toString() : String
      {
         var _loc1_:String = "IsisCC [";
         _loc1_ += "capacity = " + this.capacity + " ";
         _loc1_ += "chargeRate = " + this.chargeRate + " ";
         _loc1_ += "checkPeriodMsec = " + this.checkPeriodMsec + " ";
         _loc1_ += "coneAngle = " + this.coneAngle + " ";
         _loc1_ += "dischargeDamageRate = " + this.dischargeDamageRate + " ";
         _loc1_ += "dischargeHealingRate = " + this.dischargeHealingRate + " ";
         _loc1_ += "dischargeIdleRate = " + this.dischargeIdleRate + " ";
         _loc1_ += "radius = " + this.radius + " ";
         return _loc1_ + "]";
      }
   }
}

