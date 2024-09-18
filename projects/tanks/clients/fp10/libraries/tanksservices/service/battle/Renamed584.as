package projects.tanks.clients.fp10.libraries.tanksservices.service.battle
{
   import flash.events.EventDispatcher;
   
   public class Renamed584 extends EventDispatcher implements IBattleInfoService
   {
      private var Renamed4509:String;
      
      private var Renamed4510:String;
      
      private var _minRank:int;
      
      private var _maxRank:int;
      
      private var Renamed4177:Boolean;
      
      private var Renamed4204:Boolean;
      
      private var Renamed4511:Boolean;
      
      private var Renamed4512:Boolean;
      
      public function Renamed584()
      {
         super();
      }
      
      public function get currentSelectionBattleId() : String
      {
         return this.Renamed4510;
      }
      
      public function resetCurrentBattle() : void
      {
         this.Renamed4177 = false;
         this.Renamed4509 = null;
         if(this.Renamed4510 != null)
         {
         }
         dispatchEvent(new BattleInfoServiceEvent(BattleInfoServiceEvent.BATTLE_UNLOAD));
      }
      
      public function setCurrentSelectionBattle(param1:String, param2:int, param3:int) : void
      {
         this.Renamed4510 = param1;
         this._minRank = param2;
         this._maxRank = param3;
         dispatchEvent(new BattleInfoServiceEvent(BattleInfoServiceEvent.SELECTION_BATTLE));
      }
      
      public function get currentBattleId() : String
      {
         return this.Renamed4509;
      }
      
      public function set currentBattleId(param1:String) : void
      {
         this.Renamed4509 = param1;
      }
      
      public function resetCurrentSelectionBattleId() : void
      {
         this.Renamed4510 = null;
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
         return this.Renamed4510 != null;
      }
      
      public function hasCurrentBattleId() : Boolean
      {
         return this.Renamed4509 != null;
      }
      
      public function isSpectatorMode() : Boolean
      {
         return this.Renamed4177;
      }
      
      public function get spectator() : Boolean
      {
         return this.Renamed4177;
      }
      
      public function set spectator(param1:Boolean) : void
      {
         this.Renamed4177 = param1;
      }
      
      public function get reArmorEnabled() : Boolean
      {
         return this.Renamed4204;
      }
      
      public function set reArmorEnabled(param1:Boolean) : void
      {
         this.Renamed4204 = param1;
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
         return this.Renamed4511;
      }
      
      public function set battleActive(param1:Boolean) : void
      {
         this.Renamed4511 = param1;
      }
      
      public function isInBattle() : Boolean
      {
         return this.Renamed4512;
      }
      
      public function setInBattle(param1:Boolean) : void
      {
         this.Renamed4512 = param1;
      }
   }
}

