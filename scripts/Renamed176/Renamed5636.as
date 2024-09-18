package Renamed4622
{
   public class Renamed5636
   {
      private var Renamed5638:Number;
      
      private var Renamed5639:Number;
      
      private var _color:String;
      
      private var Renamed5640:Number;
      
      private var Renamed5641:int;
      
      public function Renamed5636(param1:Number = 0, param2:Number = 0, param3:String = null, param4:Number = 0, param5:int = 0)
      {
         super();
         this.Renamed5638 = param1;
         this.Renamed5639 = param2;
         this._color = param3;
         this.Renamed5640 = param4;
         this.Renamed5641 = param5;
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
      
      public function get color() : String
      {
         return this._color;
      }
      
      public function set color(param1:String) : void
      {
         this._color = param1;
      }
      
      public function get intensity() : Number
      {
         return this.Renamed5640;
      }
      
      public function set intensity(param1:Number) : void
      {
         this.Renamed5640 = param1;
      }
      
      public function get time() : int
      {
         return this.Renamed5641;
      }
      
      public function set time(param1:int) : void
      {
         this.Renamed5641 = param1;
      }
      
      public function toString() : String
      {
         var _loc1_:String = "LightingEfectRecord [";
         _loc1_ += "attenuationBegin = " + this.attenuationBegin + " ";
         _loc1_ += "attenuationEnd = " + this.attenuationEnd + " ";
         _loc1_ += "color = " + this.color + " ";
         _loc1_ += "intensity = " + this.intensity + " ";
         _loc1_ += "time = " + this.time + " ";
         return _loc1_ + "]";
      }
   }
}

