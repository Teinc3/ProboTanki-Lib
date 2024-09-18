package projects.tanks.client.battleservice.model.statistics
{
   import Renamed232.Renamed1582;
   import Renamed312.Renamed1585;
   import projects.tanks.client.battleservice.Renamed1587;
   
   public class Renamed4220
   {
      private var _battleMode:Renamed1587;
      
      private var Renamed4171:Renamed1582;
      
      private var Renamed4221:int;
      
      private var Renamed4173:Renamed1585;
      
      private var _mapName:String;
      
      private var Renamed4222:Boolean;
      
      private var _maxPeopleCount:int;
      
      private var Renamed4223:String;
      
      private var Renamed4224:int;
      
      private var Renamed4174:Boolean;
      
      private var Renamed4225:int;
      
      private var Renamed4177:Boolean;
      
      private var Renamed4226:Vector.<String>;
      
      private var Renamed4227:int;
      
      private var Renamed4228:Boolean;
      
      public function Renamed4220(param1:Renamed1582 = null, param2:int = 0, param3:Renamed1585 = null, param4:String = null, param5:Boolean = false, param6:int = 0, param7:String = null, param8:int = 0, param9:Boolean = false, param10:int = 0, param11:Boolean = false, param12:Vector.<String> = null, param13:int = 0, param14:Boolean = false, param15:Renamed1587 = null)
      {
         super();
         this.Renamed4171 = param1;
         this.Renamed4221 = param2;
         this.Renamed4173 = param3;
         this._mapName = param4;
         this.Renamed4222 = param5;
         this._maxPeopleCount = param6;
         this.Renamed4223 = param7;
         this.Renamed4224 = param8;
         this.Renamed4174 = param9;
         this.Renamed4225 = param10;
         this.Renamed4177 = param11;
         this.Renamed4226 = param12;
         this.Renamed4227 = param13;
         this.Renamed4228 = param14;
         this._battleMode = param15;
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
      
      public function get fund() : int
      {
         return this.Renamed4221;
      }
      
      public function set fund(param1:int) : void
      {
         this.Renamed4221 = param1;
      }
      
      public function get Renamed1601() : Renamed1585
      {
         return this.Renamed4173;
      }
      
      public function set Renamed1601(param1:Renamed1585) : void
      {
         this.Renamed4173 = param1;
      }
      
      public function get mapName() : String
      {
         return this._mapName;
      }
      
      public function set mapName(param1:String) : void
      {
         this._mapName = param1;
      }
      
      public function get Renamed4229() : Boolean
      {
         return this.Renamed4222;
      }
      
      public function set Renamed4229(param1:Boolean) : void
      {
         this.Renamed4222 = param1;
      }
      
      public function get maxPeopleCount() : int
      {
         return this._maxPeopleCount;
      }
      
      public function set maxPeopleCount(param1:int) : void
      {
         this._maxPeopleCount = param1;
      }
      
      public function get Renamed4230() : String
      {
         return this.Renamed4223;
      }
      
      public function set Renamed4230(param1:String) : void
      {
         this.Renamed4223 = param1;
      }
      
      public function get Renamed4231() : int
      {
         return this.Renamed4224;
      }
      
      public function set Renamed4231(param1:int) : void
      {
         this.Renamed4224 = param1;
      }
      
      public function get parkourMode() : Boolean
      {
         return this.Renamed4174;
      }
      
      public function set parkourMode(param1:Boolean) : void
      {
         this.Renamed4174 = param1;
      }
      
      public function get Renamed4232() : int
      {
         return this.Renamed4225;
      }
      
      public function set Renamed4232(param1:int) : void
      {
         this.Renamed4225 = param1;
      }
      
      public function get spectator() : Boolean
      {
         return this.Renamed4177;
      }
      
      public function set spectator(param1:Boolean) : void
      {
         this.Renamed4177 = param1;
      }
      
      public function get Renamed4233() : Vector.<String>
      {
         return this.Renamed4226;
      }
      
      public function set Renamed4233(param1:Vector.<String>) : void
      {
         this.Renamed4226 = param1;
      }
      
      public function get Renamed4234() : int
      {
         return this.Renamed4227;
      }
      
      public function set Renamed4234(param1:int) : void
      {
         this.Renamed4227 = param1;
      }
      
      public function get Renamed4235() : Boolean
      {
         return this.Renamed4228;
      }
      
      public function set Renamed4235(param1:Boolean) : void
      {
         this.Renamed4228 = param1;
      }
      
      public function toString() : String
      {
         var _loc1_:String = "StatisticsModelCC [";
         _loc1_ += "battleMode = " + this.battleMode + " ";
         _loc1_ += "equipmentConstraintsMode = " + this.equipmentConstraintsMode + " ";
         _loc1_ += "fund = " + this.fund + " ";
         _loc1_ += "limits = " + this.Renamed1601 + " ";
         _loc1_ += "mapName = " + this.mapName + " ";
         _loc1_ += "matchBattle = " + this.Renamed4229 + " ";
         _loc1_ += "maxPeopleCount = " + this.maxPeopleCount + " ";
         _loc1_ += "modeName = " + this.Renamed4230 + " ";
         _loc1_ += "newbiesAbonementBonusInPercent = " + this.Renamed4231 + " ";
         _loc1_ += "parkourMode = " + this.parkourMode + " ";
         _loc1_ += "premiumBonusInPercent = " + this.Renamed4232 + " ";
         _loc1_ += "spectator = " + this.spectator + " ";
         _loc1_ += "suspiciousUserIds = " + this.Renamed4233 + " ";
         _loc1_ += "timeLeft = " + this.Renamed4234 + " ";
         _loc1_ += "valuableRound = " + this.Renamed4235 + " ";
         return _loc1_ + "]";
      }
   }
}

