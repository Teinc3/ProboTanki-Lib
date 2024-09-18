package §+!e§
{
   import alternativa.tanks.battle.BattleService;
   import alternativa.tanks.services.battleinput.BattleInputService;
   import alternativa.tanks.services.battleinput.§class const while§;
   import projects.tanks.clients.flash.commons.services.layout.LobbyLayoutServiceEvent;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.blur.BlurServiceEvent;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.blur.IBlurService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.dialogs.IDialogsService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.dialogwindowdispatcher.DialogWindowsDispatcherServiceEvent;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.dialogwindowdispatcher.IDialogWindowsDispatcherService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.layout.ILobbyLayoutService;
   import scpacker.utils.§with var return§;
   
   public class §[@§
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
      public static var §^"<§:BattleInputService;
      
      [Inject]
      public static var battleService:BattleService;
      
      private var §9l§:§with var return§;
      
      public function §[@§()
      {
         this.§9l§ = new §with var return§();
         super();
         battleService.§'x§().§%#9§(this.§9l§);
         init();
      }
      
      private static function init() : void
      {
         dialogWindowsDispatcherService.addEventListener(DialogWindowsDispatcherServiceEvent.OPEN,§extends use§);
         dialogWindowsDispatcherService.addEventListener(DialogWindowsDispatcherServiceEvent.CLOSE,§2#v§);
         lobbyLayoutService.addEventListener(LobbyLayoutServiceEvent.BEGIN_LAYOUT_SWITCH,§false package catch§);
         lobbyLayoutService.addEventListener(LobbyLayoutServiceEvent.END_LAYOUT_SWITCH,onEndLayoutSwitch);
         blurService.addEventListener(BlurServiceEvent.CLICK_OVERLAY_BATTLE_CONTENT,§ "_§);
         if(!lobbyLayoutService.isSwitchInProgress())
         {
            §2#v§();
         }
      }
      
      private static function §extends use§(param1:DialogWindowsDispatcherServiceEvent = null) : void
      {
         §^"<§.lock(§class const while§.§7!d§);
      }
      
      private static function §2#v§(param1:DialogWindowsDispatcherServiceEvent = null) : void
      {
         if(!lobbyLayoutService.isWindowOpenOverBattle())
         {
            §^"<§.unlock(§class const while§.§7!d§);
            battleService.§7#P§().setFocus();
         }
      }
      
      private static function §false package catch§(param1:LobbyLayoutServiceEvent) : void
      {
         blurService.blurBattleContent();
         §extends use§();
      }
      
      private static function onEndLayoutSwitch(param1:LobbyLayoutServiceEvent) : void
      {
         if(!lobbyLayoutService.isWindowOpenOverBattle())
         {
            blurService.unblurBattleContent();
            §2#v§();
         }
      }
      
      private static function § "_§(param1:BlurServiceEvent) : void
      {
         lobbyLayoutService.closePopupOverBattle();
      }
      
      [Obfuscation(rename="false")]
      public function close() : void
      {
         battleService.§'x§().§%"7§(this.§9l§);
         dialogWindowsDispatcherService.removeEventListener(DialogWindowsDispatcherServiceEvent.OPEN,§extends use§);
         dialogWindowsDispatcherService.removeEventListener(DialogWindowsDispatcherServiceEvent.CLOSE,§2#v§);
         lobbyLayoutService.removeEventListener(LobbyLayoutServiceEvent.BEGIN_LAYOUT_SWITCH,§false package catch§);
         lobbyLayoutService.removeEventListener(LobbyLayoutServiceEvent.END_LAYOUT_SWITCH,onEndLayoutSwitch);
         blurService.removeEventListener(BlurServiceEvent.CLICK_OVERLAY_BATTLE_CONTENT,§ "_§);
         blurService.unblurBattleContent();
      }
   }
}

