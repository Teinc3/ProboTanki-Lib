package §%3§
{
   public class §=x§
   {
      public static const AT_BASE:§=x§ = new §=x§(0,"AT_BASE");
      
      public static const DROPPED:§=x§ = new §=x§(1,"DROPPED");
      
      public static const CARRIED:§=x§ = new §=x§(2,"CARRIED");
      
      private var _value:int;
      
      private var §for extends§:String;
      
      public function §=x§(param1:int, param2:String)
      {
         super();
         this._value = param1;
         this.§for extends§ = param2;
      }
      
      public function get value() : int
      {
         return this._value;
      }
      
      public function toString() : String
      {
         return "CTFFlagState [" + this.§for extends§ + "]";
      }
   }
}

