package §,#a§
{
   import §9p§.§break var finally§;
   import §9p§.§var const final§;
   
   public class §7N§
   {
      private var §;#l§:Number;
      
      private var §set get§:Number;
      
      private var §?#m§:Number;
      
      private var §6!'§:Vector.<§'"P§>;
      
      private var _resources:§var const final§;
      
      private var §4";§:§break var finally§;
      
      public function §7N§(param1:Number = 0, param2:Number = 0, param3:Number = 0, param4:Vector.<§'"P§> = null, param5:§var const final§ = null, param6:§break var finally§ = null)
      {
         super();
         this.§;#l§ = param1;
         this.§set get§ = param2;
         this.§?#m§ = param3;
         this.§6!'§ = param4;
         this._resources = param5;
         this.§4";§ = param6;
      }
      
      public function get §'"K§() : Number
      {
         return this.§;#l§;
      }
      
      public function set §'"K§(param1:Number) : void
      {
         this.§;#l§ = param1;
      }
      
      public function get §;%§() : Number
      {
         return this.§set get§;
      }
      
      public function set §;%§(param1:Number) : void
      {
         this.§set get§ = param1;
      }
      
      public function get §8!x§() : Number
      {
         return this.§?#m§;
      }
      
      public function set §8!x§(param1:Number) : void
      {
         this.§?#m§ = param1;
      }
      
      public function get §-!H§() : Vector.<§'"P§>
      {
         return this.§6!'§;
      }
      
      public function set §-!H§(param1:Vector.<§'"P§>) : void
      {
         this.§6!'§ = param1;
      }
      
      public function get resources() : §var const final§
      {
         return this._resources;
      }
      
      public function set resources(param1:§var const final§) : void
      {
         this._resources = param1;
      }
      
      public function get §3!P§() : §break var finally§
      {
         return this.§4";§;
      }
      
      public function set §3!P§(param1:§break var finally§) : void
      {
         this.§4";§ = param1;
      }
      
      public function toString() : String
      {
         var _loc1_:String = "ControlPointsCC [";
         _loc1_ += "keypointTriggerRadius = " + this.§'"K§ + " ";
         _loc1_ += "keypointVisorHeight = " + this.§;%§ + " ";
         _loc1_ += "minesRestrictionRadius = " + this.§8!x§ + " ";
         _loc1_ += "points = " + this.§-!H§ + " ";
         _loc1_ += "resources = " + this.resources + " ";
         _loc1_ += "sounds = " + this.§3!P§ + " ";
         return _loc1_ + "]";
      }
   }
}

