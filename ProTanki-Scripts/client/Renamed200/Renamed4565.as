package Renamed200
{
   import Renamed264.Renamed508;
   import alternativa.osgi.OSGi;
   import alternativa.osgi.service.display.IDisplay;
   import alternativa.tanks.battle.BattleService;
   import alternativa.tanks.battle.events.Renamed874;
   import alternativa.tanks.battle.events.BattleEventDispatcher;
   import alternativa.tanks.battle.events.Renamed897;
   import alternativa.tanks.battle.events.Renamed900;
   import alternativa.tanks.battle.events.Renamed511;
   import alternativa.tanks.battle.objects.tank.Tank;
   import alternativa.tanks.models.tank.Renamed3010;
   import alternativa.tanks.service.settings.keybinding.Renamed717;
   import alternativa.tanks.service.settings.keybinding.KeysBindingService;
   import alternativa.tanks.services.battlegui.BattleGUIService;
   import alternativa.tanks.services.battleinput.BattleInputService;
   import Renamed359.Renamed5958;
   import Renamed359.Renamed5959;
   import flash.events.Event;
   import flash.events.KeyboardEvent;
   import flash.events.MouseEvent;
   import flash.ui.Keyboard;
   import Renamed397.Renamed5966;
   import Renamed397.Renamed5967;
   import platform.client.fp10.core.type.AutoClosable;
   import projects.tanks.clients.flash.commons.services.layout.LobbyLayoutServiceEvent;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.dialogs.IDialogsService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.dialogwindowdispatcher.DialogWindowsDispatcherServiceEvent;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.dialogwindowdispatcher.IDialogWindowsDispatcherService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.fullscreen.FullscreenStateService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.layout.ILobbyLayoutService;
   
   public class Renamed4565 implements AutoClosable, Renamed511
   {
      [Inject]
      public static var display:IDisplay;
      
      [Inject]
      public static var battleEventDispatcher:BattleEventDispatcher;
      
      [Inject]
      public static var Renamed718:BattleInputService;
      
      [Inject]
      public static var lobbyLayoutService:ILobbyLayoutService;
      
      [Inject]
      public static var dialogWindowsDispatcherService:IDialogWindowsDispatcherService;
      
      [Inject]
      public static var dialogsService:IDialogsService;
      
      [Inject]
      public static var battleService:BattleService;
      
      [Inject]
      public static var Renamed4729:BattleGUIService;
      
      [Inject]
      public static var fullscreenStateService:FullscreenStateService;
      
      [Inject]
      public static var Renamed719:KeysBindingService;
      
      private var Renamed5981:Tank;
      
      private var Renamed5982:Renamed3010;
      
      private var Renamed5983:Boolean;
      
      private var Renamed5984:Boolean;
      
      private var Renamed5975:Boolean;
      
      private var Renamed5985:Boolean;
      
      public function Renamed4565(param1:Tank, param2:Renamed3010, param3:Boolean)
      {
         super();
         this.Renamed5981 = param1;
         this.Renamed5982 = param2;
         this.Renamed5983 = param3;
         this.init();
      }
      
      private function init() : void
      {
         display.stage.addEventListener(KeyboardEvent.KEY_DOWN,this.onKeyDown);
         display.stage.addEventListener(Event.ACTIVATE,this.Renamed5986);
         display.stage.addEventListener(Event.DEACTIVATE,this.Renamed5987);
         battleEventDispatcher.Renamed539(Renamed5967,this);
         battleEventDispatcher.Renamed539(Renamed5966,this);
         battleEventDispatcher.Renamed539(Renamed5959,this);
         battleEventDispatcher.Renamed539(Renamed5958,this);
         lobbyLayoutService.addEventListener(LobbyLayoutServiceEvent.BEGIN_LAYOUT_SWITCH,this.Renamed5988);
         lobbyLayoutService.addEventListener(LobbyLayoutServiceEvent.END_LAYOUT_SWITCH,this.onEndLayoutSwitch);
         dialogWindowsDispatcherService.addEventListener(DialogWindowsDispatcherServiceEvent.OPEN,this.Renamed5989);
         dialogWindowsDispatcherService.addEventListener(DialogWindowsDispatcherServiceEvent.CLOSE,this.Renamed5990);
         Renamed4729.Renamed2492().addEventListener(MouseEvent.CLICK,this.Renamed5991);
      }
      
      private function onKeyDown(param1:KeyboardEvent) : void
      {
         if(this.Renamed5983)
         {
            this.Renamed5992(param1);
         }
         else
         {
            this.Renamed5993(param1);
         }
      }
      
      private function Renamed5992(param1:KeyboardEvent) : void
      {
         if(param1.keyCode != Keyboard.ALTERNATE && !param1.altKey && !Renamed718.Renamed728())
         {
            this.Renamed5994();
         }
      }
      
      private function Renamed5994() : void
      {
         this.Renamed5985 = false;
         this.Renamed5995();
      }
      
      private function Renamed5995() : void
      {
         if(!this.Renamed5983 || this.Renamed5985 || lobbyLayoutService.isWindowOpenOverBattle())
         {
            return;
         }
         this.Renamed5983 = false;
         battleService.Renamed622().setFocus();
         var _loc1_:Renamed508 = Renamed508(OSGi.getInstance().getService(Renamed508));
         _loc1_.Renamed5995();
         battleEventDispatcher.dispatchEvent(new Renamed900());
      }
      
      private function Renamed5993(param1:KeyboardEvent) : void
      {
         var _loc2_:Renamed717 = null;
         if(!Renamed718.Renamed728() && !this.Renamed5984 && !this.Renamed5975)
         {
            _loc2_ = Renamed719.Renamed729(param1.keyCode);
            if(_loc2_ == Renamed717.BATTLE_PAUSE)
            {
               this.Renamed5985 = true;
               this.Renamed5996();
            }
         }
      }
      
      private function Renamed5996(param1:Boolean = true) : void
      {
         if(this.Renamed5983)
         {
            return;
         }
         this.Renamed5983 = true;
         var _loc2_:Renamed508 = Renamed508(OSGi.getInstance().getService(Renamed508));
         _loc2_.Renamed5996();
         battleEventDispatcher.dispatchEvent(new Renamed874(this.Renamed5982.getTimeLeft()));
         if(param1)
         {
            battleEventDispatcher.dispatchEvent(new Renamed897(this.Renamed5982.getTimeLeft()));
         }
      }
      
      private function Renamed5989(param1:DialogWindowsDispatcherServiceEvent) : void
      {
         this.Renamed5996(false);
      }
      
      private function Renamed5990(param1:DialogWindowsDispatcherServiceEvent) : void
      {
         this.Renamed5995();
      }
      
      private function Renamed5986(param1:Event) : void
      {
         this.Renamed5995();
      }
      
      private function Renamed5987(param1:Event) : void
      {
         if(!fullscreenStateService.isFullscreen())
         {
            this.Renamed5996();
         }
      }
      
      private function Renamed5988(param1:LobbyLayoutServiceEvent) : void
      {
         this.Renamed5996(false);
      }
      
      private function onEndLayoutSwitch(param1:LobbyLayoutServiceEvent) : void
      {
         if(!lobbyLayoutService.isWindowOpenOverBattle())
         {
            this.Renamed5995();
         }
      }
      
      private function Renamed5991(param1:MouseEvent) : void
      {
         if(this.Renamed5983 && this.Renamed5985)
         {
            this.Renamed5994();
         }
      }
      
      public function handleBattleEvent(param1:Object) : void
      {
         if(param1 is Renamed5967)
         {
            this.Renamed5984 = true;
         }
         else if(param1 is Renamed5966)
         {
            this.Renamed5984 = false;
         }
         else if(param1 is Renamed5959)
         {
            this.Renamed5975 = true;
            this.Renamed5994();
         }
         else if(param1 is Renamed5958)
         {
            this.Renamed5975 = false;
         }
      }
      
      [Obfuscation(rename="false")]
      public function close() : void
      {
         display.stage.removeEventListener(KeyboardEvent.KEY_DOWN,this.onKeyDown);
         display.stage.removeEventListener(Event.ACTIVATE,this.Renamed5986);
         display.stage.removeEventListener(Event.DEACTIVATE,this.Renamed5987);
         battleEventDispatcher.Renamed866(Renamed5967,this);
         battleEventDispatcher.Renamed866(Renamed5966,this);
         battleEventDispatcher.Renamed866(Renamed5959,this);
         battleEventDispatcher.Renamed866(Renamed5958,this);
         dialogWindowsDispatcherService.removeEventListener(DialogWindowsDispatcherServiceEvent.OPEN,this.Renamed5989);
         dialogWindowsDispatcherService.removeEventListener(DialogWindowsDispatcherServiceEvent.CLOSE,this.Renamed5990);
         lobbyLayoutService.removeEventListener(LobbyLayoutServiceEvent.BEGIN_LAYOUT_SWITCH,this.Renamed5988);
         lobbyLayoutService.removeEventListener(LobbyLayoutServiceEvent.END_LAYOUT_SWITCH,this.onEndLayoutSwitch);
         Renamed4729.Renamed2492().removeEventListener(MouseEvent.CLICK,this.Renamed5991);
         this.Renamed5981 = null;
      }
   }
}

