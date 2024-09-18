package Renamed97
{
   import Renamed136.Renamed663;
   import Renamed202.Renamed4569;
   import Renamed202.Renamed6022;
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
   import alternativa.tanks.battle.events.Renamed884;
   import alternativa.tanks.battle.events.Renamed889;
   import alternativa.tanks.battle.events.BattleEventDispatcher;
   import alternativa.tanks.battle.events.Renamed511;
   import alternativa.tanks.battle.events.Renamed902;
   import alternativa.tanks.gui.battle.BattleFinishTeamNotification;
   import alternativa.tanks.models.battle.gui.Renamed2553;
   import alternativa.tanks.services.battlegui.BattleGUIService;
   import alternativa.tanks.services.battleinput.BattleInputService;
   import alternativa.utils.removeDisplayObject;
   import flash.events.Event;
   import flash.events.KeyboardEvent;
   import flash.ui.Keyboard;
   import flash.utils.Dictionary;
   import forms.ChangeTeamAlert;
   import platform.client.fp10.core.model.ObjectLoadListener;
   import platform.client.fp10.core.model.ObjectLoadPostListener;
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
   
   public class Renamed98 extends Renamed6022 implements Renamed4569, ObjectLoadListener, ObjectLoadPostListener, ObjectUnloadListener, Renamed2616, Renamed511, Renamed4650
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
      
      private var battleActive:Boolean;
      
      private var Renamed5730:Renamed4719;
      
      private var Renamed10506:Vector.<Renamed5725>;
      
      private var Renamed10507:Vector.<Renamed5725>;
      
      private var Renamed5731:Dictionary;
      
      private var Renamed9060:Renamed663;
      
      private var Renamed10508:Renamed663;
      
      private var scoreRed:int;
      
      private var scoreBlue:int;
      
      private var Renamed5248:int;
      
      public function Renamed98()
      {
         super();
         this.Renamed2432 = new Renamed902(battleEventDispatcher,this);
         this.Renamed2432.Renamed904(Renamed884,this.Renamed2547);
         this.Renamed2432.Renamed904(Renamed889,this.Renamed5463);
      }
      
      private static function Renamed10509(param1:Renamed663) : void
      {
         var _loc2_:ChangeTeamAlert = new ChangeTeamAlert(3,param1 == Renamed663.RED ? int(ChangeTeamAlert.RED) : int(ChangeTeamAlert.BLUE));
         _loc2_.x = display.stage.stageWidth - _loc2_.width >> 1;
         _loc2_.y = display.stage.stageHeight - _loc2_.height >> 1;
         Renamed4729.Renamed2575().addChild(_loc2_);
      }
      
      private static function Renamed5733(param1:Vector.<Renamed2737>, param2:Vector.<Renamed2737>) : Dictionary
      {
         var _loc3_:Renamed2737 = null;
         var _loc4_:Renamed2737 = null;
         var _loc5_:Renamed5726 = null;
         var _loc6_:Dictionary = new Dictionary();
         for each(_loc3_ in param1)
         {
            _loc6_[_loc3_.user] = Renamed5727.Renamed5734(_loc3_,Renamed663.RED);
         }
         for each(_loc4_ in param2)
         {
            _loc6_[_loc4_.user] = Renamed5727.Renamed5734(_loc4_,Renamed663.BLUE);
         }
         for each(_loc5_ in _loc6_)
         {
            _loc5_.loaded = true;
         }
         return _loc6_;
      }
      
      private static function Renamed10510(param1:Vector.<Renamed5725>, param2:Renamed663) : void
      {
         var _loc3_:Renamed5725 = null;
         var _loc4_:int = int(param1.length);
         var _loc5_:int = 0;
         while(_loc5_ < _loc4_)
         {
            _loc3_ = param1[_loc5_];
            if(_loc3_ == null)
            {
               break;
            }
            _loc3_.teamType = param2;
            _loc5_++;
         }
      }
      
      private function Renamed2547(param1:Renamed884) : void
      {
         if(param1.tank.Renamed695().id == userPropertiesService.userId)
         {
            if(param1.tank.teamType != this.Renamed10508)
            {
               this.Renamed10508 = param1.tank.teamType;
               Renamed10509(this.Renamed10508);
            }
         }
      }
      
      private function Renamed5463(param1:Renamed889) : void
      {
         var _loc2_:Renamed5725 = this.Renamed5735(param1.tank.tankData.userName);
         _loc2_.loaded = true;
         this.Renamed5730.Renamed9051(_loc2_);
      }
      
      [Obfuscation(rename="false")]
      public function objectLoaded() : void
      {
         this.Renamed10508 = Renamed663.NONE;
         this.Renamed5731 = Renamed5733(getInitParam().Renamed6019,getInitParam().Renamed6018);
         this.Renamed5248 = getInitParam().Renamed6019.length + getInitParam().Renamed6018.length;
         this.Renamed10506 = Renamed5727.Renamed5737(this.Renamed5731,getInitParam().Renamed6019);
         this.Renamed10507 = Renamed5727.Renamed5737(this.Renamed5731,getInitParam().Renamed6018);
         var _loc1_:Renamed4654 = Renamed4654(OSGi.getInstance().getService(Renamed2553));
         this.Renamed5730 = new Renamed4719(_loc1_.getBattleName(),true);
         this.Renamed5730.addEventListener(Renamed5728.EXIT,this.Renamed5738);
         this.Renamed5730.addEventListener(Renamed5728.CONTINUE,this.Renamed5739);
         Renamed4729.Renamed3795().addChild(this.Renamed5730);
      }
      
      [Obfuscation(rename="false")]
      public function objectLoadedPost() : void
      {
         this.battleActive = true;
         this.Renamed6020(Renamed663.RED,getInitParam().Renamed2687);
         this.Renamed6020(Renamed663.BLUE,getInitParam().Renamed2689);
         this.Renamed10511();
         this.Renamed2432.Renamed905();
         display.stage.addEventListener(KeyboardEvent.KEY_DOWN,this.onKeyDown);
         display.stage.addEventListener(KeyboardEvent.KEY_UP,this.onKeyUp);
         display.stage.addEventListener(Event.DEACTIVATE,this.Renamed5740);
      }
      
      private function Renamed10511() : void
      {
         var _loc1_:Renamed5725 = this.Renamed5735(userPropertiesService.userId);
         if(_loc1_ != null)
         {
            this.Renamed9060 = _loc1_.teamType;
         }
      }
      
      private function onKeyDown(param1:KeyboardEvent) : void
      {
         if(param1.keyCode == Keyboard.TAB && !Renamed718.Renamed728())
         {
            this.Renamed5741();
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
      
      private function Renamed5741() : void
      {
         if(this.battleActive)
         {
            this.Renamed5730.Renamed9042(false,userPropertiesService.userId,this.Renamed10506,this.Renamed10507,false,0,this.Renamed9060);
         }
      }
      
      private function Renamed5743() : void
      {
         if(this.battleActive)
         {
            this.Renamed5730.hide();
         }
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
         this.Renamed10506 = null;
         this.Renamed10507 = null;
         this.Renamed5731 = null;
         this.Renamed10508 = null;
         this.Renamed5248 = 0;
      }
      
      [Obfuscation(rename="false")]
      public function Renamed6020(param1:Renamed663, param2:int) : void
      {
         if(param1 == Renamed663.RED)
         {
            this.scoreRed = param2;
         }
         if(param1 == Renamed663.BLUE)
         {
            this.scoreBlue = param2;
         }
         var _loc3_:Renamed4654 = Renamed4654(OSGi.getInstance().getService(Renamed2553));
         _loc3_.Renamed6020(param1,param2);
      }
      
      [Obfuscation(rename="false")]
      public function userConnect(param1:String, param2:Vector.<Renamed2737>, param3:Renamed663) : void
      {
         var _loc4_:Renamed2737 = Renamed5727.Renamed2739(param1,param2);
         this.Renamed5731[param1] = Renamed5727.Renamed5734(_loc4_,param3);
         ++this.Renamed5248;
         if(param3 == Renamed663.RED)
         {
            this.Renamed10506 = Renamed5727.Renamed5737(this.Renamed5731,param2);
            if(this.battleActive)
            {
               this.Renamed5730.Renamed9050(this.Renamed10506,param3);
            }
         }
         if(param3 == Renamed663.BLUE)
         {
            this.Renamed10507 = Renamed5727.Renamed5737(this.Renamed5731,param2);
            if(this.battleActive)
            {
               this.Renamed5730.Renamed9050(this.Renamed10507,param3);
            }
         }
      }
      
      [Obfuscation(rename="false")]
      public function Renamed5747(param1:String) : void
      {
         var _loc2_:Renamed5726 = this.Renamed5731[param1];
         var _loc3_:Renamed4654 = Renamed4654(OSGi.getInstance().getService(Renamed2553));
         _loc3_.Renamed5747(_loc2_.getShortUserInfo());
         if(this.battleActive)
         {
            this.Renamed5730.Renamed5748(param1,_loc2_.teamType);
         }
         if(_loc2_.teamType == Renamed663.RED)
         {
            this.Renamed10506 = Renamed5727.Renamed5749(this.Renamed10506,param1);
         }
         if(_loc2_.teamType == Renamed663.BLUE)
         {
            this.Renamed10507 = Renamed5727.Renamed5749(this.Renamed10507,param1);
         }
         delete this.Renamed5731[param1];
         --this.Renamed5248;
      }
      
      [Obfuscation(rename="false")]
      public function Renamed5744(param1:Renamed4207, param2:Renamed663) : void
      {
         var _loc3_:Renamed5725 = null;
         if(param2 == Renamed663.RED)
         {
            _loc3_ = Renamed5727.Renamed5744(this.Renamed10506,param1);
         }
         if(param2 == Renamed663.BLUE)
         {
            _loc3_ = Renamed5727.Renamed5744(this.Renamed10507,param1);
         }
         var _loc4_:Renamed4654 = Renamed4654(OSGi.getInstance().getService(Renamed2553));
         _loc4_.Renamed5662(param1.user,param1.kills);
         this.Renamed5730.Renamed9051(_loc3_);
      }
      
      [Obfuscation(rename="false")]
      public function Renamed5745(param1:Vector.<Renamed4207>, param2:Renamed663) : void
      {
         if(param2 == Renamed663.RED)
         {
            this.Renamed10506 = Renamed5727.Renamed5745(this.Renamed5731,param1);
            this.Renamed5730.Renamed9050(this.Renamed10506,param2);
         }
         if(param2 == Renamed663.BLUE)
         {
            this.Renamed10507 = Renamed5727.Renamed5745(this.Renamed5731,param1);
            this.Renamed5730.Renamed9050(this.Renamed10507,param2);
         }
      }
      
      [Obfuscation(rename="false")]
      public function Renamed6021(param1:Vector.<Renamed4207>, param2:Vector.<Renamed4207>) : void
      {
         this.Renamed10506 = Renamed5727.Renamed5745(this.Renamed5731,param1);
         this.Renamed10507 = Renamed5727.Renamed5745(this.Renamed5731,param2);
         Renamed10510(this.Renamed10506,Renamed663.RED);
         Renamed10510(this.Renamed10507,Renamed663.BLUE);
         this.Renamed10511();
         this.Renamed5730.Renamed9050(this.Renamed10506,Renamed663.RED);
         this.Renamed5730.Renamed9050(this.Renamed10507,Renamed663.BLUE);
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
      
      private function Renamed5735(param1:String) : Renamed5725
      {
         var _loc2_:Renamed5725 = Renamed5727.Renamed5757(this.Renamed10506,param1);
         if(_loc2_ == null)
         {
            _loc2_ = Renamed5727.Renamed5757(this.Renamed10507,param1);
         }
         return _loc2_;
      }
      
      public function Renamed5750(param1:String, param2:Boolean) : void
      {
         var _loc3_:Renamed5725 = this.Renamed5735(param1);
         if(_loc3_ != null)
         {
            _loc3_.suspicious = param2;
            this.Renamed5730.Renamed9051(_loc3_);
         }
      }
      
      public function Renamed5751(param1:String, param2:int) : void
      {
         var _loc3_:Renamed5725 = this.Renamed5735(param1);
         _loc3_.rank = param2;
         this.Renamed5730.Renamed9051(_loc3_);
      }
      
      public function handleBattleEvent(param1:Object) : void
      {
         this.Renamed2432.handleBattleEvent(param1);
      }
      
      public function roundStart() : void
      {
         this.battleActive = true;
         this.Renamed5730.hide();
         this.Renamed6020(Renamed663.RED,0);
         this.Renamed6020(Renamed663.BLUE,0);
      }
      
      public function Renamed4218() : void
      {
         this.battleActive = true;
         this.Renamed5730.hide();
      }
      
      public function roundFinish(param1:Boolean, param2:Boolean, param3:int, param4:Vector.<Renamed4209>, param5:int, param6:int) : void
      {
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         this.battleActive = false;
         this.Renamed5730.hide();
         Renamed5727.Renamed5752(this.Renamed10506,param4,param5);
         Renamed5727.Renamed5752(this.Renamed10507,param4,param5);
         if(param2)
         {
            this.Renamed5730.Renamed9042(param1,userPropertiesService.userId,this.Renamed10506,this.Renamed10507,true,Renamed4481.isServerHalt ? int(-1) : int(param3),this.Renamed9060);
         }
         if(param2 && lobbyLayoutService.isWindowOpenOverBattle() && !battleInfoService.isSpectatorMode())
         {
            _loc7_ = Renamed5727.Renamed5753(userPropertiesService.userId,param4);
            _loc8_ = 0;
            if(premiumService.hasPremium())
            {
               _loc8_ += Renamed5727.Renamed5754(_loc7_,param5);
            }
            notificationService.addNotification(new BattleFinishTeamNotification(this.Renamed10512(),this.Renamed10513(),this.Renamed5755(),this.Renamed10514(),_loc7_,_loc8_));
         }
      }
      
      private function Renamed10512() : Boolean
      {
         if(this.Renamed9060 == Renamed663.RED)
         {
            return this.scoreRed > this.scoreBlue;
         }
         if(this.Renamed9060 == Renamed663.BLUE)
         {
            return this.scoreBlue > this.scoreRed;
         }
         return false;
      }
      
      private function Renamed10513() : Boolean
      {
         if(this.Renamed9060 == Renamed663.RED)
         {
            return this.scoreBlue > this.scoreRed;
         }
         if(this.Renamed9060 == Renamed663.BLUE)
         {
            return this.scoreRed > this.scoreBlue;
         }
         return false;
      }
      
      private function Renamed10514() : int
      {
         if(this.Renamed9060 == Renamed663.RED)
         {
            return this.Renamed10506.length;
         }
         if(this.Renamed9060 == Renamed663.BLUE)
         {
            return this.Renamed10507.length;
         }
         return 0;
      }
      
      private function Renamed5755() : int
      {
         var Renamed10515:int;
         this.Renamed10506.sort(function(param1:Renamed5725, param2:Renamed5725):Number
         {
            if(param1.score > param2.score)
            {
               return 1;
            }
            if(param1.score < param2.score)
            {
               return -1;
            }
            return 0;
         });
         this.Renamed10507.sort(function(param1:Renamed5725, param2:Renamed5725):Number
         {
            if(param1.score > param2.score)
            {
               return 1;
            }
            if(param1.score < param2.score)
            {
               return -1;
            }
            return 0;
         });
         Renamed10515 = 0;
         if(this.Renamed9060 == Renamed663.RED)
         {
            Renamed10515 = Renamed5727.Renamed5756(this.Renamed10506,userPropertiesService.userId);
         }
         else if(this.Renamed9060 == Renamed663.BLUE)
         {
            Renamed10515 = Renamed5727.Renamed5756(this.Renamed10507,userPropertiesService.userId);
         }
         return Renamed10515 + 1;
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
      
      public function getUsersCount() : int
      {
         return this.Renamed5248;
      }
   }
}

