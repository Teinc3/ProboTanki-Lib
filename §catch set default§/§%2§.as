package §catch set default§
{
   import §;"?§.§#">§;
   
   public class §%2§
   {
      private var §"#y§:Boolean;
      
      private var §<!L§:String;
      
      private var §true package in§:String;
      
      private var _position:§#">§;
      
      public function §%2§(param1:Boolean = false, param2:String = null, param3:String = null, param4:§#">§ = null)
      {
         super();
         this.§"#y§ = param1;
         this.§<!L§ = param2;
         this.§true package in§ = param3;
         this._position = param4;
      }
      
      public function get activated() : Boolean
      {
         return this.§"#y§;
      }
      
      public function set activated(param1:Boolean) : void
      {
         this.§"#y§ = param1;
      }
      
      public function get mineId() : String
      {
         return this.§<!L§;
      }
      
      public function set mineId(param1:String) : void
      {
         this.§<!L§ = param1;
      }
      
      public function get ownerId() : String
      {
         return this.§true package in§;
      }
      
      public function set ownerId(param1:String) : void
      {
         this.§true package in§ = param1;
      }
      
      public function get position() : §#">§
      {
         return this._position;
      }
      
      public function set position(param1:§#">§) : void
      {
         this._position = param1;
      }
      
      public function toString() : String
      {
         var _loc1_:String = "BattleMine [";
         _loc1_ += "activated = " + this.activated + " ";
         _loc1_ += "mineId = " + this.mineId + " ";
         _loc1_ += "ownerId = " + this.ownerId + " ";
         _loc1_ += "position = " + this.position + " ";
         return _loc1_ + "]";
      }
   }
}

