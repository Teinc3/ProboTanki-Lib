package Renamed91
{
   public class Renamed92
   {
      private var Renamed10451:Number;
      
      private var Renamed10452:Number;
      
      private var Renamed10453:Number;
      
      private var Renamed10454:int;
      
      private var Renamed10209:Number;
      
      private var Renamed10455:Number;
      
      private var Renamed10456:Number;
      
      public function Renamed92(param1:Number = 0, param2:Number = 0, param3:Number = 0, param4:int = 0, param5:Number = 0, param6:Number = 0, param7:Number = 0)
      {
         super();
         this.Renamed10451 = param1;
         this.Renamed10452 = param2;
         this.Renamed10453 = param3;
         this.Renamed10454 = param4;
         this.Renamed10209 = param5;
         this.Renamed10455 = param6;
         this.Renamed10456 = param7;
      }
      
      public function get energyCapacity() : Number
      {
         return this.Renamed10451;
      }
      
      public function set energyCapacity(param1:Number) : void
      {
         this.Renamed10451 = param1;
      }
      
      public function get energyPerShot() : Number
      {
         return this.Renamed10452;
      }
      
      public function set energyPerShot(param1:Number) : void
      {
         this.Renamed10452 = param1;
      }
      
      public function get energyRechargeSpeed() : Number
      {
         return this.Renamed10453;
      }
      
      public function set energyRechargeSpeed(param1:Number) : void
      {
         this.Renamed10453 = param1;
      }
      
      public function get maxRicochetCount() : int
      {
         return this.Renamed10454;
      }
      
      public function set maxRicochetCount(param1:int) : void
      {
         this.Renamed10454 = param1;
      }
      
      public function get shellRadius() : Number
      {
         return this.Renamed10209;
      }
      
      public function set shellRadius(param1:Number) : void
      {
         this.Renamed10209 = param1;
      }
      
      public function get shellSpeed() : Number
      {
         return this.Renamed10455;
      }
      
      public function set shellSpeed(param1:Number) : void
      {
         this.Renamed10455 = param1;
      }
      
      public function get shotDistance() : Number
      {
         return this.Renamed10456;
      }
      
      public function set shotDistance(param1:Number) : void
      {
         this.Renamed10456 = param1;
      }
      
      public function toString() : String
      {
         var _loc1_:String = "RicochetCC [";
         _loc1_ += "energyCapacity = " + this.energyCapacity + " ";
         _loc1_ += "energyPerShot = " + this.energyPerShot + " ";
         _loc1_ += "energyRechargeSpeed = " + this.energyRechargeSpeed + " ";
         _loc1_ += "maxRicochetCount = " + this.maxRicochetCount + " ";
         _loc1_ += "shellRadius = " + this.shellRadius + " ";
         _loc1_ += "shellSpeed = " + this.shellSpeed + " ";
         _loc1_ += "shotDistance = " + this.shotDistance + " ";
         return _loc1_ + "]";
      }
   }
}

