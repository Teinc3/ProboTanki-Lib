package Renamed320
{
   public class Renamed6647
   {
      private var Renamed7705:Number;
      
      private var Renamed7706:Number;
      
      private var Renamed7707:Number;
      
      private var _key:String;
      
      private var Renamed7708:Number;
      
      public function Renamed6647(param1:Number = 0, param2:Number = 0, param3:Number = 0, param4:String = null, param5:Number = 0)
      {
         super();
         this.Renamed7705 = param1;
         this.Renamed7706 = param2;
         this.Renamed7707 = param3;
         this._key = param4;
         this.Renamed7708 = param5;
      }
      
      public function get brightness() : Number
      {
         return this.Renamed7705;
      }
      
      public function set brightness(param1:Number) : void
      {
         this.Renamed7705 = param1;
      }
      
      public function get contrast() : Number
      {
         return this.Renamed7706;
      }
      
      public function set contrast(param1:Number) : void
      {
         this.Renamed7706 = param1;
      }
      
      public function get hue() : Number
      {
         return this.Renamed7707;
      }
      
      public function set hue(param1:Number) : void
      {
         this.Renamed7707 = param1;
      }
      
      public function get key() : String
      {
         return this._key;
      }
      
      public function set key(param1:String) : void
      {
         this._key = param1;
      }
      
      public function get saturation() : Number
      {
         return this.Renamed7708;
      }
      
      public function set saturation(param1:Number) : void
      {
         this.Renamed7708 = param1;
      }
      
      public function toString() : String
      {
         var _loc1_:String = "BCSHStruct [";
         _loc1_ += "brightness = " + this.brightness + " ";
         _loc1_ += "contrast = " + this.contrast + " ";
         _loc1_ += "hue = " + this.hue + " ";
         _loc1_ += "key = " + this.key + " ";
         _loc1_ += "saturation = " + this.saturation + " ";
         return _loc1_ + "]";
      }
   }
}

