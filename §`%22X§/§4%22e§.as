package §`"X§
{
   public class §4"e§
   {
      private var §import set dynamic§:Number;
      
      private var §for package if§:Number;
      
      private var §case var default§:Number;
      
      private var §7#J§:String;
      
      public function §4"e§(param1:Number = 0, param2:Number = 0, param3:Number = 0, param4:String = null)
      {
         super();
         this.§import set dynamic§ = param1;
         this.§for package if§ = param2;
         this.§case var default§ = param3;
         this.§7#J§ = param4;
      }
      
      public function get attenuationBegin() : Number
      {
         return this.§import set dynamic§;
      }
      
      public function set attenuationBegin(param1:Number) : void
      {
         this.§import set dynamic§ = param1;
      }
      
      public function get attenuationEnd() : Number
      {
         return this.§for package if§;
      }
      
      public function set attenuationEnd(param1:Number) : void
      {
         this.§for package if§ = param1;
      }
      
      public function get intensity() : Number
      {
         return this.§case var default§;
      }
      
      public function set intensity(param1:Number) : void
      {
         this.§case var default§ = param1;
      }
      
      public function get lightColor() : String
      {
         return this.§7#J§;
      }
      
      public function set lightColor(param1:String) : void
      {
         this.§7#J§ = param1;
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

