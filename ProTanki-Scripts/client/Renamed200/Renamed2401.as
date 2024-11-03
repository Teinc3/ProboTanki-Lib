package Renamed200
{
   import alternativa.tanks.battle.BattleService;
   import alternativa.tanks.services.battleinput.BattleInputService;
   import alternativa.tanks.services.battleinput.Renamed2410;
   import projects.tanks.clients.flash.commons.services.layout.LobbyLayoutServiceEvent;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.blur.BlurServiceEvent;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.blur.IBlurService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.dialogs.IDialogsService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.dialogwindowdispatcher.DialogWindowsDispatcherServiceEvent;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.dialogwindowdispatcher.IDialogWindowsDispatcherService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.layout.ILobbyLayoutService;
   import scpacker.utils.Renamed5997;
   
   public class Renamed2401
   {
      [Inject]
      public static var dialogWindowsDispatcherService:IDialogWindowsDispatcherService;
      
      [Inject]
      public static var lobbyLayoutService:ILobbyLayoutService;
      
      [Inject]
      public static var dialogService:IDialogsService;
      
      [Inject]
      public static var blurService:IBlurService;
      
      [Inject]
      public static var Renamed718:BattleInputService;
      
      [Inject]
      public static var battleService:BattleService;
      
      private var Renamed5998:Renamed5997;
      
      public function Renamed2401()
      {
         this.Renamed5998 = new Renamed5997();
         super();
         battleService.Renamed619().Renamed815(this.Renamed5998);
         init();
      }
      
      private static function init() : void
      {
         dialogWindowsDispatcherService.addEventListener(DialogWindowsDispatcherServiceEvent.OPEN,Renamed5989);
         dialogWindowsDispatcherService.addEventListener(DialogWindowsDispatcherServiceEvent.CLOSE,Renamed5990);
         lobbyLayoutService.addEventListener(LobbyLayoutServiceEvent.BEGIN_LAYOUT_SWITCH,Renamed5988);
         lobbyLayoutService.addEventListener(LobbyLayoutServiceEvent.END_LAYOUT_SWITCH,onEndLayoutSwitch);
         blurService.addEventListener(BlurServiceEvent.CLICK_OVERLAY_BATTLE_CONTENT,Renamed5999);
         if(!lobbyLayoutService.isSwitchInProgress())
         {
            Renamed5990();
         }
      }
      
      private static function Renamed5989(param1:DialogWindowsDispatcherServiceEvent = null) : void
      {
         Renamed718.lock(Renamed2410.Renamed2508);
      }
      
      private static function Renamed5990(param1:DialogWindowsDispatcherServiceEvent = null) : void
      {
         if(!lobbyLayoutService.isWindowOpenOverBattle())
         {
            Renamed718.unlock(Renamed2410.Renamed2508);
            battleService.Renamed622().setFocus();
         }
      }
      
      private static function Renamed5988(param1:LobbyLayoutServiceEvent) : void
      {
         blurService.blurBattleContent();
         Renamed5989();
      }
      
      private static function onEndLayoutSwitch(param1:LobbyLayoutServiceEvent) : void
      {
         if(!lobbyLayoutService.isWindowOpenOverBattle())
         {
            blurService.unblurBattleContent();
            Renamed5990();
         }
      }
      
      private static function Renamed5999(param1:BlurServiceEvent) : void
      {
         lobbyLayoutService.closePopupOverBattle();
      }
      
      [Obfuscation(rename="false")]
      public function close() : void
      {
         battleService.Renamed619().Renamed816(this.Renamed5998);
         dialogWindowsDispatcherService.removeEventListener(DialogWindowsDispatcherServiceEvent.OPEN,Renamed5989);
         dialogWindowsDispatcherService.removeEventListener(DialogWindowsDispatcherServiceEvent.CLOSE,Renamed5990);
         lobbyLayoutService.removeEventListener(LobbyLayoutServiceEvent.BEGIN_LAYOUT_SWITCH,Renamed5988);
         lobbyLayoutService.removeEventListener(LobbyLayoutServiceEvent.END_LAYOUT_SWITCH,onEndLayoutSwitch);
         blurService.removeEventListener(BlurServiceEvent.CLICK_OVERLAY_BATTLE_CONTENT,Renamed5999);
         blurService.unblurBattleContent();
      }
   }
}

