package projects.tanks.client.panel.model.battleinvite
{
   import projects.tanks.client.battleservice.Renamed1587;
   
   public class BattleInviteMessage
   {
      private var _availableRank:Boolean;
      
      private var _availableSlot:Boolean;
      
      private var _battleId:String;
      
      private var _gameHost:String;
      
      private var _mapName:String;
      
      private var _mode:Renamed1587;
      
      private var _noSuppliesBattle:Boolean;
      
      private var _privateBattle:Boolean;
      
      private var _remote:Boolean;
      
      private var _serverNumber:int;
      
      private var _url:String;
      
      public function BattleInviteMessage(param1:Boolean = false, param2:Boolean = false, param3:String = null, param4:String = null, param5:String = null, param6:Renamed1587 = null, param7:Boolean = false, param8:Boolean = false, param9:Boolean = false, param10:int = 0, param11:String = null)
      {
         super();
         this._availableRank = param1;
         this._availableSlot = param2;
         this._battleId = param3;
         this._gameHost = param4;
         this._mapName = param5;
         this._mode = param6;
         this._noSuppliesBattle = param7;
         this._privateBattle = param8;
         this._remote = param9;
         this._serverNumber = param10;
         this._url = param11;
      }
      
      public function get availableRank() : Boolean
      {
         return this._availableRank;
      }
      
      public function set availableRank(param1:Boolean) : void
      {
         this._availableRank = param1;
      }
      
      public function get availableSlot() : Boolean
      {
         return this._availableSlot;
      }
      
      public function set availableSlot(param1:Boolean) : void
      {
         this._availableSlot = param1;
      }
      
      public function get battleId() : String
      {
         return this._battleId;
      }
      
      public function set battleId(param1:String) : void
      {
         this._battleId = param1;
      }
      
      public function get gameHost() : String
      {
         return this._gameHost;
      }
      
      public function set gameHost(param1:String) : void
      {
         this._gameHost = param1;
      }
      
      public function get mapName() : String
      {
         return this._mapName;
      }
      
      public function set mapName(param1:String) : void
      {
         this._mapName = param1;
      }
      
      public function get mode() : Renamed1587
      {
         return this._mode;
      }
      
      public function set mode(param1:Renamed1587) : void
      {
         this._mode = param1;
      }
      
      public function get noSuppliesBattle() : Boolean
      {
         return this._noSuppliesBattle;
      }
      
      public function set noSuppliesBattle(param1:Boolean) : void
      {
         this._noSuppliesBattle = param1;
      }
      
      public function get privateBattle() : Boolean
      {
         return this._privateBattle;
      }
      
      public function set privateBattle(param1:Boolean) : void
      {
         this._privateBattle = param1;
      }
      
      public function get remote() : Boolean
      {
         return this._remote;
      }
      
      public function set remote(param1:Boolean) : void
      {
         this._remote = param1;
      }
      
      public function get serverNumber() : int
      {
         return this._serverNumber;
      }
      
      public function set serverNumber(param1:int) : void
      {
         this._serverNumber = param1;
      }
      
      public function get url() : String
      {
         return this._url;
      }
      
      public function set url(param1:String) : void
      {
         this._url = param1;
      }
      
      public function toString() : String
      {
         var _loc1_:String = "BattleInviteMessage [";
         _loc1_ += "availableRank = " + this.availableRank + " ";
         _loc1_ += "availableSlot = " + this.availableSlot + " ";
         _loc1_ += "battleId = " + this.battleId + " ";
         _loc1_ += "gameHost = " + this.gameHost + " ";
         _loc1_ += "mapName = " + this.mapName + " ";
         _loc1_ += "mode = " + this.mode + " ";
         _loc1_ += "noSuppliesBattle = " + this.noSuppliesBattle + " ";
         _loc1_ += "privateBattle = " + this.privateBattle + " ";
         _loc1_ += "remote = " + this.remote + " ";
         _loc1_ += "serverNumber = " + this.serverNumber + " ";
         _loc1_ += "url = " + this.url + " ";
         return _loc1_ + "]";
      }
   }
}

