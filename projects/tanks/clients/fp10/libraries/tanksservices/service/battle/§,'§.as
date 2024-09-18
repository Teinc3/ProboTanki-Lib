package projects.tanks.clients.fp10.libraries.tanksservices.service.battle
{
   import flash.events.EventDispatcher;
   
   public class §,'§ extends EventDispatcher implements IBattleInfoService
   {
      private var §,"]§:String;
      
      private var §3"9§:String;
      
      private var _minRank:int;
      
      private var _maxRank:int;
      
      private var §case for case§:Boolean;
      
      private var §while for false§:Boolean;
      
      private var §const const break§:Boolean;
      
      private var §include var static§:Boolean;
      
      public function §,'§()
      {
         super();
      }
      
      public function get currentSelectionBattleId() : String
      {
         return this.§3"9§;
      }
      
      public function resetCurrentBattle() : void
      {
         this.§case for case§ = false;
         this.§,"]§ = null;
         if(this.§3"9§ != null)
         {
         }
         dispatchEvent(new BattleInfoServiceEvent(BattleInfoServiceEvent.BATTLE_UNLOAD));
      }
      
      public function setCurrentSelectionBattle(param1:String, param2:int, param3:int) : void
      {
         this.§3"9§ = param1;
         this._minRank = param2;
         this._maxRank = param3;
         dispatchEvent(new BattleInfoServiceEvent(BattleInfoServiceEvent.SELECTION_BATTLE));
      }
      
      public function get currentBattleId() : String
      {
         return this.§,"]§;
      }
      
      public function set currentBattleId(param1:String) : void
      {
         this.§,"]§ = param1;
      }
      
      public function resetCurrentSelectionBattleId() : void
      {
         this.§3"9§ = null;
         dispatchEvent(new BattleInfoServiceEvent(BattleInfoServiceEvent.RESET_SELECTION_BATTLE));
      }
      
      public function battleRestart() : void
      {
         dispatchEvent(new BattleInfoServiceEvent(BattleInfoServiceEvent.BATTLE_RESTART));
      }
      
      public function battleLoad() : void
      {
         dispatchEvent(new BattleInfoServiceEvent(BattleInfoServiceEvent.BATTLE_LOAD));
      }
      
      public function hasCurrentSelectionBattleId() : Boolean
      {
         return this.§3"9§ != null;
      }
      
      public function hasCurrentBattleId() : Boolean
      {
         return this.§,"]§ != null;
      }
      
      public function isSpectatorMode() : Boolean
      {
         return this.§case for case§;
      }
      
      public function get spectator() : Boolean
      {
         return this.§case for case§;
      }
      
      public function set spectator(param1:Boolean) : void
      {
         this.§case for case§ = param1;
      }
      
      public function get reArmorEnabled() : Boolean
      {
         return this.§while for false§;
      }
      
      public function set reArmorEnabled(param1:Boolean) : void
      {
         this.§while for false§ = param1;
      }
      
      public function availableRank(param1:int) : Boolean
      {
         if(this.hasCurrentSelectionBattleId())
         {
            return param1 >= this._minRank && param1 <= this._maxRank;
         }
         return false;
      }
      
      public function get battleActive() : Boolean
      {
         return this.§const const break§;
      }
      
      public function set battleActive(param1:Boolean) : void
      {
         this.§const const break§ = param1;
      }
      
      public function isInBattle() : Boolean
      {
         return this.§include var static§;
      }
      
      public function setInBattle(param1:Boolean) : void
      {
         this.§include var static§ = param1;
      }
   }
}

