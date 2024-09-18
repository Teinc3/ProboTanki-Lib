package §`"b§
{
   import § !g§.§class for case§;
   import §%"v§.§>"G§;
   import §%3§.MessageColor;
   import §&<§.§implements const include§;
   import §-!z§.§!"L§;
   import §-!z§.§^!I§;
   import §1!R§.§throw package static§;
   import §]#1§.§^;§;
   import alternativa.osgi.OSGi;
   import alternativa.osgi.service.display.IDisplay;
   import alternativa.osgi.service.locale.ILocaleService;
   import alternativa.service.IModelService;
   import alternativa.tanks.battle.§;!t§;
   import alternativa.tanks.battle.BattleService;
   import alternativa.tanks.help.IHelpService;
   import alternativa.tanks.locale.constants.TextConst;
   import alternativa.tanks.models.battle.gui.§&"4§;
   import alternativa.tanks.models.battle.gui.chat.§finally else§;
   import alternativa.tanks.models.battle.gui.gui.statistics.field.§const set final§;
   import alternativa.tanks.models.tank.§7!9§;
   import alternativa.tanks.service.settings.ISettingsService;
   import alternativa.tanks.services.battlegui.BattleGUIService;
   import alternativa.tanks.utils.removeDisplayObject;
   import alternativa.types.Long;
   import §catch for null§.§!#Q§;
   import flash.display.DisplayObjectContainer;
   import flash.events.Event;
   import forms.FocusWarningWindow;
   import projects.tanks.client.battleservice.model.statistics.§2$ §;
   import projects.tanks.client.battleservice.model.statistics.§case package class§;
   import projects.tanks.client.battleservice.model.statistics.§in package function§;
   import projects.tanks.clients.fp10.libraries.TanksLocale;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.storage.IStorageService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.userproperties.IUserPropertiesService;
   import projects.tanks.clients.fp10.libraries.tanksservices.utils.BattleFormatUtil;
   import scpacker.utils.§throw package each§;
   import §switch const super§.§do catch return§;
   import §with var import§.§ #X§;
   
   public class §function catch extends§ extends §in package function§ implements §case package class§, §super const final§, §&"4§, §;!t§
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
      public static var §finally set§:BattleGUIService;
      
      [Inject]
      public static var §]"j§:BattleFormatUtil;
      
      [Inject]
      public static var display:IDisplay;
      
      private var §6"o§:IModelService;
      
      private var §get package native§:Boolean;
      
      private var §5J§:§ #X§;
      
      private var §continue catch finally§:§do catch return§;
      
      private var §>"$§:§>"G§;
      
      private var §switch var extends§:§^;§;
      
      private var battleName:String;
      
      private var §true catch get§:String;
      
      private var §;T§:String;
      
      private var §implements set in§:FocusWarningWindow;
      
      private var §include switch§:§final const use§;
      
      private var §4r§:§=#h§;
      
      private var controlsHelpSupport:§function set class§;
      
      private var §["A§:§+y§;
      
      private var §super catch final§:§implements const include§;
      
      private var §get catch for§:§^!I§;
      
      private var §final set try§:§,#[§;
      
      private var §8!!§:§#!M§;
      
      private var §!!C§:§,#n§;
      
      private var parkourMode:Boolean;
      
      private var equipmentConstraintsMode:§throw package static§;
      
      public function §function catch extends§()
      {
         super();
         this.§switch var extends§ = new §^;§();
         §!#Q§.init(500);
         OSGi.getInstance().registerService(§&"4§,this);
      }
      
      public function §var package implements§(param1:int, param2:int) : void
      {
         this.§>"$§.update(param2);
      }
      
      public function getBattleName() : String
      {
         var _loc1_:String = this.battleName;
         var _loc2_:§throw package static§ = this.equipmentConstraintsMode;
         var _loc3_:Boolean = this.parkourMode;
         if(§]"j§.§8z§(_loc2_,_loc3_))
         {
            _loc1_ = _loc1_ + " " + §]"j§.§<!C§(_loc2_,_loc3_);
         }
         return _loc1_;
      }
      
      public function userConnect(param1:§!"L§) : void
      {
         this.§continue catch finally§.addMessage(param1,this.§true catch get§);
      }
      
      public function §dynamic var native§(param1:§!"L§) : void
      {
         this.§continue catch finally§.addMessage(param1,this.§;T§);
      }
      
      public function §^$"§(param1:String, param2:int) : void
      {
         this.§5J§.§^$"§(param1,param2);
      }
      
      public function §throw set get§(param1:§class for case§, param2:int) : void
      {
         this.§5J§.§var catch while§(param1,param2);
      }
      
      public function §@e§(param1:uint, param2:String) : void
      {
         this.§>"$§.addMessage(param1,param2);
      }
      
      public function objectLoaded() : void
      {
         this.battleName = getInitParam().mapName;
         this.equipmentConstraintsMode = getInitParam().equipmentConstraintsMode;
         this.parkourMode = getInitParam().parkourMode;
         this.§true catch get§ = localeService.getText(TanksLocale.TEXT_BATTLE_PLAYER_JOINED);
         this.§;T§ = localeService.getText(TanksLocale.TEXT_BATTLE_PLAYER_LEFT);
         var _loc1_:§,#n§ = new §,#n§(null);
         this.§!!C§ = _loc1_;
         this.§final set try§ = new §,#[§();
         this.§8!!§ = new §#!M§();
         this.§super catch final§ = new §implements const include§();
         this.§["A§ = new §+y§(this.§switch var extends§);
         var _loc2_:DisplayObjectContainer = §finally set§.§break catch true§();
         this.§5J§ = new § #X§(userPropertiesService.userId,getInitParam().fund,getInitParam().§function function§,getInitParam().§in if§,§throw package each§.§function set var§(getInitParam().battleMode),true);
         _loc2_.addChild(this.§5J§);
         this.§get catch for§ = new §^!I§();
         this.§get catch for§.§[A§(this.§5J§);
         this.§get catch for§.init();
         this.§>"$§ = new §>"G§();
         _loc2_.addChild(this.§>"$§);
         this.§continue catch finally§ = new §do catch return§();
         _loc2_.addChild(this.§continue catch finally§);
         if(settingsService.showFPS)
         {
            _loc2_.addChild(this.§switch var extends§);
         }
         if(getInitParam().spectator)
         {
            this.§`!q§();
         }
         else
         {
            this.§4r§ = new §=#h§();
            this.controlsHelpSupport = new §function set class§();
         }
         display.stage.addEventListener(Event.RESIZE,this.onResize);
         this.onResize(null);
      }
      
      public function §get set final§(param1:§const set final§) : void
      {
         this.§get catch for§.§get set final§(param1);
      }
      
      public function objectUnloaded() : void
      {
         display.stage.removeEventListener(Event.RESIZE,this.onResize);
         removeDisplayObject(this.§5J§);
         removeDisplayObject(this.§continue catch finally§);
         removeDisplayObject(this.§switch var extends§);
         this.§5J§ = null;
         battleService.§'x§().§%"7§(this);
         if(this.§4r§ != null)
         {
            this.§4r§.close();
         }
         if(this.controlsHelpSupport != null)
         {
            this.controlsHelpSupport.close();
         }
         this.§8!!§.close();
         this.§final set try§.close();
         this.§["A§.close();
         this.§super catch final§.close();
         if(this.§include switch§ != null)
         {
            this.§include switch§.close();
         }
         this.§include switch§ = null;
         this.§continue catch finally§ = null;
         this.§>"$§.removeFromParent();
         this.§>"$§ = null;
         this.§get catch for§.destroy();
         this.§get catch for§ = null;
         this.§!!C§.close();
      }
      
      private function §2"U§() : Boolean
      {
         return getInitParam().§function function§.timeLimitInSec != 0;
      }
      
      [Obfuscation(rename="false")]
      public function objectLoadedPost() : void
      {
         var _loc1_:Boolean = false;
         this.§"<§(getInitParam().§`#L§);
         battleService.§'x§().§%#9§(this);
         if(this.§2"U§())
         {
            _loc1_ = getInitParam().spectator;
            if(!_loc1_ || _loc1_ && this.battleUserInfoService().getUsersCount() > 0)
            {
               this.§5J§.§#d§(getInitParam().§in if§);
            }
         }
      }
      
      private function §`!q§() : void
      {
         var _loc1_:§finally else§ = §finally else§(modelRegistry.getModel(Long.getLong(1896886505,1439133662)));
         this.§include switch§ = new §final const use§(_loc1_.§]#6§(),this.§continue catch finally§,this.§>"$§,this.§5J§,this.§switch var extends§);
      }
      
      private function §"<§(param1:Vector.<String>) : void
      {
         var _loc2_:String = null;
         for each(_loc2_ in param1)
         {
            this.§&#r§(_loc2_,true);
         }
      }
      
      public function §2#a§(param1:String) : void
      {
         this.§continue catch finally§.addMessage(null,param1,null);
      }
      
      [Obfuscation(rename="false")]
      public function §`"G§(param1:int) : void
      {
         this.§5J§.§<!§(param1);
      }
      
      [Obfuscation(rename="false")]
      public function roundStart(param1:int, param2:Boolean) : void
      {
         this.§5J§.§function for with§(param2);
         if(param1 > 0)
         {
            this.§5J§.§#d§(param1);
         }
         var _loc3_:§<1§ = §<1§(OSGi.getInstance().getService(§if for else§));
         _loc3_.roundStart();
      }
      
      [Obfuscation(rename="false")]
      public function §1#x§() : void
      {
         if(this.§2"U§())
         {
            this.§5J§.§do package final§();
         }
         this.§5J§.§2!;§();
         var _loc1_:§<1§ = §<1§(object.adapt(§<1§));
         _loc1_.§1#x§();
      }
      
      [Obfuscation(rename="false")]
      public function roundFinish(param1:Boolean, param2:Vector.<§2$ §>, param3:int) : void
      {
         var _loc4_:§<1§ = §<1§(OSGi.getInstance().getService(§if for else§));
         _loc4_.roundFinish(false,param1,param3,param2,100,0);
         this.§5J§.§set catch false§();
      }
      
      public function §catch catch if§(param1:String, param2:String, param3:String = null) : void
      {
         var _loc4_:§if for else§ = §if for else§(OSGi.getInstance().getService(§if for else§));
         var _loc5_:§!"L§ = _loc4_.getShortUserInfo(param1);
         var _loc6_:§!"L§ = param3 == null ? null : _loc4_.getShortUserInfo(param3);
         this.§continue catch finally§.addMessage(_loc5_,param2,_loc6_);
      }
      
      public function §&#B§(param1:String, param2:String) : void
      {
         var _loc3_:§if for else§ = §if for else§(OSGi.getInstance().getService(§if for else§));
         var _loc4_:§!"L§ = _loc3_.getShortUserInfo(param1);
         this.§continue catch finally§.addMessage(_loc4_,param2);
      }
      
      public function §"!#§(param1:§class for case§) : void
      {
         this.§5J§.§"!#§(param1);
      }
      
      public function §while catch class§(param1:§class for case§) : void
      {
         this.§5J§.§while catch class§(param1);
      }
      
      public function §var const get§(param1:§class for case§) : void
      {
         this.§5J§.§var const get§(param1);
      }
      
      public function §use for case§() : void
      {
         this.§5J§.§use for case§();
      }
      
      public function §continue catch import§() : void
      {
         this.§5J§.§continue catch import§();
      }
      
      public function §5"8§() : void
      {
         this.§5J§.§5"8§();
      }
      
      [Obfuscation(rename="false")]
      public function §null var return§(param1:String, param2:int) : void
      {
         var _loc3_:§if for else§ = §if for else§(OSGi.getInstance().getService(§if for else§));
         _loc3_.§`H§(param1,param2);
         if(§7!9§.§8"-§ != null && param1 == §7!9§.§8"-§.user.id)
         {
            §=#h§(this.§4r§).close();
         }
         var _loc4_:§,#n§ = this.battleUserInfoService();
         _loc4_.§try for null§(param1,param2);
      }
      
      private function onResize(param1:Event) : void
      {
         var _loc2_:int = display.stage.stageWidth;
         var _loc3_:int = display.stage.stageHeight;
         if(this.§>"$§ != null)
         {
            this.§>"$§.x = 0.5 * _loc2_;
            this.§>"$§.y = 40;
         }
      }
      
      private function §&#r§(param1:String, param2:Boolean) : void
      {
         var _loc3_:§if for else§ = §if for else§(OSGi.getInstance().getService(§if for else§));
         _loc3_.§7!^§(param1,param2);
         var _loc4_:§,#n§ = this.battleUserInfoService();
         _loc4_.§catch for final§(param1,param2);
      }
      
      [Obfuscation(rename="false")]
      public function §%"l§(param1:String, param2:Boolean) : void
      {
         this.§&#r§(param1,param2);
      }
      
      [Obfuscation(rename="false")]
      public function §override set catch§() : void
      {
         this.§>"$§.addMessage(MessageColor.YELLOW,localeService.getText(TextConst.TEXT_TEAM_KICK_COMPLAINT_SENT));
      }
      
      public function §const package null§(param1:int) : void
      {
         this.§5J§.§const package null§(param1);
      }
      
      public function §"#"§() : void
      {
         this.§5J§.§"#"§();
      }
      
      private function battleUserInfoService() : §,#n§
      {
         return §,#n§(this.§!!C§);
      }
      
      public function §""u§(param1:int) : void
      {
         this.§>"$§.§switch catch dynamic§(MessageColor.§%#K§,localeService.getText(TanksLocale.TEXT_TOURNAMENT_BATTLE_TRAINING_LABEL),param1 * 1000);
      }
      
      public function §<"%§(param1:int) : void
      {
         this.§>"$§.§switch catch dynamic§(MessageColor.RED,localeService.getText(TanksLocale.TEXT_TOURNAMENT_BATTLE_STARTING_LABEL),param1 * 1000);
      }
      
      public function getTimeLeftInSec() : int
      {
         return 10000;
      }
   }
}

