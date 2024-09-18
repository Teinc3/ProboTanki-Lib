package §`"b§
{
   import alternativa.tanks.help.IHelpService;
   import §else for break§.ControlsHelper;
   import platform.client.fp10.core.type.AutoClosable;
   import projects.tanks.client.commons.models.layout.LayoutState;
   import projects.tanks.clients.flash.commons.services.layout.LobbyLayoutServiceEvent;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.layout.ILobbyLayoutService;
   
   public class §function set class§ implements AutoClosable
   {
      [Inject]
      public static var helpService:IHelpService;
      
      [Inject]
      public static var lobbyLayoutService:ILobbyLayoutService;
      
      private var controlsHelper:ControlsHelper;
      
      public function §function set class§()
      {
         super();
         this.init();
      }
      
      private static function §false package catch§(param1:LobbyLayoutServiceEvent) : void
      {
         if(param1.state == LayoutState.BATTLE)
         {
            §package const break§();
         }
      }
      
      private static function §package const break§() : void
      {
         helpService.unregisterHelper(ControlsHelper.§<;§,ControlsHelper.§include set static§);
      }
      
      private function init() : void
      {
         this.controlsHelper = new ControlsHelper();
         lobbyLayoutService.addEventListener(LobbyLayoutServiceEvent.BEGIN_LAYOUT_SWITCH,§false package catch§);
         lobbyLayoutService.addEventListener(LobbyLayoutServiceEvent.END_LAYOUT_SWITCH,this.onEndLayoutSwitch);
      }
      
      private function onEndLayoutSwitch(param1:LobbyLayoutServiceEvent) : void
      {
         if(param1.state == LayoutState.BATTLE)
         {
            this.§switch switch§();
         }
      }
      
      private function §switch switch§() : void
      {
         helpService.registerHelper(ControlsHelper.§<;§,ControlsHelper.§include set static§,this.controlsHelper,true);
      }
      
      [Obfuscation(rename="false")]
      public function close() : void
      {
         lobbyLayoutService.removeEventListener(LobbyLayoutServiceEvent.BEGIN_LAYOUT_SWITCH,§false package catch§);
         lobbyLayoutService.removeEventListener(LobbyLayoutServiceEvent.END_LAYOUT_SWITCH,this.onEndLayoutSwitch);
         §package const break§();
         this.controlsHelper = null;
      }
   }
}

