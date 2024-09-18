package §?#f§
{
   import § !g§.§class for case§;
   import §-!z§.§!"L§;
   import §-!z§.§;"8§;
   import §-!z§.§final package dynamic§;
   import §-!z§.§switch const var§;
   import §<!E§.§include var with§;
   import §`"b§.§<1§;
   import §`"b§.§if for else§;
   import §`"b§.§super const final§;
   import §`#t§.§&p§;
   import alternativa.osgi.OSGi;
   import alternativa.osgi.service.display.IDisplay;
   import alternativa.tanks.battle.events.§;!?§;
   import alternativa.tanks.battle.events.BattleEventDispatcher;
   import alternativa.tanks.battle.events.§throw package continue§;
   import alternativa.tanks.battle.events.§var use§;
   import alternativa.tanks.gui.battle.BattleFinishDmNotification;
   import alternativa.tanks.models.battle.gui.§&"4§;
   import alternativa.tanks.services.battlegui.BattleGUIService;
   import alternativa.tanks.services.battleinput.BattleInputService;
   import alternativa.utils.removeDisplayObject;
   import flash.events.Event;
   import flash.events.KeyboardEvent;
   import flash.ui.Keyboard;
   import flash.utils.Dictionary;
   import §if set dynamic§.§]?§;
   import §if set dynamic§.§import set native§;
   import platform.client.fp10.core.model.IObjectLoadListener;
   import platform.client.fp10.core.model.ObjectUnloadListener;
   import projects.tanks.client.battleservice.model.statistics.§%q§;
   import projects.tanks.client.battleservice.model.statistics.§2$ §;
   import projects.tanks.client.battleservice.model.statistics.§in for for§;
   import projects.tanks.clients.flash.commons.services.notification.INotificationService;
   import projects.tanks.clients.flash.commons.services.serverhalt.IServerHaltService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.battle.IBattleInfoService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.layout.ILobbyLayoutService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.premium.PremiumService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.userproperties.IUserPropertiesService;
   import §var catch finally§.§>!^§;
   
   public class §8#o§ extends §]?§ implements §import set native§, IObjectLoadListener, ObjectUnloadListener, §if for else§, §throw package continue§, §<1§
   {
      [Inject]
      public static var display:IDisplay;
      
      [Inject]
      public static var lobbyLayoutService:ILobbyLayoutService;
      
      [Inject]
      public static var §^!w§:IServerHaltService;
      
      [Inject]
      public static var userPropertiesService:IUserPropertiesService;
      
      [Inject]
      public static var battleEventDispatcher:BattleEventDispatcher;
      
      [Inject]
      public static var §finally set§:BattleGUIService;
      
      [Inject]
      public static var §^"<§:BattleInputService;
      
      [Inject]
      public static var notificationService:INotificationService;
      
      [Inject]
      public static var battleInfoService:IBattleInfoService;
      
      [Inject]
      public static var premiumService:PremiumService;
      
      private var §"&§:§var use§;
      
      private var §include catch true§:§>!^§;
      
      private var §const const break§:Boolean;
      
      private var §5"]§:Dictionary;
      
      private var §,#0§:Vector.<§;"8§>;
      
      private var §include static§:int;
      
      public function §8#o§()
      {
         super();
         this.§"&§ = new §var use§(battleEventDispatcher,this);
         this.§"&§.§#"<§(§;!?§,this.§#!H§);
      }
      
      private static function §4!H§(param1:Vector.<§in for for§>) : Dictionary
      {
         var _loc2_:§final package dynamic§ = null;
         var _loc3_:§in for for§ = null;
         var _loc4_:§final package dynamic§ = null;
         var _loc5_:Dictionary = new Dictionary();
         var _loc6_:int = int(param1.length);
         var _loc7_:int = 0;
         while(_loc7_ < _loc6_)
         {
            _loc3_ = param1[_loc7_];
            _loc4_ = §switch const var§.§1!q§(_loc3_,§class for case§.NONE);
            _loc5_[_loc3_.user] = _loc4_;
            _loc7_++;
         }
         for each(_loc2_ in _loc5_)
         {
            _loc2_.loaded = true;
         }
         return _loc5_;
      }
      
      private function §#!H§(param1:§;!?§) : void
      {
         var _loc2_:§;"8§ = this.§in set get§(param1.tank.tankData.userName);
         _loc2_.loaded = true;
         this.§include catch true§.§try const true§(_loc2_);
      }
      
      [Obfuscation(rename="false")]
      public function objectLoaded() : void
      {
         this.§5"]§ = §4!H§(getInitParam().usersInfo);
         this.§,#0§ = §switch const var§.§&3§(this.§5"]§,getInitParam().usersInfo);
         this.§include static§ = getInitParam().usersInfo.length;
         var _loc1_:§super const final§ = §super const final§(OSGi.getInstance().getService(§&"4§));
         this.§include catch true§ = new §>!^§(_loc1_.getBattleName(),false);
         this.§include catch true§.addEventListener(§&p§.EXIT,this.§in package break§);
         this.§include catch true§.addEventListener(§&p§.CONTINUE,this.§get var class§);
         §finally set§.§get final§().addChild(this.§include catch true§);
      }
      
      [Obfuscation(rename="false")]
      public function objectLoadedPost() : void
      {
         this.battleActive = true;
         this.§"&§.§throw var set§();
         display.stage.addEventListener(KeyboardEvent.KEY_DOWN,this.onKeyDown);
         display.stage.addEventListener(KeyboardEvent.KEY_UP,this.onKeyUp);
         display.stage.addEventListener(Event.DEACTIVATE,this.§import set true§);
      }
      
      private function onKeyDown(param1:KeyboardEvent) : void
      {
         if(param1.keyCode == Keyboard.TAB && !§^"<§.§false set true§())
         {
            this.§0"+§();
         }
      }
      
      private function §0"+§() : void
      {
         if(this.battleActive)
         {
            this.§include catch true§.§each for catch§(false,false,userPropertiesService.userId,this.§,#0§,false,0);
         }
      }
      
      private function §include var use§() : void
      {
         if(this.battleActive)
         {
            this.§include catch true§.hide();
         }
      }
      
      private function onKeyUp(param1:KeyboardEvent) : void
      {
         if(param1.keyCode == Keyboard.TAB)
         {
            this.§include var use§();
         }
      }
      
      private function §import set true§(param1:Event) : void
      {
         this.§include var use§();
      }
      
      private function §in package break§(param1:§&p§) : void
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
      
      private function §get var class§(param1:§&p§) : void
      {
         §include var with§(object.adapt(§include var with§)).continueBattle();
      }
      
      [Obfuscation(rename="false")]
      public function objectUnloaded() : void
      {
         this.battleActive = false;
         this.§"&§.§#!V§();
         display.stage.removeEventListener(KeyboardEvent.KEY_DOWN,this.onKeyDown);
         display.stage.removeEventListener(KeyboardEvent.KEY_UP,this.onKeyUp);
         display.stage.removeEventListener(Event.DEACTIVATE,this.§import set true§);
         this.§include catch true§.hide();
         this.§include catch true§.removeEventListener(§&p§.EXIT,this.§in package break§);
         this.§include catch true§.removeEventListener(§&p§.CONTINUE,this.§get var class§);
         removeDisplayObject(this.§include catch true§);
         this.§include catch true§ = null;
         this.§5"]§.length = 0;
         this.§,#0§.length = 0;
         this.§,#0§ = null;
         this.§5"]§ = null;
         this.§include static§ = 0;
      }
      
      [Obfuscation(rename="false")]
      public function objectUnloadedPost() : void
      {
      }
      
      [Obfuscation(rename="false")]
      public function §var const native§(param1:§%q§) : void
      {
         var _loc2_:§;"8§ = §switch const var§.§var const native§(this.§,#0§,param1);
         this.§include catch true§.§try const true§(_loc2_);
         var _loc3_:§super const final§ = §super const final§(OSGi.getInstance().getService(§&"4§));
         _loc3_.§^$"§(_loc2_.userId,_loc2_.kills);
      }
      
      [Obfuscation(rename="false")]
      public function §4"c§(param1:Vector.<§%q§>) : void
      {
         this.§,#0§ = §switch const var§.§4"c§(this.§5"]§,param1);
         var _loc2_:§super const final§ = §super const final§(OSGi.getInstance().getService(§&"4§));
         var _loc3_:int = int(param1.length);
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            _loc2_.§^$"§(param1[_loc4_].user,param1[_loc4_].kills);
            _loc4_++;
         }
         this.§include catch true§.§class const override§(this.§,#0§);
      }
      
      [Obfuscation(rename="false")]
      public function userConnect(param1:String, param2:Vector.<§in for for§>) : void
      {
         var _loc3_:§in for for§ = §switch const var§.§,m§(param1,param2);
         this.§5"]§[param1] = §switch const var§.§1!q§(_loc3_,§class for case§.NONE);
         ++this.§include static§;
         this.§,#0§ = §switch const var§.§&3§(this.§5"]§,param2);
         if(this.battleActive)
         {
            this.§include catch true§.§class const override§(this.§,#0§);
         }
      }
      
      [Obfuscation(rename="false")]
      public function §dynamic var native§(param1:String) : void
      {
         if(this.battleActive)
         {
            this.§include catch true§.§set for while§(param1,§class for case§.NONE);
         }
         var _loc2_:§super const final§ = §super const final§(OSGi.getInstance().getService(§&"4§));
         var _loc3_:§final package dynamic§ = this.§5"]§[param1];
         _loc2_.§dynamic var native§(_loc3_.getShortUserInfo());
         delete this.§5"]§[param1];
         --this.§include static§;
         this.§,#0§ = §switch const var§.§#"=§(this.§,#0§,param1);
      }
      
      public function getShortUserInfo(param1:String) : §!"L§
      {
         var _loc2_:§final package dynamic§ = this.§5"]§[param1];
         if(_loc2_ != null)
         {
            return _loc2_.getShortUserInfo();
         }
         return null;
      }
      
      public function isLoaded(param1:String) : Boolean
      {
         var _loc2_:§final package dynamic§ = this.§5"]§[param1];
         return _loc2_ != null && _loc2_.loaded;
      }
      
      public function §7!^§(param1:String, param2:Boolean) : void
      {
         var _loc3_:§;"8§ = this.§in set get§(param1);
         if(_loc3_ != null)
         {
            _loc3_.suspicious = param2;
            this.§include catch true§.§try const true§(_loc3_);
         }
      }
      
      public function §`H§(param1:String, param2:int) : void
      {
         var _loc3_:§;"8§ = this.§in set get§(param1);
         _loc3_.rank = param2;
         this.§include catch true§.§try const true§(_loc3_);
      }
      
      public function handleBattleEvent(param1:Object) : void
      {
         this.§"&§.handleBattleEvent(param1);
      }
      
      public function roundStart() : void
      {
         this.battleActive = true;
         this.§include catch true§.hide();
      }
      
      public function §1#x§() : void
      {
         this.battleActive = false;
         this.§include catch true§.hide();
      }
      
      public function roundFinish(param1:Boolean, param2:Boolean, param3:int, param4:Vector.<§2$ §>, param5:int, param6:int) : void
      {
         var _loc7_:* = false;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         this.battleActive = false;
         this.§include catch true§.hide();
         §switch const var§.§finally for return§(this.§,#0§,param4,param5);
         if(param2)
         {
            _loc7_ = param5 > 0;
            param3 = §^!w§.isServerHalt ? int(-1) : int(param3);
            this.§include catch true§.§each for catch§(param1,_loc7_,userPropertiesService.userId,this.§,#0§,true,param3);
            if(lobbyLayoutService.isWindowOpenOverBattle() && !battleInfoService.isSpectatorMode())
            {
               _loc8_ = §switch const var§.§include for implements§(userPropertiesService.userId,param4);
               _loc9_ = 0;
               if(premiumService.hasPremium())
               {
                  _loc9_ += §switch const var§.§null set if§(_loc8_,param5);
               }
               notificationService.addNotification(new BattleFinishDmNotification(this.§case for include§(),this.§,#0§.length,_loc8_,_loc9_));
            }
         }
      }
      
      private function §case for include§() : int
      {
         this.§,#0§.sort(function(param1:§;"8§, param2:§;"8§):Number
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
         return §switch const var§.§>3§(this.§,#0§,userPropertiesService.userId) + 1;
      }
      
      private function §in set get§(param1:String) : §;"8§
      {
         return §switch const var§.§^"=§(this.§,#0§,param1);
      }
      
      public function getUsersCount() : int
      {
         return this.§include static§;
      }
      
      private function get battleActive() : Boolean
      {
         return this.§const const break§;
      }
      
      private function set battleActive(param1:Boolean) : void
      {
         this.§const const break§ = param1;
         battleInfoService.battleActive = param1;
      }
   }
}

