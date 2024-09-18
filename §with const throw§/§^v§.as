package §with const throw§
{
   public class §^v§
   {
      private var §<#P§:Number;
      
      private var §`#H§:int;
      
      public function §^v§(param1:Number = 0, param2:int = 0)
      {
         super();
         this.§<#P§ = param1;
         this.§`#H§ = param2;
      }
      
      public function get angle() : Number
      {
         return this.§<#P§;
      }
      
      public function set angle(param1:Number) : void
      {
         this.§<#P§ = param1;
      }
      
      public function get control() : int
      {
         return this.§`#H§;
      }
      
      public function set control(param1:int) : void
      {
         this.§`#H§ = param1;
      }
      
      public function toString() : String
      {
         var _loc1_:String = "RotateTurretCommand [";
         _loc1_ += "angle = " + this.angle + " ";
         _loc1_ += "control = " + this.control + " ";
         return _loc1_ + "]";
      }
   }
}

