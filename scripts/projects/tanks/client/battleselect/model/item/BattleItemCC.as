package projects.tanks.client.battleselect.model.item
{
   import Renamed232.Renamed1582;
   import platform.client.fp10.core.type.IGameObject;
   import projects.tanks.client.battleservice.Renamed1586;
   import projects.tanks.client.battleservice.Renamed1587;
   
   public class BattleItemCC
   {
      private var _battleId:String;
      
      private var _battleMode:Renamed1587;
      
      private var Renamed4171:Renamed1582;
      
      private var _map:IGameObject;
      
      private var _maxPeople:int;
      
      private var _name:String;
      
      private var _noSuppliesBattle:Boolean;
      
      private var Renamed4174:Boolean;
      
      private var _privateBattle:Boolean;
      
      private var _proBattle:Boolean;
      
      private var _rankRange:Renamed1586;
      
      private var Renamed4198:Renamed1620;
      
      public function BattleItemCC(param1:String = null, param2:Renamed1587 = null, param3:IGameObject = null, param4:int = 0, param5:String = null, param6:Boolean = false, param7:Boolean = false, param8:Boolean = false, param9:Renamed1586 = null, param10:Renamed1620 = null, param11:Renamed1582 = null, param12:Boolean = false)
      {
         super();
         this._battleId = param1;
         this._battleMode = param2;
         this._map = param3;
         this._maxPeople = param4;
         this._name = param5;
         this._noSuppliesBattle = param6;
         this._privateBattle = param7;
         this._proBattle = param8;
         this._rankRange = param9;
         this.Renamed4198 = param10;
         this.Renamed4171 = param11;
         this.Renamed4174 = param12;
      }
      
      public function get battleId() : String
      {
         return this._battleId;
      }
      
      public function set battleId(param1:String) : void
      {
         this._battleId = param1;
      }
      
      public function get battleMode() : Renamed1587
      {
         return this._battleMode;
      }
      
      public function set battleMode(param1:Renamed1587) : void
      {
         this._battleMode = param1;
      }
      
      public function get equipmentConstraintsMode() : Renamed1582
      {
         return this.Renamed4171;
      }
      
      public function set equipmentConstraintsMode(param1:Renamed1582) : void
      {
         this.Renamed4171 = param1;
      }
      
      public function get map() : IGameObject
      {
         return this._map;
      }
      
      public function set map(param1:IGameObject) : void
      {
         this._map = param1;
      }
      
      public function get maxPeople() : int
      {
         return this._maxPeople;
      }
      
      public function set maxPeople(param1:int) : void
      {
         this._maxPeople = param1;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function set name(param1:String) : void
      {
         this._name = param1;
      }
      
      public function get noSuppliesBattle() : Boolean
      {
         return this._noSuppliesBattle;
      }
      
      public function set noSuppliesBattle(param1:Boolean) : void
      {
         this._noSuppliesBattle = param1;
      }
      
      public function get parkourMode() : Boolean
      {
         return this.Renamed4174;
      }
      
      public function set parkourMode(param1:Boolean) : void
      {
         this.Renamed4174 = param1;
      }
      
      public function get privateBattle() : Boolean
      {
         return this._privateBattle;
      }
      
      public function set privateBattle(param1:Boolean) : void
      {
         this._privateBattle = param1;
      }
      
      public function get proBattle() : Boolean
      {
         return this._proBattle;
      }
      
      public function set proBattle(param1:Boolean) : void
      {
         this._proBattle = param1;
      }
      
      public function get rankRange() : Renamed1586
      {
         return this._rankRange;
      }
      
      public function set rankRange(param1:Renamed1586) : void
      {
         this._rankRange = param1;
      }
      
      public function get suspicionLevel() : Renamed1620
      {
         return this.Renamed4198;
      }
      
      public function set suspicionLevel(param1:Renamed1620) : void
      {
         this.Renamed4198 = param1;
      }
      
      public function toString() : String
      {
         var _loc1_:String = "BattleItemCC [";
         _loc1_ += "battleId = " + this.battleId + " ";
         _loc1_ += "battleMode = " + this.battleMode + " ";
         _loc1_ += "equipmentConstraintsMode = " + this.equipmentConstraintsMode + " ";
         _loc1_ += "map = " + this.map + " ";
         _loc1_ += "maxPeople = " + this.maxPeople + " ";
         _loc1_ += "name = " + this.name + " ";
         _loc1_ += "noSuppliesBattle = " + this.noSuppliesBattle + " ";
         _loc1_ += "parkourMode = " + this.parkourMode + " ";
         _loc1_ += "privateBattle = " + this.privateBattle + " ";
         _loc1_ += "proBattle = " + this.proBattle + " ";
         _loc1_ += "rankRange = " + this.rankRange + " ";
         _loc1_ += "suspicionLevel = " + this.suspicionLevel + " ";
         return _loc1_ + "]";
      }
   }
}

