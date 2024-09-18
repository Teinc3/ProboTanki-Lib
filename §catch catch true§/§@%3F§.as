package §catch catch true§
{
   public class §@?§
   {
      private var §8"]§:Number;
      
      private var §continue extends§:Number;
      
      private var §'"N§:Number;
      
      private var _key:String;
      
      private var §3!$§:Number;
      
      public function §@?§(param1:Number = 0, param2:Number = 0, param3:Number = 0, param4:String = null, param5:Number = 0)
      {
         super();
         this.§8"]§ = param1;
         this.§continue extends§ = param2;
         this.§'"N§ = param3;
         this._key = param4;
         this.§3!$§ = param5;
      }
      
      public function get brightness() : Number
      {
         return this.§8"]§;
      }
      
      public function set brightness(param1:Number) : void
      {
         this.§8"]§ = param1;
      }
      
      public function get contrast() : Number
      {
         return this.§continue extends§;
      }
      
      public function set contrast(param1:Number) : void
      {
         this.§continue extends§ = param1;
      }
      
      public function get hue() : Number
      {
         return this.§'"N§;
      }
      
      public function set hue(param1:Number) : void
      {
         this.§'"N§ = param1;
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
         return this.§3!$§;
      }
      
      public function set saturation(param1:Number) : void
      {
         this.§3!$§ = param1;
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

