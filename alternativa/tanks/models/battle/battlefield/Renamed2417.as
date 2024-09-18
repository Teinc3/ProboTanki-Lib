package alternativa.tanks.models.battle.battlefield
{
   import Renamed137.Renamed2400;
   import Renamed200.Renamed2401;
   import Renamed235.Renamed607;
   import Renamed1.Renamed608;
   import Renamed1.Renamed609;
   import Renamed602.Renamed603;
   import Renamed2402.Renamed2403;
   import Renamed306.Renamed2404;
   import Renamed306.Renamed2405;
   import Renamed306.Renamed2406;
   import alternativa.math.Vector3;
   import alternativa.object.ClientObject;
   import alternativa.osgi.OSGi;
   import alternativa.osgi.service.display.IDisplay;
   import alternativa.osgi.service.locale.ILocaleService;
   import alternativa.osgi.service.logging.LogService;
   import alternativa.osgi.service.logging.Logger;
   import alternativa.physics.collision.types.AABB;
   import alternativa.tanks.battle.Renamed668;
   import alternativa.tanks.battle.Renamed703;
   import alternativa.tanks.battle.Renamed623;
   import alternativa.tanks.battle.BattleService;
   import alternativa.tanks.battle.Renamed620;
   import alternativa.tanks.battle.events.Renamed869;
   import alternativa.tanks.battle.events.Renamed886;
   import alternativa.tanks.battle.events.BattleEventDispatcher;
   import alternativa.tanks.battle.events.Renamed702;
   import alternativa.tanks.battle.events.Renamed892;
   import alternativa.tanks.battle.events.Renamed894;
   import alternativa.tanks.battle.events.Renamed901;
   import alternativa.tanks.battle.events.Renamed511;
   import alternativa.tanks.battle.events.Renamed902;
   import alternativa.tanks.battle.objects.tank.Tank;
   import alternativa.tanks.battle.scene3d.Renamed1297;
   import alternativa.tanks.battle.scene3d.Renamed610;
   import alternativa.tanks.bg.IBackgroundService;
   import alternativa.tanks.bonuses.Bonus;
   import alternativa.tanks.bonuses.BonusCache;
   import alternativa.tanks.camera.Renamed1464;
   import alternativa.tanks.camera.Renamed611;
   import alternativa.tanks.camera.Renamed1498;
   import alternativa.tanks.gui.error.ErrorForm;
   import alternativa.tanks.models.tank.Renamed2407;
   import alternativa.tanks.models.tank.Renamed2408;
   import alternativa.tanks.models.tank.Renamed2409;
   import alternativa.tanks.models.weapon.shared.Renamed612;
   import alternativa.tanks.models.weapon.shared.Renamed613;
   import alternativa.tanks.models.weapon.shared.Renamed614;
   import alternativa.tanks.models.weapon.shared.Renamed615;
   import alternativa.tanks.service.settings.ISettingsService;
   import alternativa.tanks.service.settings.SettingsServiceEvent;
   import alternativa.tanks.service.settings.keybinding.Renamed717;
   import alternativa.tanks.service.settings.keybinding.KeysBindingService;
   import alternativa.tanks.services.battlegui.BattleGUIService;
   import alternativa.tanks.services.battleinput.BattleInputService;
   import alternativa.tanks.services.battleinput.Renamed2410;
   import alternativa.tanks.services.battlereadiness.BattleReadinessService;
   import alternativa.tanks.services.colortransform.ColorTransformService;
   import alternativa.tanks.services.colortransform.Renamed1637;
   import alternativa.tanks.services.lightingeffects.ILightingEffectsService;
   import alternativa.tanks.services.mipmapping.MipMappingService;
   import alternativa.tanks.services.targeting.TargetingInputManager;
   import alternativa.tanks.services.targeting.TargetingModeService;
   import alternativa.tanks.utils.DataValidationErrorEvent;
   import alternativa.tanks.utils.DataValidator;
   import alternativa.types.Long;
   import alternativa.utils.DebugPanel;
   import alternativa.utils.TextureMaterialRegistry;
   import Renamed325.Renamed2411;
   import Renamed333.Renamed2382;
   import com.alternativaplatform.projects.tanks.client.models.battlefield.BattleBonus;
   import com.alternativaplatform.projects.tanks.client.models.battlefield.BattlefieldResources;
   import Renamed342.Renamed2412;
   import Renamed356.Renamed616;
   import Renamed63.Renamed617;
   import flash.display.BitmapData;
   import flash.events.Event;
   import flash.events.KeyboardEvent;
   import flash.geom.ColorTransform;
   import flash.geom.Vector3D;
   import flash.media.Sound;
   import flash.utils.Dictionary;
   import Renamed373.Renamed665;
   import Renamed384.Renamed2413;
   import Renamed403.Renamed2414;
   import platform.client.fp10.core.model.ObjectLoadListener;
   import platform.client.fp10.core.model.ObjectUnloadListener;
   import platform.client.fp10.core.registry.ResourceRegistry;
   import platform.client.fp10.core.resource.types.SoundResource;
   import platform.client.fp10.core.type.IGameObject;
   import projects.tanks.client.battlefield.models.battle.battlefield.Renamed2415;
   import projects.tanks.client.battlefield.models.battle.battlefield.Renamed2416;
   import projects.tanks.clients.flash.commons.services.notification.INotificationService;
   import projects.tanks.clients.flash.resources.resource.MapResource;
   import projects.tanks.clients.fp10.libraries.TanksLocale;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.battle.IBattleInfoService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.layout.ILobbyLayoutService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.storage.IStorageService;
   import scpacker.networking.Network;
   
   public class Renamed2417 extends Renamed2416 implements BattleService, Renamed2415, ObjectLoadListener, ObjectUnloadListener, Renamed511
   {
      public static var Renamed2418:Renamed2412;
      
      [Inject]
      public static var logService:LogService;
      
      [Inject]
      public static var storageService:IStorageService;
      
      [Inject]
      public static var display:IDisplay;
      
      [Inject]
      public static var battleEventDispatcher:BattleEventDispatcher;
      
      [Inject]
      public static var Renamed2419:DataValidator;
      
      [Inject]
      public static var settings:ISettingsService;
      
      [Inject]
      public static var Renamed720:IBackgroundService;
      
      [Inject]
      public static var Renamed2420:MipMappingService;
      
      [Inject]
      public static var Renamed1368:TextureMaterialRegistry;
      
      [Inject]
      public static var Renamed2421:ColorTransformService;
      
      [Inject]
      public static var battleInfoService:IBattleInfoService;
      
      [Inject]
      public static var Renamed2422:BattleReadinessService;
      
      [Inject]
      public static var Renamed718:BattleInputService;
      
      [Inject]
      public static var Renamed2423:BattleGUIService;
      
      [Inject]
      public static var lobbyLayoutService:ILobbyLayoutService;
      
      [Inject]
      public static var localeService:ILocaleService;
      
      [Inject]
      public static var Renamed2424:ILightingEffectsService;
      
      [Inject]
      public static var Renamed2425:TargetingInputManager;
      
      [Inject]
      public static var Renamed926:TargetingModeService;
      
      [Inject]
      public static var notificationService:INotificationService;
      
      [Inject]
      public static var Renamed719:KeysBindingService;
      
      [Inject]
      public static var resourceRegistry:ResourceRegistry;
      
      private static const Renamed2426:int = 60;
      
      private static const Renamed2427:int = 3000;
      
      private static const Renamed2428:int = 5000;
      
      private static const Renamed1350:Vector3D = new Vector3D();
      
      private static const Renamed1351:Vector3D = new Vector3D();
      
      private static const CHANNEL:String = "battle";
      
      private static const Renamed2429:String = "battle2server";
      
      private var Renamed2430:Renamed623;
      
      private var Renamed2431:DebugPanel;
      
      private var Renamed2432:Renamed902;
      
      private var Renamed2433:Renamed2407;
      
      private var battleActive:Boolean;
      
      private var Renamed2375:Renamed2314;
      
      private var Renamed2434:Renamed703;
      
      public var Renamed2435:Renamed2367;
      
      private var Renamed2436:Renamed2326;
      
      private var Renamed2437:Boolean;
      
      private var Renamed2438:Renamed613;
      
      private var Renamed2439:Renamed614;
      
      private var Renamed2440:Renamed615;
      
      private var Renamed2441:Renamed617;
      
      private var Renamed2442:Renamed611;
      
      private var Renamed2443:Renamed1498;
      
      private var Renamed2444:Renamed1464;
      
      private var Renamed2445:Renamed2382;
      
      private var Renamed1466:Vector3;
      
      private var Renamed2446:Vector3;
      
      private var Renamed2447:Renamed2348;
      
      private var collisionDetector:Renamed665;
      
      private var Renamed2448:Renamed620;
      
      private var battleData:Renamed2449;
      
      private var Renamed2450:Renamed2404;
      
      private var Renamed1496:Renamed610;
      
      private var logger:Logger;
      
      private var Renamed2451:Logger;
      
      private var Renamed2452:Renamed2453;
      
      private var Renamed2454:Renamed2383;
      
      private var Renamed2455:Renamed2320;
      
      private var Renamed2456:Renamed2401;
      
      private var Renamed2457:Renamed2409;
      
      private var Renamed2458:Boolean;
      
      private var Renamed2459:Boolean;
      
      private var mapId:Long;
      
      private var spectator:Boolean;
      
      public function Renamed2417()
      {
         this.Renamed2460 = new Renamed616();
         this.Renamed2461 = new Renamed2332();
         this.Renamed2462 = new Renamed2413();
         this.Renamed1466 = new Vector3();
         this.Renamed2446 = new Vector3();
         super();
         this.Renamed2451 = logService.getLogger(Renamed2429);
         this.logger = logService.getLogger(CHANNEL);
         this.Renamed2463();
      }
      
      private static function Renamed2464() : void
      {
         var _loc1_:ErrorForm = new ErrorForm(localeService);
         _loc1_.setErrorText(localeService.getText(TanksLocale.TEXT_ERROR_FATAL));
         _loc1_.setSupportUrl(localeService.getText(TanksLocale.TEXT_FATAL_ERROR_WIKI_LINK));
         display.contentLayer.addChild(_loc1_);
      }
      
      public static function Renamed684(param1:Vector3, param2:Vector3D) : void
      {
         param2.x = param1.x;
         param2.y = param1.y;
         param2.z = param1.z;
      }
      
      private function Renamed2463() : void
      {
         this.Renamed2432 = new Renamed902(battleEventDispatcher,this);
         this.Renamed2432.Renamed904(Renamed702,this.Renamed2465);
         this.Renamed2432.Renamed904(DataValidationErrorEvent,this.Renamed2466);
         this.Renamed2432.Renamed905();
      }
      
      public function Renamed621() : Renamed610
      {
         return this.Renamed1496;
      }
      
      public function Renamed622() : Renamed623
      {
         return this.Renamed2430;
      }
      
      public function Renamed2467(param1:Event) : void
      {
      }
      
      public function Renamed2468(param1:Event) : void
      {
      }
      
      private function Renamed2469() : void
      {
         var _loc1_:Boolean = false;
         if(Renamed2422.isBattleReady())
         {
            _loc1_ = settings.muteSound;
            this.Renamed2448.Renamed801().Renamed2470(_loc1_);
            this.Renamed2375.play(!_loc1_ && settings.bgSound);
         }
      }
      
      public function Renamed1547(param1:Event) : void
      {
         this.Renamed1496.Renamed1420(settings.showSkyBox);
         this.Renamed2469();
         this.Renamed2471();
         this.Renamed2436.Renamed2341(settings.adaptiveFPS);
      }
      
      public function Renamed2471() : void
      {
         this.Renamed1496.Renamed1388(settings.graphicsAutoQuality,this.mapId.toString());
         if(!settings.graphicsAutoQuality)
         {
            this.Renamed1496.Renamed1391(settings.fog);
            this.Renamed1496.Renamed1389(settings.shadows);
            this.Renamed1496.Renamed1390(settings.dynamicShadows);
            this.Renamed1496.Renamed1392(settings.Renamed2472);
            this.Renamed1496.Renamed1393(settings.dust);
            this.Renamed1496.Renamed1394(settings.ssao);
            this.Renamed1496.Renamed1395(settings.dynamicLighting);
            this.Renamed1496.Renamed1396(settings.antialiasing);
         }
         this.Renamed1496.Renamed1319(true);
         Renamed2420.setMipMapping(settings.mipMapping);
      }
      
      public function Renamed651(param1:BitmapData) : void
      {
         this.Renamed1496.Renamed651(param1);
      }
      
      public function initObject(param1:Boolean, param2:Renamed2404, param3:BattlefieldResources, param4:int, param5:String, param6:int, param7:String, param8:Boolean, param9:IGameObject, param10:Object) : void
      {
         this.battleActive = param1;
         this.Renamed2450 = param2;
         this.spectator = param8;
         this.Renamed2433 = OSGi.getInstance().getService(Renamed2408) as Renamed2407;
         this.Renamed2435 = new Renamed2367();
         battleInfoService.setInBattle(true);
         battleInfoService.reArmorEnabled = param10.reArmorEnabled;
         battleInfoService.spectator = param8;
         battleInfoService.setCurrentSelectionBattle(param10.battleId,param10.minRank,param10.maxRank);
         battleInfoService.currentBattleId = param10.battleId;
         Renamed2421.setColorTransform(Renamed1637.Renamed2473(param2.Renamed2474,0.5));
         this.Renamed2475(param10.ambientSoundId,param4,param6);
         this.Renamed2476();
         this.Renamed2477(param9);
         this.Renamed2478(param10.bonusLightIntensity,param10.bonusColorAdjust);
         this.Renamed2448.Renamed801().Renamed2470(true);
         this.Renamed2375 = new Renamed2314(this.battleData.Renamed2375,this.Renamed2448.Renamed801());
         this.Renamed2479();
         this.Renamed2434 = new Renamed703(battleEventDispatcher);
         this.Renamed2461.reset();
         this.addListeners();
         this.objectLoaded();
      }
      
      private function Renamed2478(param1:Number, param2:ColorTransform) : void
      {
         Renamed2424.Renamed2480(param1,param2,param2);
      }
      
      private function Renamed2479() : void
      {
         settings.addEventListener(SettingsServiceEvent.SETTINGS_CHANGED,this.Renamed1547);
      }
      
      private function Renamed2481() : void
      {
         settings.removeEventListener(SettingsServiceEvent.SETTINGS_CHANGED,this.Renamed1547);
      }
      
      public function Renamed2482(param1:Array) : void
      {
         var _loc2_:BattleBonus = null;
         for each(_loc2_ in param1)
         {
            this.Renamed2483(_loc2_.object,_loc2_.id,_loc2_.position,_loc2_.timeFromAppearing);
         }
      }
      
      public function Renamed2484(param1:ClientObject, param2:String, param3:Renamed603) : void
      {
         this.Renamed2483(param1,param2,param3,0);
      }
      
      public function Renamed2485(param1:String) : void
      {
         if(this.Renamed2435 == null)
         {
            return;
         }
         var _loc2_:Bonus = this.Renamed2435.bonuses[param1];
         if(_loc2_ != null)
         {
            delete this.Renamed2435.bonuses[param1];
            _loc2_.remove();
         }
      }
      
      public function Renamed2486(param1:String) : void
      {
         if(this.Renamed2435 == null)
         {
            return;
         }
         var _loc2_:Bonus = this.Renamed2435.bonuses[param1];
         if(_loc2_ != null)
         {
            delete this.Renamed2435.bonuses[param1];
            _loc2_.pickup();
         }
      }
      
      public function onTankCollision(param1:Bonus) : void
      {
         battleEventDispatcher.dispatchEvent(Renamed869.Renamed871);
         this.Renamed2487(param1.bonusId);
      }
      
      private function Renamed2475(param1:Long, param2:int, param3:int) : void
      {
         this.battleData = new Renamed2449();
         this.battleData.Renamed2488(param3);
         this.battleData.Renamed2489(param2);
         this.battleData.Renamed2375 = SoundResource(ResourceRegistry(OSGi.getInstance().getService(ResourceRegistry)).getResource(param1)).sound;
         this.battleData.Renamed2490 = SoundResource(ResourceRegistry(OSGi.getInstance().getService(ResourceRegistry)).getResource(Long.getLong(0,878808))).sound;
      }
      
      public function Renamed2476() : void
      {
         OSGi.getInstance().registerService(BattleService,this);
         this.Renamed1496 = new Renamed610(display.stage,Renamed1368,0.5);
         var _loc1_:Renamed2404 = this.Renamed2450;
         var _loc2_:Renamed2406 = _loc1_.fogParams;
         var _loc3_:Renamed2405 = _loc1_.Renamed2474;
         this.Renamed1496.Renamed1397(_loc2_.color,_loc2_.alpha,_loc2_.nearLimit,_loc2_.farLimit);
         this.Renamed1496.Renamed1398(_loc3_.lightColor,_loc3_.shadowColor,_loc3_.angleX,_loc3_.angleZ);
         this.Renamed2430 = new Renamed623();
         var _loc4_:Number = _loc1_.gravity;
         this.Renamed2448 = new Renamed620(_loc4_,this.battleData.Renamed2375,battleEventDispatcher);
         this.Renamed1496.Renamed1400(new Renamed1297(this.Renamed2448.Renamed692()));
         this.Renamed1496.Renamed1385(this,_loc1_.Renamed2491);
         this.Renamed1496.Renamed1406(_loc1_.ssaoColor);
         this.Renamed2436 = new Renamed2326(display.stage,this.Renamed2448,this.Renamed2461);
         this.Renamed2436.Renamed2341(settings.adaptiveFPS);
         this.Renamed2430.Renamed751(Renamed2423.Renamed2492());
         this.Renamed2431 = new DebugPanel();
         this.Renamed2431.visible = false;
         display.stage.addChild(this.Renamed2431);
         this.Renamed2443 = new Renamed1498();
         this.Renamed2444 = new Renamed1464(Renamed2427);
         this.Renamed2456 = new Renamed2401();
         this.Renamed2457 = new Renamed2409();
      }
      
      private function Renamed2477(param1:IGameObject) : void
      {
         this.Renamed2493();
         var _loc2_:Renamed2414 = this.Renamed2494(param1);
         var _loc3_:MapResource = _loc2_.Renamed2495();
         this.mapId = _loc3_.id;
         var _loc4_:XML = XML(_loc3_.mapData.toString());
         var _loc5_:Renamed2412 = new Renamed2412(Renamed1368,_loc3_.libRegistry);
         _loc5_.build(_loc4_,this.Renamed2496);
         Renamed2418 = _loc5_;
      }
      
      private function Renamed2494(param1:IGameObject) : Renamed2414
      {
         return Renamed2414(param1.adapt(Renamed2414));
      }
      
      private function Renamed2493() : void
      {
         var _loc1_:Renamed2497 = new Renamed2497(this.Renamed2450.Renamed2498);
         this.Renamed1496.Renamed1416(_loc1_);
         this.Renamed1496.Renamed1420(settings.showSkyBox);
         var _loc2_:Vector3 = Renamed668.Renamed681(this.Renamed2450.Renamed2499);
         var _loc3_:Number = this.Renamed2450.Renamed2500;
         this.Renamed2447 = new Renamed2348(_loc1_,_loc2_,_loc3_);
         this.Renamed1496.Renamed1287(this.Renamed2447,0);
      }
      
      private function Renamed2487(param1:String) : void
      {
         Network(OSGi.getInstance().getService(Network)).send(new Renamed2403(param1));
      }
      
      public function Renamed2501() : void
      {
         this.battleActive = true;
      }
      
      public function Renamed2502() : void
      {
         var _loc1_:* = undefined;
         var _loc2_:Bonus = null;
         this.battleActive = false;
         battleEventDispatcher.dispatchEvent(new Renamed894());
         for(_loc1_ in this.Renamed2435.bonuses)
         {
            _loc2_ = this.Renamed2435.bonuses[_loc1_];
            _loc2_.remove();
            delete this.Renamed2435.bonuses[_loc1_];
         }
      }
      
      public function battleRestart() : void
      {
         this.battleActive = true;
         battleEventDispatcher.dispatchEvent(new Renamed901());
      }
      
      public function objectLoaded() : void
      {
         this.Renamed2471();
         if(this.spectator)
         {
            this.Renamed2503();
         }
         else
         {
            this.Renamed2504();
         }
         battleInfoService.battleLoad();
      }
      
      private function Renamed2504() : void
      {
         Renamed2425.init();
         Renamed926.init();
      }
      
      public function handleBattleEvent(param1:Object) : void
      {
         this.Renamed2432.handleBattleEvent(param1);
      }
      
      public function objectUnloaded() : void
      {
         var _loc1_:Bonus = null;
         if(this.spectator)
         {
            this.Renamed2454.close();
            this.Renamed2455.close();
            this.Renamed2452.close();
         }
         this.battleActive = false;
         battleEventDispatcher.dispatchEvent(new Renamed521());
         this.Renamed2436.Renamed2340();
         this.Renamed2436 = null;
         this.Renamed2481();
         this.Renamed1496.shutdown();
         this.Renamed2448.shutdown();
         this.removeListeners();
         this.Renamed2457.close();
         this.Renamed2457 = null;
         this.Renamed2456.close();
         this.Renamed2456 = null;
         this.Renamed2430.Renamed735();
         this.Renamed2430.destroy();
         this.Renamed2430 = null;
         this.Renamed1496.Renamed739().view.clear();
         this.Renamed1496.Renamed739().view = null;
         this.Renamed635(null);
         this.Renamed2431 = null;
         for each(_loc1_ in this.Renamed2435.bonuses)
         {
            _loc1_.remove();
            _loc1_ = null;
         }
         Renamed720.drawBg();
         battleInfoService.setInBattle(false);
         battleInfoService.resetCurrentBattle();
         Renamed2419.removeAllValidators();
         Renamed2421.setColorTransform(null);
         OSGi.getInstance().unregisterService(BattleService);
         Renamed2422.reset();
         Renamed2423.hide();
         this.Renamed2443.close();
         this.Renamed2443 = null;
         this.Renamed2444.close();
         this.Renamed2444 = null;
         if(this.Renamed2445)
         {
            this.Renamed2445.close();
            this.Renamed2445 = null;
         }
         BonusCache.clear();
         if(!this.spectator)
         {
            Renamed926.close();
            Renamed2425.close();
         }
         this.spectator = false;
         this.Renamed2435 = null;
         this.Renamed2458 = false;
         this.Renamed618().clear();
         this.Renamed2459 = false;
         Renamed2418.close();
         Renamed2418 = null;
      }
      
      public function Renamed636(param1:Renamed609) : void
      {
         this.Renamed1496.Renamed636(param1);
      }
      
      public function Renamed637(param1:Renamed608) : void
      {
         this.Renamed2448.Renamed801().Renamed1121(param1);
      }
      
      public function Renamed652() : void
      {
         Renamed2423.show();
         this.Renamed1496.Renamed1408();
         this.Renamed2469();
      }
      
      public function Renamed618() : Renamed616
      {
         return this.Renamed2460;
      }
      
      public function Renamed644(param1:Vector3, param2:Vector3) : void
      {
         if(this.Renamed1496.Renamed1424() != this.Renamed2443)
         {
            return;
         }
         this.Renamed2443.deactivate();
         this.Renamed2443.Renamed1487(param1,param2,this.Renamed1466,this.Renamed2446);
         this.Renamed2444.init(this.Renamed1466,this.Renamed2446);
         this.Renamed1496.Renamed638(this.Renamed2444);
      }
      
      public function Renamed640() : void
      {
         this.Renamed2443.Renamed1483(true);
      }
      
      public function Renamed643() : void
      {
         this.Renamed2443.Renamed1559();
      }
      
      public function Renamed641() : void
      {
         this.Renamed2443.Renamed1483(false);
      }
      
      public function Renamed642(param1:Vector3, param2:Vector3) : void
      {
         this.Renamed2443.Renamed1555(param1,param2);
      }
      
      public function Renamed645() : void
      {
         if(this.Renamed1496 != null)
         {
            this.Renamed1496.Renamed739().rotationY = 0;
            this.Renamed2443.Renamed1486();
         }
      }
      
      public function Renamed639() : void
      {
         this.Renamed2443.activate();
         this.Renamed2443.Renamed1486();
      }
      
      public function Renamed2503() : void
      {
         var _loc1_:Vector3 = new Vector3();
         var _loc2_:Vector3 = new Vector3();
         this.Renamed2505(_loc1_,_loc2_,Renamed2418.Renamed2506());
         this.Renamed1496.Renamed739().setPosition(_loc1_);
         this.Renamed1496.Renamed739().lookAt(_loc2_.x,_loc2_.y,_loc2_.z);
         this.Renamed2445 = new Renamed2382();
         this.Renamed2445.activate();
         this.Renamed638(this.Renamed2445);
         var _loc3_:Renamed2453 = new Renamed2453();
         this.Renamed2452 = _loc3_;
         this.Renamed1496.Renamed1410(_loc3_);
         Renamed2422.Renamed2507();
         this.Renamed2454 = new Renamed2383(this.Renamed2445);
         this.Renamed2455 = new Renamed2320();
         if(!lobbyLayoutService.isSwitchInProgress())
         {
            Renamed718.unlock(Renamed2410.Renamed2508);
         }
      }
      
      public function Renamed2505(param1:Vector3, param2:Vector3, param3:AABB) : void
      {
         param1.x = param3.minX;
         param1.y = param3.minY;
         param1.z = param3.maxZ + Renamed2428;
         param2.x = (param3.minX + param3.maxX) / 2;
         param2.y = (param3.minY + param3.maxY) / 2;
         param2.z = param3.minZ;
      }
      
      public function Renamed638(param1:Renamed611) : void
      {
         this.Renamed1496.Renamed638(param1);
      }
      
      public function Renamed635(param1:Tank) : void
      {
         this.Renamed2443.Renamed1554(param1);
      }
      
      public function Renamed2509() : int
      {
         return this.Renamed2435.Renamed2379;
      }
      
      public function Renamed2510(param1:String, param2:String) : void
      {
         this.Renamed2431.printValue(param1,param2);
      }
      
      public function Renamed2511(param1:Boolean) : void
      {
         var _loc2_:Boolean = settings.muteSound;
         this.Renamed2448.Renamed801().Renamed2470(_loc2_);
      }
      
      public function Renamed2512() : Renamed1498
      {
         return this.Renamed2443;
      }
      
      private function Renamed2496() : void
      {
         this.Renamed2443.Renamed1553(Renamed2418.Renamed1382());
         this.Renamed2513();
         Renamed2422.Renamed2514();
         battleEventDispatcher.dispatchEvent(new Renamed892());
      }
      
      private function Renamed2513() : void
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
            Renamed2515(e);
         }
      }
      
      private function tick() : void
      {
         this.Renamed2461.update();
         Renamed2419.tick();
         this.Renamed2448.tick();
         Renamed2425.tick();
         Renamed926.tick();
      }
      
      private function Renamed2515(param1:Error) : void
      {
         this.Renamed2451.error(param1.message);
         this.removeListeners();
         Renamed2464();
         battleEventDispatcher.dispatchEvent(new Renamed886());
      }
      
      public function Renamed619() : Renamed620
      {
         return this.Renamed2448;
      }
      
      private function onKeyDown(param1:KeyboardEvent) : void
      {
         var _loc2_:Renamed717 = null;
         if(!Renamed718.Renamed728())
         {
            _loc2_ = Renamed719.Renamed729(param1.keyCode);
            if(_loc2_ == Renamed717.OPEN_GARAGE)
            {
               lobbyLayoutService.showGarage();
            }
         }
      }
      
      private function onKey(param1:KeyboardEvent) : void
      {
         if(!Renamed718.Renamed728())
         {
            if(param1.type == KeyboardEvent.KEY_DOWN)
            {
               this.Renamed2516(param1);
            }
         }
      }
      
      private function Renamed2516(param1:KeyboardEvent) : void
      {
         var _loc2_:* = param1.keyCode;
         switch(0)
         {
         }
      }
      
      public function Renamed624() : Renamed613
      {
         return this.Renamed2438;
      }
      
      public function Renamed625(param1:Renamed613) : void
      {
         this.Renamed2438 = param1;
      }
      
      public function Renamed626() : Renamed612
      {
         return this.Renamed2462;
      }
      
      public function Renamed627() : Renamed614
      {
         return this.Renamed2439;
      }
      
      public function Renamed628(param1:Renamed614) : void
      {
         this.Renamed2439 = param1;
      }
      
      public function Renamed629() : Renamed615
      {
         return this.Renamed2440;
      }
      
      public function Renamed630(param1:Renamed615) : void
      {
         this.Renamed2440 = param1;
      }
      
      public function Renamed631() : int
      {
         return this.battleData.Renamed631();
      }
      
      public function Renamed632() : Sound
      {
         return this.battleData.Renamed2490;
      }
      
      public function get Renamed633() : Renamed607
      {
         return this.Renamed2448.Renamed801();
      }
      
      public function Renamed634() : int
      {
         return this.battleData.Renamed634();
      }
      
      public function Renamed646() : Boolean
      {
         return this.battleActive;
      }
      
      public function Renamed647() : Dictionary
      {
         return this.Renamed1496.Renamed1404();
      }
      
      public function Renamed648() : void
      {
         this.Renamed638(this.Renamed2443);
      }
      
      public function Renamed653() : int
      {
         return this.Renamed2448.Renamed653();
      }
      
      public function Renamed654() : void
      {
         this.Renamed2458 = true;
      }
      
      public function Renamed655() : Boolean
      {
         return !this.Renamed2458;
      }
      
      public function Renamed656() : int
      {
         return this.Renamed2444.duration;
      }
      
      public function Renamed657() : Boolean
      {
         return this.Renamed2459;
      }
      
      public function Renamed658(param1:Boolean) : void
      {
         this.Renamed2459 = param1;
      }
      
      public function Renamed649() : Renamed617
      {
         return this.Renamed2441;
      }
      
      public function Renamed650(param1:Renamed617) : void
      {
         this.Renamed2441 = param1;
      }
      
      private function Renamed2465(param1:Renamed702) : void
      {
         var _loc2_:Renamed702 = param1;
         server.Renamed2517(Vector.<int>(_loc2_.Renamed706));
      }
      
      private function Renamed2466(param1:DataValidationErrorEvent) : void
      {
         this.Renamed2518(param1.type);
      }
      
      private function Renamed2518(param1:int) : void
      {
         var _loc2_:int = param1;
         server.Renamed2519(_loc2_);
      }
      
      private function Renamed2483(param1:ClientObject, param2:String, param3:Renamed603, param4:int) : Bonus
      {
         var _loc5_:Renamed2411 = Renamed2411(modelRegistry.getModelsByInterface(Renamed2400)[0]);
         var _loc6_:Bonus;
         (_loc6_ = _loc5_.Renamed2520(param1,param2)).spawn(Renamed668.Renamed681(param3),param4,150,this.onTankCollision);
         this.Renamed2435.bonuses[_loc6_.bonusId] = _loc6_;
         return _loc6_;
      }
   }
}

