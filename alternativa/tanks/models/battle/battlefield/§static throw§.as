package alternativa.tanks.models.battle.battlefield
{
   import § !V§.§=p§;
   import §+!e§.§[@§;
   import §14§.§7"]§;
   import §7"j§.§final var super§;
   import §7"j§.§finally const package§;
   import §;"?§.§#">§;
   import §<">§.§finally catch§;
   import §@$ §.§for var finally§;
   import §@$ §.§static static§;
   import §@$ §.§switch var in§;
   import alternativa.math.Vector3;
   import alternativa.object.ClientObject;
   import alternativa.osgi.OSGi;
   import alternativa.osgi.service.display.IDisplay;
   import alternativa.osgi.service.locale.ILocaleService;
   import alternativa.osgi.service.logging.LogService;
   import alternativa.osgi.service.logging.Logger;
   import alternativa.physics.collision.types.AABB;
   import alternativa.tanks.battle.§+$%§;
   import alternativa.tanks.battle.§-q§;
   import alternativa.tanks.battle.§0_§;
   import alternativa.tanks.battle.BattleService;
   import alternativa.tanks.battle.§class true§;
   import alternativa.tanks.battle.events.§##a§;
   import alternativa.tanks.battle.events.§8!k§;
   import alternativa.tanks.battle.events.BattleEventDispatcher;
   import alternativa.tanks.battle.events.§`E§;
   import alternativa.tanks.battle.events.§case package with§;
   import alternativa.tanks.battle.events.§const var finally§;
   import alternativa.tanks.battle.events.§throw each§;
   import alternativa.tanks.battle.events.§throw package continue§;
   import alternativa.tanks.battle.events.§var use§;
   import alternativa.tanks.battle.objects.tank.Tank;
   import alternativa.tanks.battle.scene3d.§'!4§;
   import alternativa.tanks.battle.scene3d.§[!r§;
   import alternativa.tanks.bg.IBackgroundService;
   import alternativa.tanks.bonuses.Bonus;
   import alternativa.tanks.bonuses.BonusCache;
   import alternativa.tanks.camera.§<#Q§;
   import alternativa.tanks.camera.§function const package§;
   import alternativa.tanks.camera.§var set package§;
   import alternativa.tanks.gui.error.ErrorForm;
   import alternativa.tanks.models.tank.§2!s§;
   import alternativa.tanks.models.tank.§finally var return§;
   import alternativa.tanks.models.tank.§var catch§;
   import alternativa.tanks.models.weapon.shared.§%!v§;
   import alternativa.tanks.models.weapon.shared.§%#e§;
   import alternativa.tanks.models.weapon.shared.§]!m§;
   import alternativa.tanks.models.weapon.shared.§set set get§;
   import alternativa.tanks.service.settings.ISettingsService;
   import alternativa.tanks.service.settings.SettingsServiceEvent;
   import alternativa.tanks.service.settings.keybinding.§&7§;
   import alternativa.tanks.service.settings.keybinding.KeysBindingService;
   import alternativa.tanks.services.battlegui.BattleGUIService;
   import alternativa.tanks.services.battleinput.BattleInputService;
   import alternativa.tanks.services.battleinput.§class const while§;
   import alternativa.tanks.services.battlereadiness.BattleReadinessService;
   import alternativa.tanks.services.colortransform.ColorTransformService;
   import alternativa.tanks.services.colortransform.§]#y§;
   import alternativa.tanks.services.lightingeffects.ILightingEffectsService;
   import alternativa.tanks.services.mipmapping.MipMappingService;
   import alternativa.tanks.services.targeting.TargetingInputManager;
   import alternativa.tanks.services.targeting.TargetingModeService;
   import alternativa.tanks.utils.DataValidationErrorEvent;
   import alternativa.tanks.utils.DataValidator;
   import alternativa.types.Long;
   import alternativa.utils.DebugPanel;
   import alternativa.utils.TextureMaterialRegistry;
   import §catch package super§.§in const§;
   import §class var for§.§const set default§;
   import com.alternativaplatform.projects.tanks.client.models.battlefield.BattleBonus;
   import com.alternativaplatform.projects.tanks.client.models.battlefield.BattlefieldResources;
   import §dynamic catch class§.§7#j§;
   import §extends for const§.§import use§;
   import §false const case§.§##Z§;
   import flash.display.BitmapData;
   import flash.events.Event;
   import flash.events.KeyboardEvent;
   import flash.geom.ColorTransform;
   import flash.geom.Vector3D;
   import flash.media.Sound;
   import flash.utils.Dictionary;
   import §for set super§.§!"N§;
   import §if set import§.§case for package§;
   import §native for§.§4#=§;
   import platform.client.fp10.core.model.ObjectLoadListener;
   import platform.client.fp10.core.model.ObjectUnloadListener;
   import platform.client.fp10.core.registry.ResourceRegistry;
   import platform.client.fp10.core.resource.types.SoundResource;
   import platform.client.fp10.core.type.IGameObject;
   import projects.tanks.client.battlefield.models.battle.battlefield.§include set final§;
   import projects.tanks.client.battlefield.models.battle.battlefield.§try const get§;
   import projects.tanks.clients.flash.commons.services.notification.INotificationService;
   import projects.tanks.clients.flash.resources.resource.MapResource;
   import projects.tanks.clients.fp10.libraries.TanksLocale;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.battle.IBattleInfoService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.layout.ILobbyLayoutService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.storage.IStorageService;
   import scpacker.networking.Network;
   
   public class §static throw§ extends §try const get§ implements BattleService, §include set final§, ObjectLoadListener, ObjectUnloadListener, §throw package continue§
   {
      public static var §^#p§:§7#j§;
      
      [Inject]
      public static var logService:LogService;
      
      [Inject]
      public static var storageService:IStorageService;
      
      [Inject]
      public static var display:IDisplay;
      
      [Inject]
      public static var battleEventDispatcher:BattleEventDispatcher;
      
      [Inject]
      public static var §'!1§:DataValidator;
      
      [Inject]
      public static var settings:ISettingsService;
      
      [Inject]
      public static var §?"F§:IBackgroundService;
      
      [Inject]
      public static var §0"0§:MipMappingService;
      
      [Inject]
      public static var §@#R§:TextureMaterialRegistry;
      
      [Inject]
      public static var §class package if§:ColorTransformService;
      
      [Inject]
      public static var battleInfoService:IBattleInfoService;
      
      [Inject]
      public static var §static package set§:BattleReadinessService;
      
      [Inject]
      public static var §^"<§:BattleInputService;
      
      [Inject]
      public static var §]!W§:BattleGUIService;
      
      [Inject]
      public static var lobbyLayoutService:ILobbyLayoutService;
      
      [Inject]
      public static var localeService:ILocaleService;
      
      [Inject]
      public static var §4!I§:ILightingEffectsService;
      
      [Inject]
      public static var §else for if§:TargetingInputManager;
      
      [Inject]
      public static var §default package import§:TargetingModeService;
      
      [Inject]
      public static var notificationService:INotificationService;
      
      [Inject]
      public static var §5!$§:KeysBindingService;
      
      [Inject]
      public static var resourceRegistry:ResourceRegistry;
      
      private static const §default const while§:int = 60;
      
      private static const §include catch if§:int = 3000;
      
      private static const §%!K§:int = 5000;
      
      private static const §<!A§:Vector3D = new Vector3D();
      
      private static const §+"7§:Vector3D = new Vector3D();
      
      private static const CHANNEL:String = "battle";
      
      private static const §9" §:String = "battle2server";
      
      private var §null package function§:§0_§;
      
      private var §]m§:DebugPanel;
      
      private var §"&§:§var use§;
      
      private var §continue package const§:§2!s§;
      
      private var battleActive:Boolean;
      
      private var §-"V§:§%#<§;
      
      private var §const var import§:§-q§;
      
      public var §%!j§:§6$"§;
      
      private var §throw package false§:§?#_§;
      
      private var §"7§:Boolean;
      
      private var §^"^§:§%#e§;
      
      private var §%"+§:§]!m§;
      
      private var §in set class§:§set set get§;
      
      private var §null for dynamic§:§##Z§;
      
      private var §8!Y§:§function const package§;
      
      private var §8U§:§var set package§;
      
      private var §false set set§:§<#Q§;
      
      private var §implements class§:§const set default§;
      
      private var §for package function§:Vector3;
      
      private var §7#a§:Vector3;
      
      private var §7>§:§1!d§;
      
      private var collisionDetector:§!"N§;
      
      private var §null native§:§class true§;
      
      private var battleData:§`#;§;
      
      private var §case catch if§:§for var finally§;
      
      private var §@!!§:§[!r§;
      
      private var logger:Logger;
      
      private var §dynamic for native§:Logger;
      
      private var §6!H§:§]!t§;
      
      private var §super var super§:§8"E§;
      
      private var §?h§:§>#=§;
      
      private var §false catch do§:§[@§;
      
      private var §5!;§:§var catch§;
      
      private var §function set get§:Boolean;
      
      private var §true var function§:Boolean;
      
      private var mapId:Long;
      
      private var spectator:Boolean;
      
      public function §static throw§()
      {
         this.§dynamic package set§ = new §import use§();
         this.§override var get§ = new §2D§();
         this.§do set false§ = new §case for package§();
         this.§for package function§ = new Vector3();
         this.§7#a§ = new Vector3();
         super();
         this.§dynamic for native§ = logService.getLogger(§9" §);
         this.logger = logService.getLogger(CHANNEL);
         this.§&#m§();
      }
      
      private static function §package catch use§() : void
      {
         var _loc1_:ErrorForm = new ErrorForm(localeService);
         _loc1_.setErrorText(localeService.getText(TanksLocale.TEXT_ERROR_FATAL));
         _loc1_.setSupportUrl(localeService.getText(TanksLocale.TEXT_FATAL_ERROR_WIKI_LINK));
         display.contentLayer.addChild(_loc1_);
      }
      
      public static function §with catch return§(param1:Vector3, param2:Vector3D) : void
      {
         param2.x = param1.x;
         param2.y = param1.y;
         param2.z = param1.z;
      }
      
      private function §&#m§() : void
      {
         this.§"&§ = new §var use§(battleEventDispatcher,this);
         this.§"&§.§#"<§(§`E§,this.§8#=§);
         this.§"&§.§#"<§(DataValidationErrorEvent,this.§1"6§);
         this.§"&§.§throw var set§();
      }
      
      public function §3l§() : §[!r§
      {
         return this.§@!!§;
      }
      
      public function §7#P§() : §0_§
      {
         return this.§null package function§;
      }
      
      public function §const for function§(param1:Event) : void
      {
      }
      
      public function §1!e§(param1:Event) : void
      {
      }
      
      private function §false catch const§() : void
      {
         var _loc1_:Boolean = false;
         if(§static package set§.isBattleReady())
         {
            _loc1_ = settings.muteSound;
            this.§null native§.§'M§().§3#O§(_loc1_);
            this.§-"V§.play(!_loc1_ && settings.bgSound);
         }
      }
      
      public function §break catch static§(param1:Event) : void
      {
         this.§@!!§.§'!3§(settings.showSkyBox);
         this.§false catch const§();
         this.§<!a§();
         this.§throw package false§.§>!e§(settings.adaptiveFPS);
      }
      
      public function §<!a§() : void
      {
         this.§@!!§.§get var get§(settings.graphicsAutoQuality,this.mapId.toString());
         if(!settings.graphicsAutoQuality)
         {
            this.§@!!§.§7x§(settings.fog);
            this.§@!!§.§override catch static§(settings.shadows);
            this.§@!!§.§###§(settings.dynamicShadows);
            this.§@!!§.§^! §(settings.§catch package throw§);
            this.§@!!§.§8!9§(settings.dust);
            this.§@!!§.§throw var finally§(settings.ssao);
            this.§@!!§.§false for return§(settings.dynamicLighting);
            this.§@!!§.§import package for§(settings.antialiasing);
         }
         this.§@!!§.§true set catch§(true);
         §0"0§.setMipMapping(settings.mipMapping);
      }
      
      public function §use for use§(param1:BitmapData) : void
      {
         this.§@!!§.§use for use§(param1);
      }
      
      public function initObject(param1:Boolean, param2:§for var finally§, param3:BattlefieldResources, param4:int, param5:String, param6:int, param7:String, param8:Boolean, param9:IGameObject, param10:Object) : void
      {
         this.battleActive = param1;
         this.§case catch if§ = param2;
         this.spectator = param8;
         this.§continue package const§ = OSGi.getInstance().getService(§finally var return§) as §2!s§;
         this.§%!j§ = new §6$"§();
         battleInfoService.setInBattle(true);
         battleInfoService.reArmorEnabled = param10.reArmorEnabled;
         battleInfoService.spectator = param8;
         battleInfoService.setCurrentSelectionBattle(param10.battleId,param10.minRank,param10.maxRank);
         battleInfoService.currentBattleId = param10.battleId;
         §class package if§.setColorTransform(§]#y§.§=!k§(param2.§]#I§,0.5));
         this.§implements for null§(param10.ambientSoundId,param4,param6);
         this.§-"K§();
         this.§?"z§(param9);
         this.§super while§(param10.bonusLightIntensity,param10.bonusColorAdjust);
         this.§null native§.§'M§().§3#O§(true);
         this.§-"V§ = new §%#<§(this.battleData.§-"V§,this.§null native§.§'M§());
         this.§return package each§();
         this.§const var import§ = new §-q§(battleEventDispatcher);
         this.§override var get§.reset();
         this.addListeners();
         this.objectLoaded();
      }
      
      private function §super while§(param1:Number, param2:ColorTransform) : void
      {
         §4!I§.§2#[§(param1,param2,param2);
      }
      
      private function §return package each§() : void
      {
         settings.addEventListener(SettingsServiceEvent.SETTINGS_CHANGED,this.§break catch static§);
      }
      
      private function §9!F§() : void
      {
         settings.removeEventListener(SettingsServiceEvent.SETTINGS_CHANGED,this.§break catch static§);
      }
      
      public function §,#b§(param1:Array) : void
      {
         var _loc2_:BattleBonus = null;
         for each(_loc2_ in param1)
         {
            this.§var for implements§(_loc2_.object,_loc2_.id,_loc2_.position,_loc2_.timeFromAppearing);
         }
      }
      
      public function §const var native§(param1:ClientObject, param2:String, param3:§#">§) : void
      {
         this.§var for implements§(param1,param2,param3,0);
      }
      
      public function §1"8§(param1:String) : void
      {
         if(this.§%!j§ == null)
         {
            return;
         }
         var _loc2_:Bonus = this.§%!j§.bonuses[param1];
         if(_loc2_ != null)
         {
            delete this.§%!j§.bonuses[param1];
            _loc2_.remove();
         }
      }
      
      public function §@!`§(param1:String) : void
      {
         if(this.§%!j§ == null)
         {
            return;
         }
         var _loc2_:Bonus = this.§%!j§.bonuses[param1];
         if(_loc2_ != null)
         {
            delete this.§%!j§.bonuses[param1];
            _loc2_.pickup();
         }
      }
      
      public function onTankCollision(param1:Bonus) : void
      {
         battleEventDispatcher.dispatchEvent(§##a§.§const for use§);
         this.§false const true§(param1.bonusId);
      }
      
      private function §implements for null§(param1:Long, param2:int, param3:int) : void
      {
         this.battleData = new §`#;§();
         this.battleData.§5#=§(param3);
         this.battleData.§>"T§(param2);
         this.battleData.§-"V§ = SoundResource(ResourceRegistry(OSGi.getInstance().getService(ResourceRegistry)).getResource(param1)).sound;
         this.battleData.§1!C§ = SoundResource(ResourceRegistry(OSGi.getInstance().getService(ResourceRegistry)).getResource(Long.getLong(0,878808))).sound;
      }
      
      public function §-"K§() : void
      {
         OSGi.getInstance().registerService(BattleService,this);
         this.§@!!§ = new §[!r§(display.stage,§@#R§,0.5);
         var _loc1_:§for var finally§ = this.§case catch if§;
         var _loc2_:§switch var in§ = _loc1_.fogParams;
         var _loc3_:§static static§ = _loc1_.§]#I§;
         this.§@!!§.§4"_§(_loc2_.color,_loc2_.alpha,_loc2_.nearLimit,_loc2_.farLimit);
         this.§@!!§.§^";§(_loc3_.lightColor,_loc3_.shadowColor,_loc3_.angleX,_loc3_.angleZ);
         this.§null package function§ = new §0_§();
         var _loc4_:Number = _loc1_.gravity;
         this.§null native§ = new §class true§(_loc4_,this.battleData.§-"V§,battleEventDispatcher);
         this.§@!!§.§%"G§(new §'!4§(this.§null native§.§const const true§()));
         this.§@!!§.§6x§(this,_loc1_.§try set final§);
         this.§@!!§.§"!c§(_loc1_.ssaoColor);
         this.§throw package false§ = new §?#_§(display.stage,this.§null native§,this.§override var get§);
         this.§throw package false§.§>!e§(settings.adaptiveFPS);
         this.§null package function§.§]!J§(§]!W§.§native const import§());
         this.§]m§ = new DebugPanel();
         this.§]m§.visible = false;
         display.stage.addChild(this.§]m§);
         this.§8U§ = new §var set package§();
         this.§false set set§ = new §<#Q§(§include catch if§);
         this.§false catch do§ = new §[@§();
         this.§5!;§ = new §var catch§();
      }
      
      private function §?"z§(param1:IGameObject) : void
      {
         this.§3#e§();
         var _loc2_:§4#=§ = this.§default for else§(param1);
         var _loc3_:MapResource = _loc2_.§continue const throw§();
         this.mapId = _loc3_.id;
         var _loc4_:XML = XML(_loc3_.mapData.toString());
         var _loc5_:§7#j§ = new §7#j§(§@#R§,_loc3_.libRegistry);
         _loc5_.build(_loc4_,this.§,#C§);
         §^#p§ = _loc5_;
      }
      
      private function §default for else§(param1:IGameObject) : §4#=§
      {
         return §4#=§(param1.adapt(§4#=§));
      }
      
      private function §3#e§() : void
      {
         var _loc1_:§true catch do§ = new §true catch do§(this.§case catch if§.§<"^§);
         this.§@!!§.§with var use§(_loc1_);
         this.§@!!§.§'!3§(settings.showSkyBox);
         var _loc2_:Vector3 = §+$%§.§?#T§(this.§case catch if§.§switch var while§);
         var _loc3_:Number = this.§case catch if§.§`>§;
         this.§7>§ = new §1!d§(_loc1_,_loc2_,_loc3_);
         this.§@!!§.§9"N§(this.§7>§,0);
      }
      
      private function §false const true§(param1:String) : void
      {
         Network(OSGi.getInstance().getService(Network)).send(new §finally catch§(param1));
      }
      
      public function §null catch set§() : void
      {
         this.battleActive = true;
      }
      
      public function §dynamic for return§() : void
      {
         var _loc1_:* = undefined;
         var _loc2_:Bonus = null;
         this.battleActive = false;
         battleEventDispatcher.dispatchEvent(new §const var finally§());
         for(_loc1_ in this.§%!j§.bonuses)
         {
            _loc2_ = this.§%!j§.bonuses[_loc1_];
            _loc2_.remove();
            delete this.§%!j§.bonuses[_loc1_];
         }
      }
      
      public function battleRestart() : void
      {
         this.battleActive = true;
         battleEventDispatcher.dispatchEvent(new §throw each§());
      }
      
      public function objectLoaded() : void
      {
         this.§<!a§();
         if(this.spectator)
         {
            this.§try set function§();
         }
         else
         {
            this.§do package import§();
         }
         battleInfoService.battleLoad();
      }
      
      private function §do package import§() : void
      {
         §else for if§.init();
         §default package import§.init();
      }
      
      public function handleBattleEvent(param1:Object) : void
      {
         this.§"&§.handleBattleEvent(param1);
      }
      
      public function objectUnloaded() : void
      {
         var _loc1_:Bonus = null;
         if(this.spectator)
         {
            this.§super var super§.close();
            this.§?h§.close();
            this.§6!H§.close();
         }
         this.battleActive = false;
         battleEventDispatcher.dispatchEvent(new §4#t§());
         this.§throw package false§.§ "s§();
         this.§throw package false§ = null;
         this.§9!F§();
         this.§@!!§.shutdown();
         this.§null native§.shutdown();
         this.removeListeners();
         this.§5!;§.close();
         this.§5!;§ = null;
         this.§false catch do§.close();
         this.§false catch do§ = null;
         this.§null package function§.§]$!§();
         this.§null package function§.destroy();
         this.§null package function§ = null;
         this.§@!!§.§super package§().view.clear();
         this.§@!!§.§super package§().view = null;
         this.§^!6§(null);
         this.§]m§ = null;
         for each(_loc1_ in this.§%!j§.bonuses)
         {
            _loc1_.remove();
            _loc1_ = null;
         }
         §?"F§.drawBg();
         battleInfoService.setInBattle(false);
         battleInfoService.resetCurrentBattle();
         §'!1§.removeAllValidators();
         §class package if§.setColorTransform(null);
         OSGi.getInstance().unregisterService(BattleService);
         §static package set§.reset();
         §]!W§.hide();
         this.§8U§.close();
         this.§8U§ = null;
         this.§false set set§.close();
         this.§false set set§ = null;
         if(this.§implements class§)
         {
            this.§implements class§.close();
            this.§implements class§ = null;
         }
         BonusCache.clear();
         if(!this.spectator)
         {
            §default package import§.close();
            §else for if§.close();
         }
         this.spectator = false;
         this.§%!j§ = null;
         this.§function set get§ = false;
         this.§class while§().clear();
         this.§true var function§ = false;
         §^#p§.close();
         §^#p§ = null;
      }
      
      public function §7"0§(param1:§finally const package§) : void
      {
         this.§@!!§.§7"0§(param1);
      }
      
      public function §"#D§(param1:§final var super§) : void
      {
         this.§null native§.§'M§().§each set set§(param1);
      }
      
      public function §2I§() : void
      {
         §]!W§.show();
         this.§@!!§.§catch const break§();
         this.§false catch const§();
      }
      
      public function §class while§() : §import use§
      {
         return this.§dynamic package set§;
      }
      
      public function §^"S§(param1:Vector3, param2:Vector3) : void
      {
         if(this.§@!!§.§import catch extends§() != this.§8U§)
         {
            return;
         }
         this.§8U§.deactivate();
         this.§8U§.§@!4§(param1,param2,this.§for package function§,this.§7#a§);
         this.§false set set§.init(this.§for package function§,this.§7#a§);
         this.§@!!§.§2!k§(this.§false set set§);
      }
      
      public function §?#E§() : void
      {
         this.§8U§.§use var each§(true);
      }
      
      public function §set finally§() : void
      {
         this.§8U§.§5"?§();
      }
      
      public function §get package dynamic§() : void
      {
         this.§8U§.§use var each§(false);
      }
      
      public function §,!'§(param1:Vector3, param2:Vector3) : void
      {
         this.§8U§.§while const super§(param1,param2);
      }
      
      public function §try for true§() : void
      {
         if(this.§@!!§ != null)
         {
            this.§@!!§.§super package§().rotationY = 0;
            this.§8U§.§ `§();
         }
      }
      
      public function §continue package try§() : void
      {
         this.§8U§.activate();
         this.§8U§.§ `§();
      }
      
      public function §try set function§() : void
      {
         var _loc1_:Vector3 = new Vector3();
         var _loc2_:Vector3 = new Vector3();
         this.§if var var§(_loc1_,_loc2_,§^#p§.§native continue§());
         this.§@!!§.§super package§().setPosition(_loc1_);
         this.§@!!§.§super package§().lookAt(_loc2_.x,_loc2_.y,_loc2_.z);
         this.§implements class§ = new §const set default§();
         this.§implements class§.activate();
         this.§2!k§(this.§implements class§);
         var _loc3_:§]!t§ = new §]!t§();
         this.§6!H§ = _loc3_;
         this.§@!!§.§true var extends§(_loc3_);
         §static package set§.§3"W§();
         this.§super var super§ = new §8"E§(this.§implements class§);
         this.§?h§ = new §>#=§();
         if(!lobbyLayoutService.isSwitchInProgress())
         {
            §^"<§.unlock(§class const while§.§7!d§);
         }
      }
      
      public function §if var var§(param1:Vector3, param2:Vector3, param3:AABB) : void
      {
         param1.x = param3.minX;
         param1.y = param3.minY;
         param1.z = param3.maxZ + §%!K§;
         param2.x = (param3.minX + param3.maxX) / 2;
         param2.y = (param3.minY + param3.maxY) / 2;
         param2.z = param3.minZ;
      }
      
      public function §2!k§(param1:§function const package§) : void
      {
         this.§@!!§.§2!k§(param1);
      }
      
      public function §^!6§(param1:Tank) : void
      {
         this.§8U§.§return const do§(param1);
      }
      
      public function §break true§() : int
      {
         return this.§%!j§.§try for super§;
      }
      
      public function §while var package§(param1:String, param2:String) : void
      {
         this.§]m§.printValue(param1,param2);
      }
      
      public function §6#U§(param1:Boolean) : void
      {
         var _loc2_:Boolean = settings.muteSound;
         this.§null native§.§'M§().§3#O§(_loc2_);
      }
      
      public function §<!t§() : §var set package§
      {
         return this.§8U§;
      }
      
      private function §,#C§() : void
      {
         this.§8U§.§return catch null§(§^#p§.§9#"§());
         this.§default set default§();
         §static package set§.§#!`§();
         battleEventDispatcher.dispatchEvent(new §case package with§());
      }
      
      private function §default set default§() : void
      {
         display.stage.frameRate += 1;
         --display.stage.frameRate;
      }
      
      private function addListeners() : void
      {
         display.stage.addEventListener(Event.ENTER_FRAME,this.onEnterFrame);
         display.stage.addEventListener(KeyboardEvent.KEY_DOWN,this.onKey);
         display.stage.addEventListener(KeyboardEvent.KEY_UP,this.onKey);
         display.stage.addEventListener(KeyboardEvent.KEY_DOWN,this.onKeyDown);
      }
      
      private function removeListeners() : void
      {
         display.stage.removeEventListener(Event.ENTER_FRAME,this.onEnterFrame);
         display.stage.removeEventListener(KeyboardEvent.KEY_DOWN,this.onKey);
         display.stage.removeEventListener(KeyboardEvent.KEY_UP,this.onKey);
         display.stage.removeEventListener(KeyboardEvent.KEY_DOWN,this.onKeyDown);
      }
      
      private function onEnterFrame(param1:Event) : void
      {
         var event:Event = param1;
         try
         {
            this.tick();
         }
         catch(e:Error)
         {
            §in const for§(e);
         }
      }
      
      private function tick() : void
      {
         this.§override var get§.update();
         §'!1§.tick();
         this.§null native§.tick();
         §else for if§.tick();
         §default package import§.tick();
      }
      
      private function §in const for§(param1:Error) : void
      {
         this.§dynamic for native§.error(param1.message);
         this.removeListeners();
         §package catch use§();
         battleEventDispatcher.dispatchEvent(new §8!k§());
      }
      
      public function §'x§() : §class true§
      {
         return this.§null native§;
      }
      
      private function onKeyDown(param1:KeyboardEvent) : void
      {
         var _loc2_:§&7§ = null;
         if(!§^"<§.§false set true§())
         {
            _loc2_ = §5!$§.§&!<§(param1.keyCode);
            if(_loc2_ == §&7§.OPEN_GARAGE)
            {
               lobbyLayoutService.showGarage();
            }
         }
      }
      
      private function onKey(param1:KeyboardEvent) : void
      {
         if(!§^"<§.§false set true§())
         {
            if(param1.type == KeyboardEvent.KEY_DOWN)
            {
               this.§-#8§(param1);
            }
         }
      }
      
      private function §-#8§(param1:KeyboardEvent) : void
      {
         var _loc2_:* = param1.keyCode;
         switch(0)
         {
         }
      }
      
      public function §static const continue§() : §%#e§
      {
         return this.§^"^§;
      }
      
      public function §set package dynamic§(param1:§%#e§) : void
      {
         this.§^"^§ = param1;
      }
      
      public function §?!r§() : §%!v§
      {
         return this.§do set false§;
      }
      
      public function §catch native§() : §]!m§
      {
         return this.§%"+§;
      }
      
      public function §get package each§(param1:§]!m§) : void
      {
         this.§%"+§ = param1;
      }
      
      public function §4p§() : §set set get§
      {
         return this.§in set class§;
      }
      
      public function §@"§(param1:§set set get§) : void
      {
         this.§in set class§ = param1;
      }
      
      public function §1"I§() : int
      {
         return this.battleData.§1"I§();
      }
      
      public function §=!I§() : Sound
      {
         return this.battleData.§1!C§;
      }
      
      public function get §&S§() : §7"]§
      {
         return this.§null native§.§'M§();
      }
      
      public function §override true§() : int
      {
         return this.battleData.§override true§();
      }
      
      public function §each set use§() : Boolean
      {
         return this.battleActive;
      }
      
      public function §^#6§() : Dictionary
      {
         return this.§@!!§.§native var implements§();
      }
      
      public function §package case§() : void
      {
         this.§2!k§(this.§8U§);
      }
      
      public function §]"d§() : int
      {
         return this.§null native§.§]"d§();
      }
      
      public function §4!D§() : void
      {
         this.§function set get§ = true;
      }
      
      public function §!#;§() : Boolean
      {
         return !this.§function set get§;
      }
      
      public function §;2§() : int
      {
         return this.§false set set§.duration;
      }
      
      public function §#$!§() : Boolean
      {
         return this.§true var function§;
      }
      
      public function §[f§(param1:Boolean) : void
      {
         this.§true var function§ = param1;
      }
      
      public function §,#&§() : §##Z§
      {
         return this.§null for dynamic§;
      }
      
      public function §switch set throw§(param1:§##Z§) : void
      {
         this.§null for dynamic§ = param1;
      }
      
      private function §8#=§(param1:§`E§) : void
      {
         var _loc2_:§`E§ = param1;
         server.§class class§(Vector.<int>(_loc2_.§[#S§));
      }
      
      private function §1"6§(param1:DataValidationErrorEvent) : void
      {
         this.§4X§(param1.type);
      }
      
      private function §4X§(param1:int) : void
      {
         var _loc2_:int = param1;
         server.§1_§(_loc2_);
      }
      
      private function §var for implements§(param1:ClientObject, param2:String, param3:§#">§, param4:int) : Bonus
      {
         var _loc5_:§in const§ = §in const§(modelRegistry.getModelsByInterface(§=p§)[0]);
         var _loc6_:Bonus;
         (_loc6_ = _loc5_.§include package var§(param1,param2)).spawn(§+$%§.§?#T§(param3),param4,150,this.onTankCollision);
         this.§%!j§.bonuses[_loc6_.bonusId] = _loc6_;
         return _loc6_;
      }
   }
}

