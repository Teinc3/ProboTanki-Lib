package Renamed2615
{
   import Renamed136.Renamed663;
   import Renamed5196.Renamed5197;
   import Renamed17.MessageColor;
   import Renamed4561.Renamed4563;
   import Renamed215.Renamed2611;
   import Renamed215.Renamed4574;
   import Renamed232.Renamed1582;
   import Renamed477.Renamed4632;
   import alternativa.osgi.OSGi;
   import alternativa.osgi.service.display.IDisplay;
   import alternativa.osgi.service.locale.ILocaleService;
   import alternativa.service.IModelService;
   import alternativa.tanks.battle.Renamed768;
   import alternativa.tanks.battle.BattleService;
   import alternativa.tanks.help.IHelpService;
   import alternativa.tanks.locale.constants.TextConst;
   import alternativa.tanks.models.battle.gui.Renamed2553;
   import alternativa.tanks.models.battle.gui.chat.Renamed2566;
   import alternativa.tanks.models.battle.gui.gui.statistics.field.Renamed2552;
   import alternativa.tanks.models.tank.Renamed775;
   import alternativa.tanks.service.settings.ISettingsService;
   import alternativa.tanks.services.battlegui.BattleGUIService;
   import alternativa.tanks.utils.removeDisplayObject;
   import alternativa.types.Long;
   import Renamed322.Renamed6582;
   import flash.display.DisplayObjectContainer;
   import flash.events.Event;
   import forms.FocusWarningWindow;
   import projects.tanks.client.battleservice.model.statistics.Renamed4209;
   import projects.tanks.client.battleservice.model.statistics.Renamed4214;
   import projects.tanks.client.battleservice.model.statistics.Renamed4236;
   import projects.tanks.clients.fp10.libraries.TanksLocale;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.storage.IStorageService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.userproperties.IUserPropertiesService;
   import projects.tanks.clients.fp10.libraries.tanksservices.utils.BattleFormatUtil;
   import scpacker.utils.Renamed5340;
   import Renamed431.Renamed4709;
   import Renamed465.Renamed9295;
   
   public class Renamed2757 extends Renamed4236 implements Renamed4214, Renamed4654, Renamed2553, Renamed768
   {
      [Inject]
      public static var localeService:ILocaleService;
      
      [Inject]
      public static var battleService:BattleService;
      
      [Inject]
      public static var settingsService:ISettingsService;
      
      [Inject]
      public static var storageService:IStorageService;
      
      [Inject]
      public static var userPropertiesService:IUserPropertiesService;
      
      [Inject]
      public static var helpService:IHelpService;
      
      [Inject]
      public static var Renamed4729:BattleGUIService;
      
      [Inject]
      public static var Renamed1588:BattleFormatUtil;
      
      [Inject]
      public static var display:IDisplay;
      
      private var Renamed2797:IModelService;
      
      private var Renamed9697:Boolean;
      
      private var Renamed9698:Renamed9295;
      
      private var Renamed9691:Renamed4709;
      
      private var Renamed9693:Renamed5197;
      
      private var Renamed9668:Renamed4632;
      
      private var battleName:String;
      
      private var Renamed9699:String;
      
      private var Renamed9700:String;
      
      private var Renamed9701:FocusWarningWindow;
      
      private var Renamed9702:Renamed4652;
      
      private var Renamed9703:Renamed4651;
      
      private var controlsHelpSupport:Renamed4653;
      
      private var Renamed9704:Renamed4648;
      
      private var Renamed9705:Renamed4563;
      
      private var Renamed9706:Renamed4574;
      
      private var Renamed9707:Renamed4649;
      
      private var Renamed9708:Renamed4647;
      
      private var Renamed9709:Renamed9669;
      
      private var parkourMode:Boolean;
      
      private var equipmentConstraintsMode:Renamed1582;
      
      public function Renamed2757()
      {
         super();
         this.Renamed9668 = new Renamed4632();
         Renamed6582.init(500);
         OSGi.getInstance().registerService(Renamed2553,this);
      }
      
      public function Renamed769(param1:int, param2:int) : void
      {
         this.Renamed9693.update(param2);
      }
      
      public function getBattleName() : String
      {
         var _loc1_:String = this.battleName;
         var _loc2_:Renamed1582 = this.equipmentConstraintsMode;
         var _loc3_:Boolean = this.parkourMode;
         if(Renamed1588.Renamed3642(_loc2_,_loc3_))
         {
            _loc1_ = _loc1_ + " " + Renamed1588.Renamed3643(_loc2_,_loc3_);
         }
         return _loc1_;
      }
      
      public function userConnect(param1:Renamed2611) : void
      {
         this.Renamed9691.addMessage(param1,this.Renamed9699);
      }
      
      public function Renamed5747(param1:Renamed2611) : void
      {
         this.Renamed9691.addMessage(param1,this.Renamed9700);
      }
      
      public function Renamed5662(param1:String, param2:int) : void
      {
         this.Renamed9698.Renamed5662(param1,param2);
      }
      
      public function Renamed6020(param1:Renamed663, param2:int) : void
      {
         this.Renamed9698.Renamed2693(param1,param2);
      }
      
      public function Renamed2561(param1:uint, param2:String) : void
      {
         this.Renamed9693.addMessage(param1,param2);
      }
      
      public function objectLoaded() : void
      {
         this.battleName = getInitParam().mapName;
         this.equipmentConstraintsMode = getInitParam().equipmentConstraintsMode;
         this.parkourMode = getInitParam().parkourMode;
         this.Renamed9699 = localeService.getText(TanksLocale.TEXT_BATTLE_PLAYER_JOINED);
         this.Renamed9700 = localeService.getText(TanksLocale.TEXT_BATTLE_PLAYER_LEFT);
         var _loc1_:Renamed9669 = new Renamed9669(null);
         this.Renamed9709 = _loc1_;
         this.Renamed9707 = new Renamed4649();
         this.Renamed9708 = new Renamed4647();
         this.Renamed9705 = new Renamed4563();
         this.Renamed9704 = new Renamed4648(this.Renamed9668);
         var _loc2_:DisplayObjectContainer = Renamed4729.Renamed2575();
         this.Renamed9698 = new Renamed9295(userPropertiesService.userId,getInitParam().fund,getInitParam().Renamed1601,getInitParam().Renamed4234,Renamed5340.Renamed9710(getInitParam().battleMode),true);
         _loc2_.addChild(this.Renamed9698);
         this.Renamed9706 = new Renamed4574();
         this.Renamed9706.Renamed6248(this.Renamed9698);
         this.Renamed9706.init();
         this.Renamed9693 = new Renamed5197();
         _loc2_.addChild(this.Renamed9693);
         this.Renamed9691 = new Renamed4709();
         _loc2_.addChild(this.Renamed9691);
         if(settingsService.showFPS)
         {
            _loc2_.addChild(this.Renamed9668);
         }
         if(getInitParam().spectator)
         {
            this.Renamed9711();
         }
         else
         {
            this.Renamed9703 = new Renamed4651();
            this.controlsHelpSupport = new Renamed4653();
         }
         display.stage.addEventListener(Event.RESIZE,this.onResize);
         this.onResize(null);
      }
      
      public function Renamed2563(param1:Renamed2552) : void
      {
         this.Renamed9706.Renamed2563(param1);
      }
      
      public function objectUnloaded() : void
      {
         display.stage.removeEventListener(Event.RESIZE,this.onResize);
         removeDisplayObject(this.Renamed9698);
         removeDisplayObject(this.Renamed9691);
         removeDisplayObject(this.Renamed9668);
         this.Renamed9698 = null;
         battleService.Renamed619().Renamed816(this);
         if(this.Renamed9703 != null)
         {
            this.Renamed9703.close();
         }
         if(this.controlsHelpSupport != null)
         {
            this.controlsHelpSupport.close();
         }
         this.Renamed9708.close();
         this.Renamed9707.close();
         this.Renamed9704.close();
         this.Renamed9705.close();
         if(this.Renamed9702 != null)
         {
            this.Renamed9702.close();
         }
         this.Renamed9702 = null;
         this.Renamed9691 = null;
         this.Renamed9693.removeFromParent();
         this.Renamed9693 = null;
         this.Renamed9706.destroy();
         this.Renamed9706 = null;
         this.Renamed9709.close();
      }
      
      private function Renamed9712() : Boolean
      {
         return getInitParam().Renamed1601.timeLimitInSec != 0;
      }
      
      [Obfuscation(rename="false")]
      public function objectLoadedPost() : void
      {
         var _loc1_:Boolean = false;
         this.Renamed9713(getInitParam().Renamed4233);
         battleService.Renamed619().Renamed815(this);
         if(this.Renamed9712())
         {
            _loc1_ = getInitParam().spectator;
            if(!_loc1_ || _loc1_ && this.battleUserInfoService().getUsersCount() > 0)
            {
               this.Renamed9698.Renamed6609(getInitParam().Renamed4234);
            }
         }
      }
      
      private function Renamed9711() : void
      {
         var _loc1_:Renamed2566 = Renamed2566(modelRegistry.getModel(Long.getLong(1896886505,1439133662)));
         this.Renamed9702 = new Renamed4652(_loc1_.Renamed2585(),this.Renamed9691,this.Renamed9693,this.Renamed9698,this.Renamed9668);
      }
      
      private function Renamed9713(param1:Vector.<String>) : void
      {
         var _loc2_:String = null;
         for each(_loc2_ in param1)
         {
            this.Renamed9714(_loc2_,true);
         }
      }
      
      public function Renamed2562(param1:String) : void
      {
         this.Renamed9691.addMessage(null,param1,null);
      }
      
      [Obfuscation(rename="false")]
      public function Renamed4215(param1:int) : void
      {
         this.Renamed9698.Renamed9307(param1);
      }
      
      [Obfuscation(rename="false")]
      public function roundStart(param1:int, param2:Boolean) : void
      {
         this.Renamed9698.Renamed9309(param2);
         if(param1 > 0)
         {
            this.Renamed9698.Renamed6609(param1);
         }
         var _loc3_:Renamed4650 = Renamed4650(OSGi.getInstance().getService(Renamed2616));
         _loc3_.roundStart();
      }
      
      [Obfuscation(rename="false")]
      public function Renamed4218() : void
      {
         if(this.Renamed9712())
         {
            this.Renamed9698.Renamed6610();
         }
         this.Renamed9698.Renamed9308();
         var _loc1_:Renamed4650 = Renamed4650(object.adapt(Renamed4650));
         _loc1_.Renamed4218();
      }
      
      [Obfuscation(rename="false")]
      public function roundFinish(param1:Boolean, param2:Vector.<Renamed4209>, param3:int) : void
      {
         var _loc4_:Renamed4650 = Renamed4650(OSGi.getInstance().getService(Renamed2616));
         _loc4_.roundFinish(false,param1,param3,param2,100,0);
         this.Renamed9698.Renamed9059();
      }
      
      public function Renamed2554(param1:String, param2:String, param3:String = null) : void
      {
         var _loc4_:Renamed2616 = Renamed2616(OSGi.getInstance().getService(Renamed2616));
         var _loc5_:Renamed2611 = _loc4_.getShortUserInfo(param1);
         var _loc6_:Renamed2611 = param3 == null ? null : _loc4_.getShortUserInfo(param3);
         this.Renamed9691.addMessage(_loc5_,param2,_loc6_);
      }
      
      public function Renamed2564(param1:String, param2:String) : void
      {
         var _loc3_:Renamed2616 = Renamed2616(OSGi.getInstance().getService(Renamed2616));
         var _loc4_:Renamed2611 = _loc3_.getShortUserInfo(param1);
         this.Renamed9691.addMessage(_loc4_,param2);
      }
      
      public function Renamed2555(param1:Renamed663) : void
      {
         this.Renamed9698.Renamed2555(param1);
      }
      
      public function Renamed2556(param1:Renamed663) : void
      {
         this.Renamed9698.Renamed2556(param1);
      }
      
      public function Renamed2557(param1:Renamed663) : void
      {
         this.Renamed9698.Renamed2557(param1);
      }
      
      public function Renamed2558() : void
      {
         this.Renamed9698.Renamed2558();
      }
      
      public function Renamed2559() : void
      {
         this.Renamed9698.Renamed2559();
      }
      
      public function Renamed2560() : void
      {
         this.Renamed9698.Renamed2560();
      }
      
      [Obfuscation(rename="false")]
      public function Renamed4217(param1:String, param2:int) : void
      {
         var _loc3_:Renamed2616 = Renamed2616(OSGi.getInstance().getService(Renamed2616));
         _loc3_.Renamed5751(param1,param2);
         if(Renamed775.Renamed824 != null && param1 == Renamed775.Renamed824.user.id)
         {
            Renamed4651(this.Renamed9703).close();
         }
         var _loc4_:Renamed9669 = this.battleUserInfoService();
         _loc4_.Renamed9672(param1,param2);
      }
      
      private function onResize(param1:Event) : void
      {
         var _loc2_:int = display.stage.stageWidth;
         var _loc3_:int = display.stage.stageHeight;
         if(this.Renamed9693 != null)
         {
            this.Renamed9693.x = 0.5 * _loc2_;
            this.Renamed9693.y = 40;
         }
      }
      
      private function Renamed9714(param1:String, param2:Boolean) : void
      {
         var _loc3_:Renamed2616 = Renamed2616(OSGi.getInstance().getService(Renamed2616));
         _loc3_.Renamed5750(param1,param2);
         var _loc4_:Renamed9669 = this.battleUserInfoService();
         _loc4_.Renamed9673(param1,param2);
      }
      
      [Obfuscation(rename="false")]
      public function Renamed4219(param1:String, param2:Boolean) : void
      {
         this.Renamed9714(param1,param2);
      }
      
      [Obfuscation(rename="false")]
      public function Renamed4216() : void
      {
         this.Renamed9693.addMessage(MessageColor.YELLOW,localeService.getText(TextConst.TEXT_TEAM_KICK_COMPLAINT_SENT));
      }
      
      public function Renamed6607(param1:int) : void
      {
         this.Renamed9698.Renamed6607(param1);
      }
      
      public function Renamed6604() : void
      {
         this.Renamed9698.Renamed6604();
      }
      
      private function battleUserInfoService() : Renamed9669
      {
         return Renamed9669(this.Renamed9709);
      }
      
      public function Renamed9715(param1:int) : void
      {
         this.Renamed9693.Renamed5204(MessageColor.Renamed5390,localeService.getText(TanksLocale.TEXT_TOURNAMENT_BATTLE_TRAINING_LABEL),param1 * 1000);
      }
      
      public function Renamed9716(param1:int) : void
      {
         this.Renamed9693.Renamed5204(MessageColor.RED,localeService.getText(TanksLocale.TEXT_TOURNAMENT_BATTLE_STARTING_LABEL),param1 * 1000);
      }
      
      public function getTimeLeftInSec() : int
      {
         return 10000;
      }
   }
}

