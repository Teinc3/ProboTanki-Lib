package §with for function§
{
   import § !g§.§class for case§;
   import §+#J§.§;#y§;
   import §+#J§.§for catch extends§;
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
   import alternativa.tanks.battle.events.§,!7§;
   import alternativa.tanks.battle.events.§;!?§;
   import alternativa.tanks.battle.events.BattleEventDispatcher;
   import alternativa.tanks.battle.events.§throw package continue§;
   import alternativa.tanks.battle.events.§var use§;
   import alternativa.tanks.gui.battle.BattleFinishTeamNotification;
   import alternativa.tanks.models.battle.gui.§&"4§;
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
   
   public class §final set native§ extends §for catch extends§ implements §;#y§, ObjectLoadListener, ObjectLoadPostListener, ObjectUnloadListener, §if for else§, §throw package continue§, §<1§
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
      
      private var battleActive:Boolean;
      
      private var §include catch true§:§>!^§;
      
      private var §throw§:Vector.<§;"8§>;
      
      private var §function for override§:Vector.<§;"8§>;
      
      private var §5"]§:Dictionary;
      
      private var §`#Y§:§class for case§;
      
      private var §class const§:§class for case§;
      
      private var scoreRed:int;
      
      private var scoreBlue:int;
      
      private var §include static§:int;
      
      public function §final set native§()
      {
         super();
         this.§"&§ = new §var use§(battleEventDispatcher,this);
         this.§"&§.§#"<§(§,!7§,this.§&!X§);
         this.§"&§.§#"<§(§;!?§,this.§#!H§);
      }
      
      private static function §final catch class§(param1:§class for case§) : void
      {
         var _loc2_:ChangeTeamAlert = new ChangeTeamAlert(3,param1 == §class for case§.RED ? int(ChangeTeamAlert.RED) : int(ChangeTeamAlert.BLUE));
         _loc2_.x = display.stage.stageWidth - _loc2_.width >> 1;
         _loc2_.y = display.stage.stageHeight - _loc2_.height >> 1;
         §finally set§.§break catch true§().addChild(_loc2_);
      }
      
      private static function §4!H§(param1:Vector.<§in for for§>, param2:Vector.<§in for for§>) : Dictionary
      {
         var _loc3_:§in for for§ = null;
         var _loc4_:§in for for§ = null;
         var _loc5_:§final package dynamic§ = null;
         var _loc6_:Dictionary = new Dictionary();
         for each(_loc3_ in param1)
         {
            _loc6_[_loc3_.user] = §switch const var§.§1!q§(_loc3_,§class for case§.RED);
         }
         for each(_loc4_ in param2)
         {
            _loc6_[_loc4_.user] = §switch const var§.§1!q§(_loc4_,§class for case§.BLUE);
         }
         for each(_loc5_ in _loc6_)
         {
            _loc5_.loaded = true;
         }
         return _loc6_;
      }
      
      private static function §extends var implements§(param1:Vector.<§;"8§>, param2:§class for case§) : void
      {
         var _loc3_:§;"8§ = null;
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
      
      private function §&!X§(param1:§,!7§) : void
      {
         if(param1.tank.§if for with§().id == userPropertiesService.userId)
         {
            if(param1.tank.teamType != this.§class const§)
            {
               this.§class const§ = param1.tank.teamType;
               §final catch class§(this.§class const§);
            }
         }
      }
      
      private function §#!H§(param1:§;!?§) : void
      {
         var _loc2_:§;"8§ = this.§in set get§(param1.tank.tankData.userName);
         _loc2_.loaded = true;
         this.§include catch true§.§ #o§(_loc2_);
      }
      
      [Obfuscation(rename="false")]
      public function objectLoaded() : void
      {
         this.§class const§ = §class for case§.NONE;
         this.§5"]§ = §4!H§(getInitParam().§null for null§,getInitParam().§-f§);
         this.§include static§ = getInitParam().§null for null§.length + getInitParam().§-f§.length;
         this.§throw§ = §switch const var§.§&3§(this.§5"]§,getInitParam().§null for null§);
         this.§function for override§ = §switch const var§.§&3§(this.§5"]§,getInitParam().§-f§);
         var _loc1_:§super const final§ = §super const final§(OSGi.getInstance().getService(§&"4§));
         this.§include catch true§ = new §>!^§(_loc1_.getBattleName(),true);
         this.§include catch true§.addEventListener(§&p§.EXIT,this.§in package break§);
         this.§include catch true§.addEventListener(§&p§.CONTINUE,this.§get var class§);
         §finally set§.§get final§().addChild(this.§include catch true§);
      }
      
      [Obfuscation(rename="false")]
      public function objectLoadedPost() : void
      {
         this.battleActive = true;
         this.§throw set get§(§class for case§.RED,getInitParam().§override const const§);
         this.§throw set get§(§class for case§.BLUE,getInitParam().§break var for§);
         this.§catch set case§();
         this.§"&§.§throw var set§();
         display.stage.addEventListener(KeyboardEvent.KEY_DOWN,this.onKeyDown);
         display.stage.addEventListener(KeyboardEvent.KEY_UP,this.onKeyUp);
         display.stage.addEventListener(Event.DEACTIVATE,this.§import set true§);
      }
      
      private function §catch set case§() : void
      {
         var _loc1_:§;"8§ = this.§in set get§(userPropertiesService.userId);
         if(_loc1_ != null)
         {
            this.§`#Y§ = _loc1_.teamType;
         }
      }
      
      private function onKeyDown(param1:KeyboardEvent) : void
      {
         if(param1.keyCode == Keyboard.TAB && !§^"<§.§false set true§())
         {
            this.§0"+§();
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
      
      private function §0"+§() : void
      {
         if(this.battleActive)
         {
            this.§include catch true§.§final for final§(false,userPropertiesService.userId,this.§throw§,this.§function for override§,false,0,this.§`#Y§);
         }
      }
      
      private function §include var use§() : void
      {
         if(this.battleActive)
         {
            this.§include catch true§.hide();
         }
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
         this.§throw§ = null;
         this.§function for override§ = null;
         this.§5"]§ = null;
         this.§class const§ = null;
         this.§include static§ = 0;
      }
      
      [Obfuscation(rename="false")]
      public function §throw set get§(param1:§class for case§, param2:int) : void
      {
         if(param1 == §class for case§.RED)
         {
            this.scoreRed = param2;
         }
         if(param1 == §class for case§.BLUE)
         {
            this.scoreBlue = param2;
         }
         var _loc3_:§super const final§ = §super const final§(OSGi.getInstance().getService(§&"4§));
         _loc3_.§throw set get§(param1,param2);
      }
      
      [Obfuscation(rename="false")]
      public function userConnect(param1:String, param2:Vector.<§in for for§>, param3:§class for case§) : void
      {
         var _loc4_:§in for for§ = §switch const var§.§,m§(param1,param2);
         this.§5"]§[param1] = §switch const var§.§1!q§(_loc4_,param3);
         ++this.§include static§;
         if(param3 == §class for case§.RED)
         {
            this.§throw§ = §switch const var§.§&3§(this.§5"]§,param2);
            if(this.battleActive)
            {
               this.§include catch true§.§get package case§(this.§throw§,param3);
            }
         }
         if(param3 == §class for case§.BLUE)
         {
            this.§function for override§ = §switch const var§.§&3§(this.§5"]§,param2);
            if(this.battleActive)
            {
               this.§include catch true§.§get package case§(this.§function for override§,param3);
            }
         }
      }
      
      [Obfuscation(rename="false")]
      public function §dynamic var native§(param1:String) : void
      {
         var _loc2_:§final package dynamic§ = this.§5"]§[param1];
         var _loc3_:§super const final§ = §super const final§(OSGi.getInstance().getService(§&"4§));
         _loc3_.§dynamic var native§(_loc2_.getShortUserInfo());
         if(this.battleActive)
         {
            this.§include catch true§.§set for while§(param1,_loc2_.teamType);
         }
         if(_loc2_.teamType == §class for case§.RED)
         {
            this.§throw§ = §switch const var§.§#"=§(this.§throw§,param1);
         }
         if(_loc2_.teamType == §class for case§.BLUE)
         {
            this.§function for override§ = §switch const var§.§#"=§(this.§function for override§,param1);
         }
         delete this.§5"]§[param1];
         --this.§include static§;
      }
      
      [Obfuscation(rename="false")]
      public function §var const native§(param1:§%q§, param2:§class for case§) : void
      {
         var _loc3_:§;"8§ = null;
         if(param2 == §class for case§.RED)
         {
            _loc3_ = §switch const var§.§var const native§(this.§throw§,param1);
         }
         if(param2 == §class for case§.BLUE)
         {
            _loc3_ = §switch const var§.§var const native§(this.§function for override§,param1);
         }
         var _loc4_:§super const final§ = §super const final§(OSGi.getInstance().getService(§&"4§));
         _loc4_.§^$"§(param1.user,param1.kills);
         this.§include catch true§.§ #o§(_loc3_);
      }
      
      [Obfuscation(rename="false")]
      public function §4"c§(param1:Vector.<§%q§>, param2:§class for case§) : void
      {
         if(param2 == §class for case§.RED)
         {
            this.§throw§ = §switch const var§.§4"c§(this.§5"]§,param1);
            this.§include catch true§.§get package case§(this.§throw§,param2);
         }
         if(param2 == §class for case§.BLUE)
         {
            this.§function for override§ = §switch const var§.§4"c§(this.§5"]§,param1);
            this.§include catch true§.§get package case§(this.§function for override§,param2);
         }
      }
      
      [Obfuscation(rename="false")]
      public function §-!Z§(param1:Vector.<§%q§>, param2:Vector.<§%q§>) : void
      {
         this.§throw§ = §switch const var§.§4"c§(this.§5"]§,param1);
         this.§function for override§ = §switch const var§.§4"c§(this.§5"]§,param2);
         §extends var implements§(this.§throw§,§class for case§.RED);
         §extends var implements§(this.§function for override§,§class for case§.BLUE);
         this.§catch set case§();
         this.§include catch true§.§get package case§(this.§throw§,§class for case§.RED);
         this.§include catch true§.§get package case§(this.§function for override§,§class for case§.BLUE);
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
      
      private function §in set get§(param1:String) : §;"8§
      {
         var _loc2_:§;"8§ = §switch const var§.§^"=§(this.§throw§,param1);
         if(_loc2_ == null)
         {
            _loc2_ = §switch const var§.§^"=§(this.§function for override§,param1);
         }
         return _loc2_;
      }
      
      public function §7!^§(param1:String, param2:Boolean) : void
      {
         var _loc3_:§;"8§ = this.§in set get§(param1);
         if(_loc3_ != null)
         {
            _loc3_.suspicious = param2;
            this.§include catch true§.§ #o§(_loc3_);
         }
      }
      
      public function §`H§(param1:String, param2:int) : void
      {
         var _loc3_:§;"8§ = this.§in set get§(param1);
         _loc3_.rank = param2;
         this.§include catch true§.§ #o§(_loc3_);
      }
      
      public function handleBattleEvent(param1:Object) : void
      {
         this.§"&§.handleBattleEvent(param1);
      }
      
      public function roundStart() : void
      {
         this.battleActive = true;
         this.§include catch true§.hide();
         this.§throw set get§(§class for case§.RED,0);
         this.§throw set get§(§class for case§.BLUE,0);
      }
      
      public function §1#x§() : void
      {
         this.battleActive = true;
         this.§include catch true§.hide();
      }
      
      public function roundFinish(param1:Boolean, param2:Boolean, param3:int, param4:Vector.<§2$ §>, param5:int, param6:int) : void
      {
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         this.battleActive = false;
         this.§include catch true§.hide();
         §switch const var§.§finally for return§(this.§throw§,param4,param5);
         §switch const var§.§finally for return§(this.§function for override§,param4,param5);
         if(param2)
         {
            this.§include catch true§.§final for final§(param1,userPropertiesService.userId,this.§throw§,this.§function for override§,true,§^!w§.isServerHalt ? int(-1) : int(param3),this.§`#Y§);
         }
         if(param2 && lobbyLayoutService.isWindowOpenOverBattle() && !battleInfoService.isSpectatorMode())
         {
            _loc7_ = §switch const var§.§include for implements§(userPropertiesService.userId,param4);
            _loc8_ = 0;
            if(premiumService.hasPremium())
            {
               _loc8_ += §switch const var§.§null set if§(_loc7_,param5);
            }
            notificationService.addNotification(new BattleFinishTeamNotification(this.§"#F§(),this.§ "j§(),this.§case for include§(),this.§00§(),_loc7_,_loc8_));
         }
      }
      
      private function §"#F§() : Boolean
      {
         if(this.§`#Y§ == §class for case§.RED)
         {
            return this.scoreRed > this.scoreBlue;
         }
         if(this.§`#Y§ == §class for case§.BLUE)
         {
            return this.scoreBlue > this.scoreRed;
         }
         return false;
      }
      
      private function § "j§() : Boolean
      {
         if(this.§`#Y§ == §class for case§.RED)
         {
            return this.scoreBlue > this.scoreRed;
         }
         if(this.§`#Y§ == §class for case§.BLUE)
         {
            return this.scoreRed > this.scoreBlue;
         }
         return false;
      }
      
      private function §00§() : int
      {
         if(this.§`#Y§ == §class for case§.RED)
         {
            return this.§throw§.length;
         }
         if(this.§`#Y§ == §class for case§.BLUE)
         {
            return this.§function for override§.length;
         }
         return 0;
      }
      
      private function §case for include§() : int
      {
         var §]#c§:int;
         this.§throw§.sort(function(param1:§;"8§, param2:§;"8§):Number
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
         this.§function for override§.sort(function(param1:§;"8§, param2:§;"8§):Number
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
         §]#c§ = 0;
         if(this.§`#Y§ == §class for case§.RED)
         {
            §]#c§ = §switch const var§.§>3§(this.§throw§,userPropertiesService.userId);
         }
         else if(this.§`#Y§ == §class for case§.BLUE)
         {
            §]#c§ = §switch const var§.§>3§(this.§function for override§,userPropertiesService.userId);
         }
         return §]#c§ + 1;
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
      
      public function getUsersCount() : int
      {
         return this.§include static§;
      }
   }
}

