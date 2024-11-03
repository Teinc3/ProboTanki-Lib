package Renamed218
{
   import Renamed191.Renamed4799;
   import Renamed4800.Renamed4801;
   import Renamed4800.Renamed6045;
   import alternativa.tanks.gui.IDestroyWindow;
   import platform.client.fp10.core.model.ObjectUnloadListener;
   import projects.tanks.client.commons.models.layout.LayoutState;
   import projects.tanks.clients.flash.commons.services.layout.LobbyLayoutServiceEvent;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.layout.ILobbyLayoutService;
   
   public class Renamed4802 extends Renamed6045 implements Renamed4801, ObjectUnloadListener
   {
      [Inject]
      public static var lobbyLayoutService:ILobbyLayoutService;
      
      private static const Renamed2025:int = 1000;
      
      private var Renamed6261:Date;
      
      private var Renamed6262:int;
      
      private var scoreBonusInPercent:int;
      
      public function Renamed4802()
      {
         super();
      }
      
      public function Renamed6044(param1:int, param2:int, param3:int) : void
      {
         this.Renamed6261 = new Date(new Date().getTime() + param1 * Renamed2025);
         this.Renamed6262 = param2;
         this.scoreBonusInPercent = param3;
         if(lobbyLayoutService.isSwitchInProgress() || lobbyLayoutService.getCurrentState() == LayoutState.BATTLE)
         {
            this.Renamed6263();
         }
         else
         {
            this.Renamed6264();
         }
      }
      
      private function Renamed6263() : void
      {
         lobbyLayoutService.addEventListener(LobbyLayoutServiceEvent.END_LAYOUT_SWITCH,this.onEndLayoutSwitch);
      }
      
      private function onEndLayoutSwitch(param1:LobbyLayoutServiceEvent) : void
      {
         if(param1.state != LayoutState.BATTLE)
         {
            lobbyLayoutService.removeEventListener(LobbyLayoutServiceEvent.END_LAYOUT_SWITCH,this.onEndLayoutSwitch);
            this.Renamed6264();
         }
      }
      
      private function Renamed6264() : void
      {
         var _loc1_:IDestroyWindow = null;
         _loc1_ = new Renamed4799(this.Renamed6261,this.Renamed6262,this.scoreBonusInPercent);
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

