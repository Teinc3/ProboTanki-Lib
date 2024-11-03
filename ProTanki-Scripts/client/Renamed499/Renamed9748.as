package Renamed4645
{
   public class Renamed5337
   {
      private var Renamed5638:Number;
      
      private var Renamed5639:Number;
      
      private var Renamed5640:Number;
      
      private var Renamed7564:String;
      
      public function Renamed5337(param1:Number = 0, param2:Number = 0, param3:Number = 0, param4:String = null)
      {
         super();
         this.Renamed5638 = param1;
         this.Renamed5639 = param2;
         this.Renamed5640 = param3;
         this.Renamed7564 = param4;
      }
      
      public function get attenuationBegin() : Number
      {
         return this.Renamed5638;
      }
      
      public function set attenuationBegin(param1:Number) : void
      {
         this.Renamed5638 = param1;
      }
      
      public function get attenuationEnd() : Number
      {
         return this.Renamed5639;
      }
      
      public function set attenuationEnd(param1:Number) : void
      {
         this.Renamed5639 = param1;
      }
      
      public function get intensity() : Number
      {
         return this.Renamed5640;
      }
      
      public function set intensity(param1:Number) : void
      {
         this.Renamed5640 = param1;
      }
      
      public function get lightColor() : String
      {
         return this.Renamed7564;
      }
      
      public function set lightColor(param1:String) : void
      {
         this.Renamed7564 = param1;
      }
      
      public function toString() : String
      {
         var _loc1_:String = "BonusLightCC [";
         _loc1_ += "attenuationBegin = " + this.attenuationBegin + " ";
         _loc1_ += "attenuationEnd = " + this.attenuationEnd + " ";
         _loc1_ += "intensity = " + this.intensity + " ";
         _loc1_ += "lightColor = " + this.lightColor + " ";
         return _loc1_ + "]";
      }
   }
}

