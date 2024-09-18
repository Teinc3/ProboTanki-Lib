package projects.tanks.clients.flash.commons.models.layout
{
   import projects.tanks.client.commons.models.layout.LayoutState;
   
   public interface ILobbyLayout
   {
      function switchGarage() : void;
      
      function switchBattleSelect() : void;
      
      function exitFromBattle() : void;
      
      function exitFromBattleToState(param1:LayoutState) : void;
      
      function switchPayment() : void;
   }
}

