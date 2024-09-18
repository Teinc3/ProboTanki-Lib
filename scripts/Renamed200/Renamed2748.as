package Renamed200
{
   import Renamed209.Renamed5965;
   import Renamed4626.Renamed4628;
   import alternativa.osgi.service.display.IDisplay;
   import alternativa.tanks.battle.Renamed768;
   import alternativa.tanks.battle.BattleService;
   import alternativa.tanks.battle.events.Renamed874;
   import alternativa.tanks.battle.events.Renamed883;
   import alternativa.tanks.battle.events.Renamed884;
   import alternativa.tanks.battle.events.BattleEventDispatcher;
   import alternativa.tanks.battle.events.Renamed891;
   import alternativa.tanks.battle.events.Renamed894;
   import alternativa.tanks.battle.events.Renamed900;
   import alternativa.tanks.battle.events.Renamed511;
   import alternativa.tanks.battle.objects.tank.Tank;
   import alternativa.tanks.battle.objects.tank.Renamed841;
   import alternativa.tanks.service.settings.keybinding.Renamed717;
   import alternativa.tanks.service.settings.keybinding.KeysBindingService;
   import alternativa.tanks.services.battleinput.BattleInputService;
   import Renamed329.Renamed2761;
   import Renamed359.Renamed5958;
   import Renamed359.Renamed5959;
   import flash.events.Event;
   import flash.events.KeyboardEvent;
   import flash.ui.Keyboard;
   import flash.utils.getTimer;
   import Renamed397.Renamed5966;
   import Renamed397.Renamed5967;
   
   public class Renamed2748 implements Renamed511, Renamed768
   {
      [Inject]
      public static var battleEventDispatcher:BattleEventDispatcher;
      
      [Inject]
      public static var battleService:BattleService;
      
      [Inject]
      public static var Renamed2384:BattleInputService;
      
      [Inject]
      public static var display:IDisplay;
      
      [Inject]
      public static var Renamed719:KeysBindingService;
      
      private static const Renamed5968:int = 1000;
      
      private static const Renamed5969:int = 1;
      
      private var Renamed5970:int;
      
      private var _user:Tank;
      
      private var Renamed5971:Renamed5965;
      
      private var Renamed5972:Boolean;
      
      private var Renamed5973:Boolean;
      
      private var Renamed5974:Boolean;
      
      private var Renamed5975:Boolean;
      
      private var Renamed5976:Renamed4628;
      
      private var Renamed5908:int;
      
      public function Renamed2748(param1:Tank, param2:Renamed5965, param3:int)
      {
         super();
         this.Renamed5970 = param3 + Renamed5968;
         this._user = param1;
         this.Renamed5971 = param2;
         this.init();
      }
      
      private function init() : void
      {
         this.Renamed5976 = new Renamed4628();
         display.stage.addEventListener(KeyboardEvent.KEY_DOWN,this.onKeyDown,false,Renamed5969);
         display.stage.addEventListener(Event.ACTIVATE,this.Renamed713);
         display.stage.addEventListener(Event.DEACTIVATE,this.Renamed714);
         battleEventDispatcher.Renamed539(Renamed884,this);
         battleEventDispatcher.Renamed539(Renamed891,this);
         battleEventDispatcher.Renamed539(Renamed894,this);
         battleEventDispatcher.Renamed539(Renamed883,this);
         battleEventDispatcher.Renamed539(Renamed2761,this);
         battleEventDispatcher.Renamed539(Renamed5959,this);
         battleEventDispatcher.Renamed539(Renamed5958,this);
         battleEventDispatcher.Renamed539(Renamed874,this);
         battleEventDispatcher.Renamed539(Renamed900,this);
      }
      
      private function onKeyDown(param1:KeyboardEvent) : void
      {
         var _loc2_:Renamed717 = Renamed719.Renamed729(param1.keyCode);
         if(_loc2_ == Renamed717.SUICIDE || param1.keyCode == Keyboard.BACKSLASH && param1.ctrlKey)
         {
            this.Renamed5977();
         }
      }
      
      private function Renamed713(param1:Event) : void
      {
         this.Renamed5976.visible = true;
      }
      
      private function Renamed714(param1:Event) : void
      {
         this.Renamed5976.visible = false;
      }
      
      private function Renamed5977() : void
      {
         if(this.Renamed5978())
         {
            this.showIndicator();
            this.Renamed5972 = true;
            this.Renamed5971.Renamed5979();
         }
      }
      
      public function showIndicator() : void
      {
         this.Renamed5908 = getTimer() + this.Renamed5970;
         this.Renamed5976.show(this.Renamed5970 / 1000);
         battleService.Renamed619().Renamed815(this);
         battleEventDispatcher.dispatchEvent(new Renamed5967());
      }
      
      private function Renamed5978() : Boolean
      {
         var _loc1_:Tank = this._user;
         return battleService.Renamed646() && !this.Renamed5972 && !this.Renamed5974 && !this.Renamed5975 && !Renamed2384.Renamed728() && this.Renamed5973 && _loc1_.state == Renamed841.Renamed854;
      }
      
      public function Renamed769(param1:int, param2:int) : void
      {
         this.Renamed5976.seconds = Math.max((this.Renamed5908 - param1) / 1000,0);
      }
      
      public function handleBattleEvent(param1:Object) : void
      {
         if(param1 is Renamed884)
         {
            this.Renamed2547(Renamed884(param1));
         }
         else if(param1 is Renamed891)
         {
            this.Renamed2548(Renamed891(param1));
         }
         else if(param1 is Renamed894)
         {
            this.hideIndicator();
         }
         else if(param1 is Renamed883)
         {
            this.Renamed5962(Renamed883(param1));
         }
         else if(param1 is Renamed2761)
         {
            this.Renamed5963(Renamed2761(param1));
         }
         else if(param1 is Renamed5959)
         {
            this.Renamed5975 = true;
         }
         else if(param1 is Renamed5958)
         {
            this.Renamed5975 = false;
         }
         else if(param1 is Renamed874)
         {
            this.Renamed5974 = true;
         }
         else if(param1 is Renamed900)
         {
            this.Renamed5974 = false;
         }
      }
      
      private function Renamed2547(param1:Renamed884) : void
      {
         var _loc2_:Tank = param1.tank;
         if(_loc2_ == this._user)
         {
            this.Renamed5972 = false;
            this.Renamed5973 = true;
         }
      }
      
      private function Renamed2548(param1:Renamed891) : void
      {
         var _loc2_:Tank = param1.tank;
         if(_loc2_ == this._user)
         {
            this.Renamed5973 = false;
         }
      }
      
      private function Renamed5962(param1:Renamed883) : void
      {
         if(this._user == param1.tank)
         {
            this.hideIndicator();
         }
      }
      
      public function hideIndicator() : void
      {
         battleService.Renamed619().Renamed816(this);
         this.Renamed5976.hide();
         battleEventDispatcher.dispatchEvent(new Renamed5966());
      }
      
      private function Renamed5963(param1:Renamed2761) : void
      {
         if(this._user == param1.Renamed5508)
         {
            this.hideIndicator();
         }
      }
      
      [Obfuscation(rename="false")]
      public function close() : void
      {
         display.stage.removeEventListener(KeyboardEvent.KEY_DOWN,this.onKeyDown);
         display.stage.removeEventListener(Event.ACTIVATE,this.Renamed713);
         display.stage.removeEventListener(Event.DEACTIVATE,this.Renamed714);
         battleEventDispatcher.Renamed866(Renamed884,this);
         battleEventDispatcher.Renamed866(Renamed891,this);
         battleEventDispatcher.Renamed866(Renamed894,this);
         battleEventDispatcher.Renamed866(Renamed883,this);
         battleEventDispatcher.Renamed866(Renamed2761,this);
         battleEventDispatcher.Renamed866(Renamed5959,this);
         battleEventDispatcher.Renamed866(Renamed5958,this);
         battleEventDispatcher.Renamed866(Renamed874,this);
         battleEventDispatcher.Renamed866(Renamed900,this);
         this.Renamed5976.destroy();
         this.Renamed5976 = null;
         this._user = null;
         this.Renamed5971 = null;
      }
   }
}

