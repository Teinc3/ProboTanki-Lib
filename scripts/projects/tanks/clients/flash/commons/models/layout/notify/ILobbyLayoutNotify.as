package projects.tanks.clients.flash.commons.models.layout.notify
{
   import projects.tanks.client.commons.models.layout.LayoutState;
   
   public interface ILobbyLayoutNotify
   {
      function layoutSwitchPredicted() : void;
      
      function isSwitchInProgress() : Boolean;
      
      function getCurrentState() : LayoutState;
      
      function inBattle() : Boolean;
   }
}

