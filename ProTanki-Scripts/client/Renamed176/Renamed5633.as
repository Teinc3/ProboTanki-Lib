package Renamed4622
{
   public class Renamed5630
   {
      private var Renamed5631:Vector.<Renamed5632>;
      
      public function Renamed5630(param1:Vector.<Renamed5632> = null)
      {
         super();
         this.Renamed5631 = param1;
      }
      
      public function get effects() : Vector.<Renamed5632>
      {
         return this.Renamed5631;
      }
      
      public function set effects(param1:Vector.<Renamed5632>) : void
      {
         this.Renamed5631 = param1;
      }
      
      public function toString() : String
      {
         var _loc1_:String = "LightingSFXModelCC [";
         _loc1_ += "effects = " + this.effects + " ";
         return _loc1_ + "]";
      }
   }
}

