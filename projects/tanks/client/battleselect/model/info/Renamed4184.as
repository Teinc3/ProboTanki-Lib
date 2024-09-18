package projects.tanks.client.battleselect.model.info
{
   import Renamed232.Renamed1582;
   import Renamed312.Renamed1585;
   import platform.client.fp10.core.type.IGameObject;
   import projects.tanks.client.battleservice.Renamed1586;
   import projects.tanks.client.battleservice.Renamed1587;
   
   public class Renamed2118
   {
      private var _battleMode:Renamed1587;
      
      private var Renamed4171:Renamed1582;
      
      private var Renamed4172:String;
      
      private var Renamed4173:Renamed1585;
      
      private var _map:IGameObject;
      
      private var _maxPeopleCount:int;
      
      private var Renamed4174:Boolean;
      
      private var _name:String;
      
      private var _proBattle:Boolean;
      
      private var _rankRange:Renamed1586;
      
      private var Renamed4175:Boolean;
      
      private var Renamed4176:Boolean;
      
      private var Renamed4177:Boolean;
      
      private var Renamed4178:int;
      
      private var Renamed4179:Boolean;
      
      private var Renamed4180:Boolean;
      
      private var Renamed4181:Boolean;
      
      private var Renamed4182:Boolean;
      
      private var Renamed4183:Boolean;
      
      public function Renamed2118(param1:Renamed1587 = null, param2:String = null, param3:Renamed1585 = null, param4:IGameObject = null, param5:int = 0, param6:String = null, param7:Boolean = false, param8:Renamed1586 = null, param9:Boolean = false, param10:Boolean = false, param11:int = 0, param12:Boolean = false, param13:Boolean = false, param14:Boolean = false, param15:Boolean = false, param16:Boolean = false, param17:Boolean = false, param18:Renamed1582 = null, param19:Boolean = false)
      {
         super();
         this._battleMode = param1;
         this.Renamed4172 = param2;
         this.Renamed4173 = param3;
         this._map = param4;
         this._maxPeopleCount = param5;
         this._name = param6;
         this._proBattle = param7;
         this._rankRange = param8;
         this.Renamed4176 = param9;
         this.Renamed4177 = param10;
         this.Renamed4178 = param11;
         this.Renamed4179 = param12;
         this.Renamed4175 = param13;
         this.Renamed4180 = param14;
         this.Renamed4181 = param15;
         this.Renamed4182 = param16;
         this.Renamed4183 = param17;
         this.Renamed4171 = param18;
         this.Renamed4174 = param19;
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
      
      public function get itemId() : String
      {
         return this.Renamed4172;
      }
      
      public function set itemId(param1:String) : void
      {
         this.Renamed4172 = param1;
      }
      
      public function get Renamed1601() : Renamed1585
      {
         return this.Renamed4173;
      }
      
      public function set Renamed1601(param1:Renamed1585) : void
      {
         this.Renamed4173 = param1;
      }
      
      public function get map() : IGameObject
      {
         return this._map;
      }
      
      public function set map(param1:IGameObject) : void
      {
         this._map = param1;
      }
      
      public function get maxPeopleCount() : int
      {
         return this._maxPeopleCount;
      }
      
      public function set maxPeopleCount(param1:int) : void
      {
         this._maxPeopleCount = param1;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function set name(param1:String) : void
      {
         this._name = param1;
      }
      
      public function get parkourMode() : Boolean
      {
         return this.Renamed4174;
      }
      
      public function set parkourMode(param1:Boolean) : void
      {
         this.Renamed4174 = param1;
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
      
      public function get reArmor() : Boolean
      {
         return this.Renamed4175;
      }
      
      public function set reArmor(param1:Boolean) : void
      {
         this.Renamed4175 = param1;
      }
      
      public function get roundStarted() : Boolean
      {
         return this.Renamed4176;
      }
      
      public function set roundStarted(param1:Boolean) : void
      {
         this.Renamed4176 = param1;
      }
      
      public function get spectator() : Boolean
      {
         return this.Renamed4177;
      }
      
      public function set spectator(param1:Boolean) : void
      {
         this.Renamed4177 = param1;
      }
      
      public function get timeLeftInSec() : int
      {
         return this.Renamed4178;
      }
      
      public function set timeLeftInSec(param1:int) : void
      {
         this.Renamed4178 = param1;
      }
      
      public function get userPaidNoSuppliesBattle() : Boolean
      {
         return this.Renamed4179;
      }
      
      public function set userPaidNoSuppliesBattle(param1:Boolean) : void
      {
         this.Renamed4179 = param1;
      }
      
      public function get withoutBonuses() : Boolean
      {
         return this.Renamed4180;
      }
      
      public function set withoutBonuses(param1:Boolean) : void
      {
         this.Renamed4180 = param1;
      }
      
      public function get withoutCrystals() : Boolean
      {
         return this.Renamed4181;
      }
      
      public function set withoutCrystals(param1:Boolean) : void
      {
         this.Renamed4181 = param1;
      }
      
      public function get withoutSupplies() : Boolean
      {
         return this.Renamed4182;
      }
      
      public function set withoutSupplies(param1:Boolean) : void
      {
         this.Renamed4182 = param1;
      }
      
      public function get Renamed1602() : Boolean
      {
         return this.Renamed4183;
      }
      
      public function set Renamed1602(param1:Boolean) : void
      {
         this.Renamed4183 = param1;
      }
      
      public function toString() : String
      {
         var _loc1_:String = "BattleInfoCC [";
         _loc1_ += "battleMode = " + this.battleMode + " ";
         _loc1_ += "equipmentConstraintsMode = " + this.equipmentConstraintsMode + " ";
         _loc1_ += "itemId = " + this.itemId + " ";
         _loc1_ += "limits = " + this.Renamed1601 + " ";
         _loc1_ += "map = " + this.map + " ";
         _loc1_ += "maxPeopleCount = " + this.maxPeopleCount + " ";
         _loc1_ += "parkourMode = " + this.parkourMode + " ";
         _loc1_ += "name = " + this.name + " ";
         _loc1_ += "proBattle = " + this.proBattle + " ";
         _loc1_ += "rankRange = " + this.rankRange + " ";
         _loc1_ += "reArmor = " + this.reArmor + " ";
         _loc1_ += "roundStarted = " + this.roundStarted + " ";
         _loc1_ += "spectator = " + this.spectator + " ";
         _loc1_ += "timeLeftInSec = " + this.timeLeftInSec + " ";
         _loc1_ += "userPaidNoSuppliesBattle = " + this.userPaidNoSuppliesBattle + " ";
         _loc1_ += "withoutBonuses = " + this.withoutBonuses + " ";
         _loc1_ += "withoutCrystals = " + this.withoutCrystals + " ";
         _loc1_ += "withoutSupplies = " + this.withoutSupplies + " ";
         _loc1_ += "withoutUpgrades = " + this.Renamed1602 + " ";
         return _loc1_ + "]";
      }
   }
}

