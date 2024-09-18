package Renamed200
{
   import Renamed4626.Renamed4627;
   import alternativa.object.ClientObject;
   import alternativa.osgi.service.display.IDisplay;
   import alternativa.tanks.battle.Renamed768;
   import alternativa.tanks.battle.BattleService;
   import alternativa.tanks.battle.events.Renamed883;
   import alternativa.tanks.battle.events.BattleEventDispatcher;
   import alternativa.tanks.battle.events.Renamed894;
   import alternativa.tanks.battle.events.Renamed511;
   import Renamed329.Renamed2761;
   import Renamed359.Renamed5957;
   import Renamed359.Renamed5958;
   import Renamed359.Renamed5959;
   import flash.events.Event;
   import flash.utils.getTimer;
   import platform.client.fp10.core.type.AutoClosable;
   
   public class Renamed2746 implements AutoClosable, Renamed511, Renamed768
   {
      [Inject]
      public static var battleEventDispatcher:BattleEventDispatcher;
      
      [Inject]
      public static var display:IDisplay;
      
      [Inject]
      public static var battleService:BattleService;
      
      private static const Renamed5960:int = 900;
      
      private var _user:ClientObject;
      
      private var Renamed5908:int;
      
      private var Renamed5961:Renamed4627;
      
      public function Renamed2746(param1:ClientObject)
      {
         super();
         this._user = param1;
         this.init();
      }
      
      private function init() : void
      {
         this.Renamed5961 = new Renamed4627();
         display.stage.addEventListener(Event.ACTIVATE,this.Renamed713);
         display.stage.addEventListener(Event.DEACTIVATE,this.Renamed714);
         battleEventDispatcher.Renamed539(Renamed5957,this);
         battleEventDispatcher.Renamed539(Renamed894,this);
         battleEventDispatcher.Renamed539(Renamed883,this);
         battleEventDispatcher.Renamed539(Renamed2761,this);
      }
      
      private function Renamed713(param1:Event) : void
      {
         this.Renamed5961.visible = true;
      }
      
      private function Renamed714(param1:Event) : void
      {
         this.Renamed5961.visible = false;
      }
      
      public function handleBattleEvent(param1:Object) : void
      {
         if(param1 is Renamed5957)
         {
            this.showIndicator(Renamed5957(param1).suicideDelayMS + Renamed5960);
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
      }
      
      private function showIndicator(param1:int) : void
      {
         this.Renamed5908 = getTimer() + param1;
         this.Renamed5961.show(param1 / 1000);
         battleService.Renamed619().Renamed815(this);
         battleEventDispatcher.dispatchEvent(new Renamed5959());
      }
      
      private function hideIndicator() : void
      {
         battleService.Renamed619().Renamed816(this);
         this.Renamed5961.hide();
         battleEventDispatcher.dispatchEvent(new Renamed5958());
      }
      
      public function Renamed769(param1:int, param2:int) : void
      {
         this.Renamed5961.seconds = Math.max((this.Renamed5908 - param1) / 1000,0);
      }
      
      private function Renamed5962(param1:Renamed883) : void
      {
         if(this._user == param1.tank.Renamed695())
         {
            this.hideIndicator();
         }
      }
      
      private function Renamed5963(param1:Renamed2761) : void
      {
         if(this._user == param1.Renamed5508.Renamed695())
         {
            this.hideIndicator();
         }
      }
      
      [Obfuscation(rename="false")]
      public function close() : void
      {
         display.stage.removeEventListener(Event.ACTIVATE,this.Renamed713);
         display.stage.removeEventListener(Event.DEACTIVATE,this.Renamed714);
         battleEventDispatcher.Renamed866(Renamed5957,this);
         battleEventDispatcher.Renamed866(Renamed894,this);
         battleEventDispatcher.Renamed866(Renamed883,this);
         battleEventDispatcher.Renamed866(Renamed2761,this);
         this.Renamed5961.destroy();
         this.Renamed5961 = null;
         this._user = null;
      }
   }
}

