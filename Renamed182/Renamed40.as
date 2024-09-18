package Renamed39
{
   import Renamed136.Renamed663;
   import Renamed215.Renamed2611;
   import Renamed215.Renamed5725;
   import Renamed215.Renamed5726;
   import Renamed215.Renamed5727;
   import Renamed4614.Renamed4618;
   import Renamed2615.Renamed4650;
   import Renamed2615.Renamed2616;
   import Renamed2615.Renamed4654;
   import Renamed496.Renamed5728;
   import alternativa.osgi.OSGi;
   import alternativa.osgi.service.display.IDisplay;
   import alternativa.tanks.battle.events.Renamed889;
   import alternativa.tanks.battle.events.BattleEventDispatcher;
   import alternativa.tanks.battle.events.Renamed511;
   import alternativa.tanks.battle.events.Renamed902;
   import alternativa.tanks.gui.battle.BattleFinishDmNotification;
   import alternativa.tanks.models.battle.gui.Renamed2553;
   import alternativa.tanks.services.battlegui.BattleGUIService;
   import alternativa.tanks.services.battleinput.BattleInputService;
   import alternativa.utils.removeDisplayObject;
   import flash.events.Event;
   import flash.events.KeyboardEvent;
   import flash.ui.Keyboard;
   import flash.utils.Dictionary;
   import Renamed383.Renamed5729;
   import Renamed383.Renamed4683;
   import platform.client.fp10.core.model.IObjectLoadListener;
   import platform.client.fp10.core.model.ObjectUnloadListener;
   import projects.tanks.client.battleservice.model.statistics.Renamed4207;
   import projects.tanks.client.battleservice.model.statistics.Renamed4209;
   import projects.tanks.client.battleservice.model.statistics.Renamed2737;
   import projects.tanks.clients.flash.commons.services.notification.INotificationService;
   import projects.tanks.clients.flash.commons.services.serverhalt.IServerHaltService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.battle.IBattleInfoService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.layout.ILobbyLayoutService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.premium.PremiumService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.userproperties.IUserPropertiesService;
   import Renamed451.Renamed4719;
   
   public class Renamed40 extends Renamed5729 implements Renamed4683, IObjectLoadListener, ObjectUnloadListener, Renamed2616, Renamed511, Renamed4650
   {
      [Inject]
      public static var display:IDisplay;
      
      [Inject]
      public static var lobbyLayoutService:ILobbyLayoutService;
      
      [Inject]
      public static var Renamed4481:IServerHaltService;
      
      [Inject]
      public static var userPropertiesService:IUserPropertiesService;
      
      [Inject]
      public static var battleEventDispatcher:BattleEventDispatcher;
      
      [Inject]
      public static var Renamed4729:BattleGUIService;
      
      [Inject]
      public static var Renamed718:BattleInputService;
      
      [Inject]
      public static var notificationService:INotificationService;
      
      [Inject]
      public static var battleInfoService:IBattleInfoService;
      
      [Inject]
      public static var premiumService:PremiumService;
      
      private var Renamed2432:Renamed902;
      
      private var Renamed5730:Renamed4719;
      
      private var Renamed4511:Boolean;
      
      private var Renamed5731:Dictionary;
      
      private var Renamed5732:Vector.<Renamed5725>;
      
      private var Renamed5248:int;
      
      public function Renamed40()
      {
         super();
         this.Renamed2432 = new Renamed902(battleEventDispatcher,this);
         this.Renamed2432.Renamed904(Renamed889,this.Renamed5463);
      }
      
      private static function Renamed5733(param1:Vector.<Renamed2737>) : Dictionary
      {
         var _loc2_:Renamed5726 = null;
         var _loc3_:Renamed2737 = null;
         var _loc4_:Renamed5726 = null;
         var _loc5_:Dictionary = new Dictionary();
         var _loc6_:int = int(param1.length);
         var _loc7_:int = 0;
         while(_loc7_ < _loc6_)
         {
            _loc3_ = param1[_loc7_];
            _loc4_ = Renamed5727.Renamed5734(_loc3_,Renamed663.NONE);
            _loc5_[_loc3_.user] = _loc4_;
            _loc7_++;
         }
         for each(_loc2_ in _loc5_)
         {
            _loc2_.loaded = true;
         }
         return _loc5_;
      }
      
      private function Renamed5463(param1:Renamed889) : void
      {
         var _loc2_:Renamed5725 = this.Renamed5735(param1.tank.tankData.userName);
         _loc2_.loaded = true;
         this.Renamed5730.Renamed5736(_loc2_);
      }
      
      [Obfuscation(rename="false")]
      public function objectLoaded() : void
      {
         this.Renamed5731 = Renamed5733(getInitParam().usersInfo);
         this.Renamed5732 = Renamed5727.Renamed5737(this.Renamed5731,getInitParam().usersInfo);
         this.Renamed5248 = getInitParam().usersInfo.length;
         var _loc1_:Renamed4654 = Renamed4654(OSGi.getInstance().getService(Renamed2553));
         this.Renamed5730 = new Renamed4719(_loc1_.getBattleName(),false);
         this.Renamed5730.addEventListener(Renamed5728.EXIT,this.Renamed5738);
         this.Renamed5730.addEventListener(Renamed5728.CONTINUE,this.Renamed5739);
         Renamed4729.Renamed3795().addChild(this.Renamed5730);
      }
      
      [Obfuscation(rename="false")]
      public function objectLoadedPost() : void
      {
         this.battleActive = true;
         this.Renamed2432.Renamed905();
         display.stage.addEventListener(KeyboardEvent.KEY_DOWN,this.onKeyDown);
         display.stage.addEventListener(KeyboardEvent.KEY_UP,this.onKeyUp);
         display.stage.addEventListener(Event.DEACTIVATE,this.Renamed5740);
      }
      
      private function onKeyDown(param1:KeyboardEvent) : void
      {
         if(param1.keyCode == Keyboard.TAB && !Renamed718.Renamed728())
         {
            this.Renamed5741();
         }
      }
      
      private function Renamed5741() : void
      {
         if(this.battleActive)
         {
            this.Renamed5730.Renamed5742(false,false,userPropertiesService.userId,this.Renamed5732,false,0);
         }
      }
      
      private function Renamed5743() : void
      {
         if(this.battleActive)
         {
            this.Renamed5730.hide();
         }
      }
      
      private function onKeyUp(param1:KeyboardEvent) : void
      {
         if(param1.keyCode == Keyboard.TAB)
         {
            this.Renamed5743();
         }
      }
      
      private function Renamed5740(param1:Event) : void
      {
         this.Renamed5743();
      }
      
      private function Renamed5738(param1:Renamed5728) : void
      {
         if(!lobbyLayoutService.isSwitchInProgress())
         {
            if(!this.battleActive)
            {
               lobbyLayoutService.exitFromBattleWithoutNotify();
            }
            else
            {
               lobbyLayoutService.exitFromBattle();
            }
         }
      }
      
      private function Renamed5739(param1:Renamed5728) : void
      {
         Renamed4618(object.adapt(Renamed4618)).continueBattle();
      }
      
      [Obfuscation(rename="false")]
      public function objectUnloaded() : void
      {
         this.battleActive = false;
         this.Renamed2432.Renamed906();
         display.stage.removeEventListener(KeyboardEvent.KEY_DOWN,this.onKeyDown);
         display.stage.removeEventListener(KeyboardEvent.KEY_UP,this.onKeyUp);
         display.stage.removeEventListener(Event.DEACTIVATE,this.Renamed5740);
         this.Renamed5730.hide();
         this.Renamed5730.removeEventListener(Renamed5728.EXIT,this.Renamed5738);
         this.Renamed5730.removeEventListener(Renamed5728.CONTINUE,this.Renamed5739);
         removeDisplayObject(this.Renamed5730);
         this.Renamed5730 = null;
         this.Renamed5731.length = 0;
         this.Renamed5732.length = 0;
         this.Renamed5732 = null;
         this.Renamed5731 = null;
         this.Renamed5248 = 0;
      }
      
      [Obfuscation(rename="false")]
      public function objectUnloadedPost() : void
      {
      }
      
      [Obfuscation(rename="false")]
      public function Renamed5744(param1:Renamed4207) : void
      {
         var _loc2_:Renamed5725 = Renamed5727.Renamed5744(this.Renamed5732,param1);
         this.Renamed5730.Renamed5736(_loc2_);
         var _loc3_:Renamed4654 = Renamed4654(OSGi.getInstance().getService(Renamed2553));
         _loc3_.Renamed5662(_loc2_.userId,_loc2_.kills);
      }
      
      [Obfuscation(rename="false")]
      public function Renamed5745(param1:Vector.<Renamed4207>) : void
      {
         this.Renamed5732 = Renamed5727.Renamed5745(this.Renamed5731,param1);
         var _loc2_:Renamed4654 = Renamed4654(OSGi.getInstance().getService(Renamed2553));
         var _loc3_:int = int(param1.length);
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            _loc2_.Renamed5662(param1[_loc4_].user,param1[_loc4_].kills);
            _loc4_++;
         }
         this.Renamed5730.Renamed5746(this.Renamed5732);
      }
      
      [Obfuscation(rename="false")]
      public function userConnect(param1:String, param2:Vector.<Renamed2737>) : void
      {
         var _loc3_:Renamed2737 = Renamed5727.Renamed2739(param1,param2);
         this.Renamed5731[param1] = Renamed5727.Renamed5734(_loc3_,Renamed663.NONE);
         ++this.Renamed5248;
         this.Renamed5732 = Renamed5727.Renamed5737(this.Renamed5731,param2);
         if(this.battleActive)
         {
            this.Renamed5730.Renamed5746(this.Renamed5732);
         }
      }
      
      [Obfuscation(rename="false")]
      public function Renamed5747(param1:String) : void
      {
         if(this.battleActive)
         {
            this.Renamed5730.Renamed5748(param1,Renamed663.NONE);
         }
         var _loc2_:Renamed4654 = Renamed4654(OSGi.getInstance().getService(Renamed2553));
         var _loc3_:Renamed5726 = this.Renamed5731[param1];
         _loc2_.Renamed5747(_loc3_.getShortUserInfo());
         delete this.Renamed5731[param1];
         --this.Renamed5248;
         this.Renamed5732 = Renamed5727.Renamed5749(this.Renamed5732,param1);
      }
      
      public function getShortUserInfo(param1:String) : Renamed2611
      {
         var _loc2_:Renamed5726 = this.Renamed5731[param1];
         if(_loc2_ != null)
         {
            return _loc2_.getShortUserInfo();
         }
         return null;
      }
      
      public function isLoaded(param1:String) : Boolean
      {
         var _loc2_:Renamed5726 = this.Renamed5731[param1];
         return _loc2_ != null && _loc2_.loaded;
      }
      
      public function Renamed5750(param1:String, param2:Boolean) : void
      {
         var _loc3_:Renamed5725 = this.Renamed5735(param1);
         if(_loc3_ != null)
         {
            _loc3_.suspicious = param2;
            this.Renamed5730.Renamed5736(_loc3_);
         }
      }
      
      public function Renamed5751(param1:String, param2:int) : void
      {
         var _loc3_:Renamed5725 = this.Renamed5735(param1);
         _loc3_.rank = param2;
         this.Renamed5730.Renamed5736(_loc3_);
      }
      
      public function handleBattleEvent(param1:Object) : void
      {
         this.Renamed2432.handleBattleEvent(param1);
      }
      
      public function roundStart() : void
      {
         this.battleActive = true;
         this.Renamed5730.hide();
      }
      
      public function Renamed4218() : void
      {
         this.battleActive = false;
         this.Renamed5730.hide();
      }
      
      public function roundFinish(param1:Boolean, param2:Boolean, param3:int, param4:Vector.<Renamed4209>, param5:int, param6:int) : void
      {
         var _loc7_:* = false;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         this.battleActive = false;
         this.Renamed5730.hide();
         Renamed5727.Renamed5752(this.Renamed5732,param4,param5);
         if(param2)
         {
            _loc7_ = param5 > 0;
            param3 = Renamed4481.isServerHalt ? int(-1) : int(param3);
            this.Renamed5730.Renamed5742(param1,_loc7_,userPropertiesService.userId,this.Renamed5732,true,param3);
            if(lobbyLayoutService.isWindowOpenOverBattle() && !battleInfoService.isSpectatorMode())
            {
               _loc8_ = Renamed5727.Renamed5753(userPropertiesService.userId,param4);
               _loc9_ = 0;
               if(premiumService.hasPremium())
               {
                  _loc9_ += Renamed5727.Renamed5754(_loc8_,param5);
               }
               notificationService.addNotification(new BattleFinishDmNotification(this.Renamed5755(),this.Renamed5732.length,_loc8_,_loc9_));
            }
         }
      }
      
      private function Renamed5755() : int
      {
         this.Renamed5732.sort(function(param1:Renamed5725, param2:Renamed5725):Number
         {
            if(param1.kills > param2.kills)
            {
               return -1;
            }
            if(param1.kills < param2.kills)
            {
               return 1;
            }
            if(param1.deaths > param2.deaths)
            {
               return 1;
            }
            if(param1.deaths < param2.deaths)
            {
               return -1;
            }
            return 0;
         });
         return Renamed5727.Renamed5756(this.Renamed5732,userPropertiesService.userId) + 1;
      }
      
      private function Renamed5735(param1:String) : Renamed5725
      {
         return Renamed5727.Renamed5757(this.Renamed5732,param1);
      }
      
      public function getUsersCount() : int
      {
         return this.Renamed5248;
      }
      
      private function get battleActive() : Boolean
      {
         return this.Renamed4511;
      }
      
      private function set battleActive(param1:Boolean) : void
      {
         this.Renamed4511 = param1;
         battleInfoService.battleActive = param1;
      }
   }
}

