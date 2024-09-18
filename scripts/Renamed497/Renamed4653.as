package Renamed2615
{
   import alternativa.tanks.help.IHelpService;
   import Renamed351.ControlsHelper;
   import platform.client.fp10.core.type.AutoClosable;
   import projects.tanks.client.commons.models.layout.LayoutState;
   import projects.tanks.clients.flash.commons.services.layout.LobbyLayoutServiceEvent;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.layout.ILobbyLayoutService;
   
   public class Renamed4653 implements AutoClosable
   {
      [Inject]
      public static var helpService:IHelpService;
      
      [Inject]
      public static var lobbyLayoutService:ILobbyLayoutService;
      
      private var controlsHelper:ControlsHelper;
      
      public function Renamed4653()
      {
         super();
         this.init();
      }
      
      private static function Renamed5988(param1:LobbyLayoutServiceEvent) : void
      {
         if(param1.state == LayoutState.BATTLE)
         {
            Renamed9717();
         }
      }
      
      private static function Renamed9717() : void
      {
         helpService.unregisterHelper(ControlsHelper.Renamed8082,ControlsHelper.Renamed8083);
      }
      
      private function init() : void
      {
         this.controlsHelper = new ControlsHelper();
         lobbyLayoutService.addEventListener(LobbyLayoutServiceEvent.BEGIN_LAYOUT_SWITCH,Renamed5988);
         lobbyLayoutService.addEventListener(LobbyLayoutServiceEvent.END_LAYOUT_SWITCH,this.onEndLayoutSwitch);
      }
      
      private function onEndLayoutSwitch(param1:LobbyLayoutServiceEvent) : void
      {
         if(param1.state == LayoutState.BATTLE)
         {
            this.Renamed9718();
         }
      }
      
      private function Renamed9718() : void
      {
         helpService.registerHelper(ControlsHelper.Renamed8082,ControlsHelper.Renamed8083,this.controlsHelper,true);
      }
      
      [Obfuscation(rename="false")]
      public function close() : void
      {
         lobbyLayoutService.removeEventListener(LobbyLayoutServiceEvent.BEGIN_LAYOUT_SWITCH,Renamed5988);
         lobbyLayoutService.removeEventListener(LobbyLayoutServiceEvent.END_LAYOUT_SWITCH,this.onEndLayoutSwitch);
         Renamed9717();
         this.controlsHelper = null;
      }
   }
}

