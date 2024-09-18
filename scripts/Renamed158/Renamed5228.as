package Renamed5227
{
   public class Renamed5228
   {
      private var Renamed5229:Boolean;
      
      private var Renamed5230:Boolean;
      
      public function Renamed5228(param1:Boolean = false, param2:Boolean = false)
      {
         super();
         this.Renamed5229 = param1;
         this.Renamed5230 = param2;
      }
      
      public function get Renamed5231() : Boolean
      {
         return this.Renamed5229;
      }
      
      public function set Renamed5231(param1:Boolean) : void
      {
         this.Renamed5229 = param1;
      }
      
      public function get Renamed5232() : Boolean
      {
         return this.Renamed5230;
      }
      
      public function set Renamed5232(param1:Boolean) : void
      {
         this.Renamed5230 = param1;
      }
      
      public function toString() : String
      {
         var _loc1_:String = "InventoryCC [";
         _loc1_ += "alternativeCooldownsEnabled = " + this.Renamed5231 + " ";
         _loc1_ += "ultimateEnabled = " + this.Renamed5232 + " ";
         return _loc1_ + "]";
      }
   }
}

