package §-A§
{
   import §&#`§.§2!6§;
   import §+"C§.§79§;
   import §+"C§.§with const continue§;
   import alternativa.tanks.gui.IDestroyWindow;
   import platform.client.fp10.core.model.ObjectUnloadListener;
   import projects.tanks.client.commons.models.layout.LayoutState;
   import projects.tanks.clients.flash.commons.services.layout.LobbyLayoutServiceEvent;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.layout.ILobbyLayoutService;
   
   public class § !e§ extends §with const continue§ implements §79§, ObjectUnloadListener
   {
      [Inject]
      public static var lobbyLayoutService:ILobbyLayoutService;
      
      private static const §if set function§:int = 1000;
      
      private var §return for§:Date;
      
      private var §default var with§:int;
      
      private var scoreBonusInPercent:int;
      
      public function § !e§()
      {
         super();
      }
      
      public function §continue for final§(param1:int, param2:int, param3:int) : void
      {
         this.§return for§ = new Date(new Date().getTime() + param1 * §if set function§);
         this.§default var with§ = param2;
         this.scoreBonusInPercent = param3;
         if(lobbyLayoutService.isSwitchInProgress() || lobbyLayoutService.getCurrentState() == LayoutState.BATTLE)
         {
            this.§in set with§();
         }
         else
         {
            this.§'!'§();
         }
      }
      
      private function §in set with§() : void
      {
         lobbyLayoutService.addEventListener(LobbyLayoutServiceEvent.END_LAYOUT_SWITCH,this.onEndLayoutSwitch);
      }
      
      private function onEndLayoutSwitch(param1:LobbyLayoutServiceEvent) : void
      {
         if(param1.state != LayoutState.BATTLE)
         {
            lobbyLayoutService.removeEventListener(LobbyLayoutServiceEvent.END_LAYOUT_SWITCH,this.onEndLayoutSwitch);
            this.§'!'§();
         }
      }
      
      private function §'!'§() : void
      {
         var _loc1_:IDestroyWindow = null;
         _loc1_ = new §2!6§(this.§return for§,this.§default var with§,this.scoreBonusInPercent);
      }
      
      public function objectUnloaded() : void
      {
         lobbyLayoutService.removeEventListener(LobbyLayoutServiceEvent.END_LAYOUT_SWITCH,getFunctionWrapper(this.onEndLayoutSwitch));
         var _loc1_:IDestroyWindow = IDestroyWindow(getData(IDestroyWindow));
         if(_loc1_ != null)
         {
            _loc1_.destroy();
         }
      }
   }
}

