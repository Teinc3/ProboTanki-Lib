package §+!e§
{
   import §7!8§.§<c§;
   import alternativa.osgi.OSGi;
   import alternativa.osgi.service.display.IDisplay;
   import alternativa.tanks.battle.BattleService;
   import alternativa.tanks.battle.events.§##`§;
   import alternativa.tanks.battle.events.BattleEventDispatcher;
   import alternativa.tanks.battle.events.§in for return§;
   import alternativa.tanks.battle.events.§set var native§;
   import alternativa.tanks.battle.events.§throw package continue§;
   import alternativa.tanks.battle.objects.tank.Tank;
   import alternativa.tanks.models.tank.§finally package finally§;
   import alternativa.tanks.service.settings.keybinding.§&7§;
   import alternativa.tanks.service.settings.keybinding.KeysBindingService;
   import alternativa.tanks.services.battlegui.BattleGUIService;
   import alternativa.tanks.services.battleinput.BattleInputService;
   import §false for true§.§extends§;
   import §false for true§.§native while§;
   import flash.events.Event;
   import flash.events.KeyboardEvent;
   import flash.events.MouseEvent;
   import flash.ui.Keyboard;
   import §in var break§.§%"^§;
   import §in var break§.§native else§;
   import platform.client.fp10.core.type.AutoClosable;
   import projects.tanks.clients.flash.commons.services.layout.LobbyLayoutServiceEvent;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.dialogs.IDialogsService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.dialogwindowdispatcher.DialogWindowsDispatcherServiceEvent;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.dialogwindowdispatcher.IDialogWindowsDispatcherService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.fullscreen.FullscreenStateService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.layout.ILobbyLayoutService;
   
   public class §each set each§ implements AutoClosable, §throw package continue§
   {
      [Inject]
      public static var display:IDisplay;
      
      [Inject]
      public static var battleEventDispatcher:BattleEventDispatcher;
      
      [Inject]
      public static var §^"<§:BattleInputService;
      
      [Inject]
      public static var lobbyLayoutService:ILobbyLayoutService;
      
      [Inject]
      public static var dialogWindowsDispatcherService:IDialogWindowsDispatcherService;
      
      [Inject]
      public static var dialogsService:IDialogsService;
      
      [Inject]
      public static var battleService:BattleService;
      
      [Inject]
      public static var §finally set§:BattleGUIService;
      
      [Inject]
      public static var fullscreenStateService:FullscreenStateService;
      
      [Inject]
      public static var §5!$§:KeysBindingService;
      
      private var §class set use§:Tank;
      
      private var §break extends§:§finally package finally§;
      
      private var §import var break§:Boolean;
      
      private var §const switch§:Boolean;
      
      private var §dynamic with§:Boolean;
      
      private var §native package var§:Boolean;
      
      public function §each set each§(param1:Tank, param2:§finally package finally§, param3:Boolean)
      {
         super();
         this.§class set use§ = param1;
         this.§break extends§ = param2;
         this.§import var break§ = param3;
         this.init();
      }
      
      private function init() : void
      {
         display.stage.addEventListener(KeyboardEvent.KEY_DOWN,this.onKeyDown);
         display.stage.addEventListener(Event.ACTIVATE,this.§#e§);
         display.stage.addEventListener(Event.DEACTIVATE,this.§57§);
         battleEventDispatcher.§set for each§(§native else§,this);
         battleEventDispatcher.§set for each§(§%"^§,this);
         battleEventDispatcher.§set for each§(§native while§,this);
         battleEventDispatcher.§set for each§(§extends§,this);
         lobbyLayoutService.addEventListener(LobbyLayoutServiceEvent.BEGIN_LAYOUT_SWITCH,this.§false package catch§);
         lobbyLayoutService.addEventListener(LobbyLayoutServiceEvent.END_LAYOUT_SWITCH,this.onEndLayoutSwitch);
         dialogWindowsDispatcherService.addEventListener(DialogWindowsDispatcherServiceEvent.OPEN,this.§extends use§);
         dialogWindowsDispatcherService.addEventListener(DialogWindowsDispatcherServiceEvent.CLOSE,this.§2#v§);
         §finally set§.§native const import§().addEventListener(MouseEvent.CLICK,this.§import package else§);
      }
      
      private function onKeyDown(param1:KeyboardEvent) : void
      {
         if(this.§import var break§)
         {
            this.§else package function§(param1);
         }
         else
         {
            this.§?!i§(param1);
         }
      }
      
      private function §else package function§(param1:KeyboardEvent) : void
      {
         if(param1.keyCode != Keyboard.ALTERNATE && !param1.altKey && !§^"<§.§false set true§())
         {
            this.§import do§();
         }
      }
      
      private function §import do§() : void
      {
         this.§native package var§ = false;
         this.§var var in§();
      }
      
      private function §var var in§() : void
      {
         if(!this.§import var break§ || this.§native package var§ || lobbyLayoutService.isWindowOpenOverBattle())
         {
            return;
         }
         this.§import var break§ = false;
         battleService.§7#P§().setFocus();
         var _loc1_:§<c§ = §<c§(OSGi.getInstance().getService(§<c§));
         _loc1_.§var var in§();
         battleEventDispatcher.dispatchEvent(new §set var native§());
      }
      
      private function §?!i§(param1:KeyboardEvent) : void
      {
         var _loc2_:§&7§ = null;
         if(!§^"<§.§false set true§() && !this.§const switch§ && !this.§dynamic with§)
         {
            _loc2_ = §5!$§.§&!<§(param1.keyCode);
            if(_loc2_ == §&7§.BATTLE_PAUSE)
            {
               this.§native package var§ = true;
               this.§get const try§();
            }
         }
      }
      
      private function §get const try§(param1:Boolean = true) : void
      {
         if(this.§import var break§)
         {
            return;
         }
         this.§import var break§ = true;
         var _loc2_:§<c§ = §<c§(OSGi.getInstance().getService(§<c§));
         _loc2_.§get const try§();
         battleEventDispatcher.dispatchEvent(new §##`§(this.§break extends§.getTimeLeft()));
         if(param1)
         {
            battleEventDispatcher.dispatchEvent(new §in for return§(this.§break extends§.getTimeLeft()));
         }
      }
      
      private function §extends use§(param1:DialogWindowsDispatcherServiceEvent) : void
      {
         this.§get const try§(false);
      }
      
      private function §2#v§(param1:DialogWindowsDispatcherServiceEvent) : void
      {
         this.§var var in§();
      }
      
      private function §#e§(param1:Event) : void
      {
         this.§var var in§();
      }
      
      private function §57§(param1:Event) : void
      {
         if(!fullscreenStateService.isFullscreen())
         {
            this.§get const try§();
         }
      }
      
      private function §false package catch§(param1:LobbyLayoutServiceEvent) : void
      {
         this.§get const try§(false);
      }
      
      private function onEndLayoutSwitch(param1:LobbyLayoutServiceEvent) : void
      {
         if(!lobbyLayoutService.isWindowOpenOverBattle())
         {
            this.§var var in§();
         }
      }
      
      private function §import package else§(param1:MouseEvent) : void
      {
         if(this.§import var break§ && this.§native package var§)
         {
            this.§import do§();
         }
      }
      
      public function handleBattleEvent(param1:Object) : void
      {
         if(param1 is §native else§)
         {
            this.§const switch§ = true;
         }
         else if(param1 is §%"^§)
         {
            this.§const switch§ = false;
         }
         else if(param1 is §native while§)
         {
            this.§dynamic with§ = true;
            this.§import do§();
         }
         else if(param1 is §extends§)
         {
            this.§dynamic with§ = false;
         }
      }
      
      [Obfuscation(rename="false")]
      public function close() : void
      {
         display.stage.removeEventListener(KeyboardEvent.KEY_DOWN,this.onKeyDown);
         display.stage.removeEventListener(Event.ACTIVATE,this.§#e§);
         display.stage.removeEventListener(Event.DEACTIVATE,this.§57§);
         battleEventDispatcher.§7!3§(§native else§,this);
         battleEventDispatcher.§7!3§(§%"^§,this);
         battleEventDispatcher.§7!3§(§native while§,this);
         battleEventDispatcher.§7!3§(§extends§,this);
         dialogWindowsDispatcherService.removeEventListener(DialogWindowsDispatcherServiceEvent.OPEN,this.§extends use§);
         dialogWindowsDispatcherService.removeEventListener(DialogWindowsDispatcherServiceEvent.CLOSE,this.§2#v§);
         lobbyLayoutService.removeEventListener(LobbyLayoutServiceEvent.BEGIN_LAYOUT_SWITCH,this.§false package catch§);
         lobbyLayoutService.removeEventListener(LobbyLayoutServiceEvent.END_LAYOUT_SWITCH,this.onEndLayoutSwitch);
         §finally set§.§native const import§().removeEventListener(MouseEvent.CLICK,this.§import package else§);
         this.§class set use§ = null;
      }
   }
}

