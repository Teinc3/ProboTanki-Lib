package projects.tanks.client.battleservice
{
   import Renamed232.Renamed1582;
   import Renamed1614.Renamed1615;
   import Renamed312.Renamed1585;
   
   public class Renamed1579
   {
      private var _autoBalance:Boolean;
      
      private var _battleMode:Renamed1587;
      
      private var Renamed4171:Renamed1582;
      
      private var Renamed4202:Boolean;
      
      private var Renamed4173:Renamed1585;
      
      private var Renamed4203:String;
      
      private var _maxPeopleCount:int;
      
      private var _name:String;
      
      private var Renamed4174:Boolean;
      
      private var _privateBattle:Boolean;
      
      private var _proBattle:Boolean;
      
      private var _rankRange:Renamed1586;
      
      private var Renamed4204:Boolean;
      
      private var Renamed4205:Renamed1615;
      
      private var Renamed4180:Boolean;
      
      private var Renamed4181:Boolean;
      
      private var Renamed4182:Boolean;
      
      private var Renamed4183:Boolean;
      
      public function Renamed1579(param1:Boolean = false, param2:Renamed1587 = null, param3:Renamed1582 = null, param4:Boolean = false, param5:Renamed1585 = null, param6:String = null, param7:int = 0, param8:String = null, param9:Boolean = false, param10:Boolean = false, param11:Boolean = false, param12:Renamed1586 = null, param13:Boolean = false, param14:Renamed1615 = null, param15:Boolean = false, param16:Boolean = false, param17:Boolean = false, param18:Boolean = false)
      {
         super();
         this._autoBalance = param1;
         this._battleMode = param2;
         this.Renamed4171 = param3;
         this.Renamed4202 = param4;
         this.Renamed4173 = param5;
         this.Renamed4203 = param6;
         this._maxPeopleCount = param7;
         this._name = param8;
         this.Renamed4174 = param9;
         this._privateBattle = param10;
         this._proBattle = param11;
         this._rankRange = param12;
         this.Renamed4204 = param13;
         this.Renamed4205 = param14;
         this.Renamed4180 = param15;
         this.Renamed4181 = param16;
         this.Renamed4182 = param17;
         this.Renamed4183 = param18;
      }
      
      public function get autoBalance() : Boolean
      {
         return this._autoBalance;
      }
      
      public function set autoBalance(param1:Boolean) : void
      {
         this._autoBalance = param1;
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
      
      public function get friendlyFire() : Boolean
      {
         return this.Renamed4202;
      }
      
      public function set friendlyFire(param1:Boolean) : void
      {
         this.Renamed4202 = param1;
      }
      
      public function get Renamed1601() : Renamed1585
      {
         return this.Renamed4173;
      }
      
      public function set Renamed1601(param1:Renamed1585) : void
      {
         this.Renamed4173 = param1;
      }
      
      public function get mapId() : String
      {
         return this.Renamed4203;
      }
      
      public function set mapId(param1:String) : void
      {
         this.Renamed4203 = param1;
      }
      
      public function get maxPeopleCount() : int
      {
         return this._maxPeopleCount;
      }
      
      public function set maxPeopleCount(param1:int) : void
      {
         this._maxPeopleCount = param1;
      }
      
      public function get parkourMode() : Boolean
      {
         return this.Renamed4174;
      }
      
      public function set parkourMode(param1:Boolean) : void
      {
         this.Renamed4174 = param1;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function set name(param1:String) : void
      {
         this._name = param1;
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
      
      public function get reArmorEnabled() : Boolean
      {
         return this.Renamed4204;
      }
      
      public function set reArmorEnabled(param1:Boolean) : void
      {
         this.Renamed4204 = param1;
      }
      
      public function get theme() : Renamed1615
      {
         return this.Renamed4205;
      }
      
      public function set theme(param1:Renamed1615) : void
      {
         this.Renamed4205 = param1;
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
         var _loc1_:String = "BattleCreateParameters [";
         _loc1_ += "autoBalance = " + this.autoBalance + " ";
         _loc1_ += "battleMode = " + this.battleMode + " ";
         _loc1_ += "equipmentConstraintsMode = " + this.equipmentConstraintsMode + " ";
         _loc1_ += "friendlyFire = " + this.friendlyFire + " ";
         _loc1_ += "limits = " + this.Renamed1601 + " ";
         _loc1_ += "mapId = " + this.mapId + " ";
         _loc1_ += "maxPeopleCount = " + this.maxPeopleCount + " ";
         _loc1_ += "name = " + this.name + " ";
         _loc1_ += "parkourMode = " + this.parkourMode + " ";
         _loc1_ += "privateBattle = " + this.privateBattle + " ";
         _loc1_ += "proBattle = " + this.proBattle + " ";
         _loc1_ += "rankRange = " + this.rankRange + " ";
         _loc1_ += "reArmorEnabled = " + this.reArmorEnabled + " ";
         _loc1_ += "theme = " + this.theme + " ";
         _loc1_ += "withoutBonuses = " + this.withoutBonuses + " ";
         _loc1_ += "withoutCrystals = " + this.withoutCrystals + " ";
         _loc1_ += "withoutSupplies = " + this.withoutSupplies + " ";
         _loc1_ += "withoutUpgrades = " + this.Renamed1602 + " ";
         return _loc1_ + "]";
      }
   }
}

