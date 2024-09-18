package projects.tanks.clients.flash.commons.models.layout
{
   import platform.client.fp10.core.model.ObjectLoadListener;
   import platform.client.fp10.core.model.ObjectUnloadListener;
   import projects.tanks.client.commons.models.layout.LayoutState;
   import projects.tanks.client.commons.models.layout.§catch var set§;
   import projects.tanks.client.commons.models.layout.§extends try§;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.layout.ILobbyLayoutService;
   
   public class LobbyLayoutModel extends §extends try§ implements §catch var set§, ILobbyLayout, ObjectLoadListener, ObjectUnloadListener
   {
      [Inject]
      public static var lobbyLayoutService:ILobbyLayoutService;
      
      public function LobbyLayoutModel()
      {
         super();
      }
      
      public function switchGarage() : void
      {
         server.switchGarage();
      }
      
      public function switchBattleSelect() : void
      {
         server.switchBattleSelect();
      }
      
      public function switchPayment() : void
      {
         server.switchPayment();
      }
      
      public function exitFromBattle() : void
      {
         server.exitFromBattle(LayoutState.BATTLE_SELECT);
      }
      
      public function exitFromBattleToState(param1:LayoutState) : void
      {
         server.exitFromBattle(param1);
      }
      
      public function objectLoaded() : void
      {
      }
      
      public function objectUnloaded() : void
      {
      }
   }
}

