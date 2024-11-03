package projects.tanks.clients.fp10.libraries.tanksservices.service.battle
{
   import flash.events.IEventDispatcher;
   
   public interface IBattleInfoService extends IEventDispatcher
   {
      function get currentSelectionBattleId() : String;
      
      function get currentBattleId() : String;
      
      function set currentBattleId(param1:String) : void;
      
      function setCurrentSelectionBattle(param1:String, param2:int, param3:int) : void;
      
      function resetCurrentSelectionBattleId() : void;
      
      function hasCurrentSelectionBattleId() : Boolean;
      
      function hasCurrentBattleId() : Boolean;
      
      function get reArmorEnabled() : Boolean;
      
      function set reArmorEnabled(param1:Boolean) : void;
      
      function get spectator() : Boolean;
      
      function set spectator(param1:Boolean) : void;
      
      function isSpectatorMode() : Boolean;
      
      function availableRank(param1:int) : Boolean;
      
      function isInBattle() : Boolean;
      
      function setInBattle(param1:Boolean) : void;
      
      function battleRestart() : void;
      
      function battleLoad() : void;
      
      function resetCurrentBattle() : void;
      
      function get battleActive() : Boolean;
      
      function set battleActive(param1:Boolean) : void;
   }
}

