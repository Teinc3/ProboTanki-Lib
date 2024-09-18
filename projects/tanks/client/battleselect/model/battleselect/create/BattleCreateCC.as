package projects.tanks.client.battleselect.model.battleselect.create
{
   import §break for null§.§'B§;
   
   public class BattleCreateCC
   {
      private var _battleCreationDisabled:Boolean;
      
      private var _battlesLimits:Vector.<§'B§>;
      
      private var _maxRangeLength:int;
      
      public function BattleCreateCC(param1:Boolean = false, param2:Vector.<§'B§> = null, param3:int = 0)
      {
         super();
         this._battleCreationDisabled = param1;
         this._battlesLimits = param2;
         this._maxRangeLength = param3;
      }
      
      public function get battleCreationDisabled() : Boolean
      {
         return this._battleCreationDisabled;
      }
      
      public function set battleCreationDisabled(param1:Boolean) : void
      {
         this._battleCreationDisabled = param1;
      }
      
      public function get battlesLimits() : Vector.<§'B§>
      {
         return this._battlesLimits;
      }
      
      public function set battlesLimits(param1:Vector.<§'B§>) : void
      {
         this._battlesLimits = param1;
      }
      
      public function get maxRangeLength() : int
      {
         return this._maxRangeLength;
      }
      
      public function set maxRangeLength(param1:int) : void
      {
         this._maxRangeLength = param1;
      }
      
      public function toString() : String
      {
         var _loc1_:String = "BattleCreateCC [";
         _loc1_ += "battleCreationDisabled = " + this.battleCreationDisabled + " ";
         _loc1_ += "battlesLimits = " + this.battlesLimits + " ";
         _loc1_ += "maxRangeLength = " + this.maxRangeLength + " ";
         return _loc1_ + "]";
      }
   }
}

