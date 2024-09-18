package projects.tanks.clients.fp10.libraries.tanksservices.service.layout
{
   import projects.tanks.client.commons.models.layout.LayoutState;
   
   public interface ILobbyLayoutService extends LobbyLayoutServiceBase
   {
      function showGarage() : void;
      
      function showBattleSelect() : void;
      
      function §for const const§() : void;
      
      function showPayment() : void;
      
      function get paymentDisabled() : Boolean;
      
      function layoutSwitchPredicted() : void;
      
      function isSwitchInProgress() : Boolean;
      
      function getCurrentState() : LayoutState;
      
      function exitFromGame() : void;
      
      function exitFromBattle() : void;
      
      function exitFromBattleToState(param1:LayoutState) : void;
      
      function isWindowOpenOverBattle() : Boolean;
      
      function closePopupOverBattle() : void;
      
      function setBattleReady(param1:Boolean) : void;
      
      function § #8§() : void;
   }
}

