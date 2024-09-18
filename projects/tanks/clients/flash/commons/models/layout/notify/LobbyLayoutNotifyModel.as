package projects.tanks.clients.flash.commons.models.layout.notify
{
   import alternativa.tanks.loader.ILoaderWindowService;
   import Renamed350.Renamed4449;
   import Renamed350.Renamed4450;
   import flash.utils.clearTimeout;
   import flash.utils.setTimeout;
   import projects.tanks.client.commons.models.layout.LayoutState;
   import projects.tanks.clients.flash.commons.services.layout.LobbyLayoutService;
   import projects.tanks.clients.flash.commons.services.layout.LobbyLayoutServiceEvent;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.layout.ILobbyLayoutService;
   
   public class LobbyLayoutNotifyModel extends Renamed4450 implements Renamed4449, ILobbyLayoutNotify
   {
      [Inject]
      public static var lobbyLayoutService:ILobbyLayoutService;
      
      [Inject]
      public static var loaderWindowService:ILoaderWindowService;
      
      private var _timeOutShowLoader:uint;
      
      private var inProgress:Boolean = false;
      
      private var origin:LayoutState;
      
      private var lastState:LayoutState;
      
      private var _transitionFormLobbyIntoBattle:Boolean;
      
      public function LobbyLayoutNotifyModel()
      {
         super();
      }
      
      public function beginLayoutSwitch(param1:LayoutState) : void
      {
         if(param1 != null)
         {
            this.lastState = param1;
         }
         if(this.origin == LayoutState.BATTLE_SELECT && param1 == LayoutState.BATTLE)
         {
            this._transitionFormLobbyIntoBattle = true;
         }
         this.beginSwitch();
      }
      
      public function endLayoutSwitch(param1:LayoutState, param2:LayoutState) : void
      {
         this.origin = param1;
         this.lastState = param2;
         this.endSwitch();
      }
      
      public function layoutSwitchPredicted() : void
      {
         this.beginSwitch();
      }
      
      public function cancelPredictedLayoutSwitch() : void
      {
         this.endSwitch();
      }
      
      public function isSwitchInProgress() : Boolean
      {
         return this.inProgress;
      }
      
      public function getCurrentState() : LayoutState
      {
         return this.lastState;
      }
      
      private function beginSwitch() : void
      {
         var _loc1_:LobbyLayoutService = null;
         if(!this.inProgress)
         {
            this.inProgress = true;
            _loc1_ = LobbyLayoutService(lobbyLayoutService);
            clearTimeout(this._timeOutShowLoader);
            this._timeOutShowLoader = setTimeout(this.showLoader,600);
            _loc1_.dispatchEvent(new LobbyLayoutServiceEvent(LobbyLayoutServiceEvent.BEGIN_LAYOUT_SWITCH,this.lastState));
         }
      }
      
      private function endSwitch() : void
      {
         if(this.inProgress)
         {
            this.inProgress = false;
            clearTimeout(this._timeOutShowLoader);
            lobbyLayoutService.dispatchEvent(new LobbyLayoutServiceEvent(LobbyLayoutServiceEvent.END_LAYOUT_SWITCH,this.lastState));
            this.hideLoader();
         }
      }
      
      private function showLoader() : void
      {
         loaderWindowService.unlockLoaderWindow();
         loaderWindowService.showLoaderWindow();
      }
      
      private function hideLoader() : void
      {
         loaderWindowService.lockLoaderWindow();
         loaderWindowService.hideLoaderWindow();
      }
      
      public function inBattle() : Boolean
      {
         return this.origin == LayoutState.BATTLE;
      }
   }
}

