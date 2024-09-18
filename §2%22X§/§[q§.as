package §2"X§
{
   public class §[q§
   {
      private var §%"_§:Number;
      
      private var §`L§:Number;
      
      private var §get function§:int;
      
      public function §[q§(param1:Number = 0, param2:Number = 0, param3:int = 0)
      {
         super();
         this.§%"_§ = param1;
         this.§`L§ = param2;
         this.§get function§ = param3;
      }
      
      public function get coneHorizontalAngle() : Number
      {
         return this.§%"_§;
      }
      
      public function set coneHorizontalAngle(param1:Number) : void
      {
         this.§%"_§ = param1;
      }
      
      public function get coneVerticalAngle() : Number
      {
         return this.§`L§;
      }
      
      public function set coneVerticalAngle(param1:Number) : void
      {
         this.§`L§ = param1;
      }
      
      public function get pelletCount() : int
      {
         return this.§get function§;
      }
      
      public function set pelletCount(param1:int) : void
      {
         this.§get function§ = param1;
      }
      
      public function toString() : String
      {
         var _loc1_:String = "ShotGunAimingCC [";
         _loc1_ += "coneHorizontalAngle = " + this.coneHorizontalAngle + " ";
         _loc1_ += "coneVerticalAngle = " + this.coneVerticalAngle + " ";
         _loc1_ += "pelletCount = " + this.pelletCount + " ";
         return _loc1_ + "]";
      }
   }
}

