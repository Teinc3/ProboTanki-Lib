package alternativa.tanks.models.tank
{
   import § !g§.§class for case§;
   import §!!v§.§,Q§;
   import §!!v§.§get for null§;
   import §!!v§.§use catch true§;
   import §!!y§.§2!Y§;
   import §##D§.§%"i§;
   import §##D§.§,s§;
   import §##Q§.§&H§;
   import §+!e§.§!!r§;
   import §+!e§.§%#A§;
   import §+!e§.§2c§;
   import §+!e§.§6"0§;
   import §+!e§.§]#E§;
   import §+!e§.§do for switch§;
   import §,b§.§switch catch extends§;
   import §7!8§.§<c§;
   import §7!8§.§continue var static§;
   import §7"j§.§with for while§;
   import §;"?§.§#">§;
   import §]#R§.§&!r§;
   import §]#R§.§+#`§;
   import §]#R§.§[§;
   import §]#R§.§^#Z§;
   import §]#R§.§switch var implements§;
   import §]#R§.§try set for§;
   import §`"b§.§function catch extends§;
   import §`"b§.§if for else§;
   import alternativa.math.Quaternion;
   import alternativa.math.Vector3;
   import alternativa.model.IObjectLoadListener;
   import alternativa.object.ClientObject;
   import alternativa.osgi.OSGi;
   import alternativa.osgi.service.display.IDisplay;
   import alternativa.osgi.service.logging.LogService;
   import alternativa.physics.Body;
   import alternativa.physics.collision.types.RayHit;
   import alternativa.register.ClientClass;
   import alternativa.service.IModelService;
   import alternativa.tanks.battle.§+$%§;
   import alternativa.tanks.battle.BattleService;
   import alternativa.tanks.battle.§class true§;
   import alternativa.tanks.battle.events.§+#k§;
   import alternativa.tanks.battle.events.§,!7§;
   import alternativa.tanks.battle.events.§7o§;
   import alternativa.tanks.battle.events.§;!?§;
   import alternativa.tanks.battle.events.BattleEventDispatcher;
   import alternativa.tanks.battle.events.§]!`§;
   import alternativa.tanks.battle.events.§case for null§;
   import alternativa.tanks.battle.events.§catch var finally§;
   import alternativa.tanks.battle.events.§const var finally§;
   import alternativa.tanks.battle.events.§native for if§;
   import alternativa.tanks.battle.events.§throw each§;
   import alternativa.tanks.battle.events.§throw package continue§;
   import alternativa.tanks.battle.events.§var use§;
   import alternativa.tanks.battle.objects.tank.§""m§;
   import alternativa.tanks.battle.objects.tank.§4"3§;
   import alternativa.tanks.battle.objects.tank.§<"]§;
   import alternativa.tanks.battle.objects.tank.Tank;
   import alternativa.tanks.battle.objects.tank.§continue var case§;
   import alternativa.tanks.battle.objects.tank.§include const implements§;
   import alternativa.tanks.battle.objects.tank.tankskin.§false catch set§;
   import alternativa.tanks.battle.scene3d.§[!r§;
   import alternativa.tanks.display.usertitle.TitleConfigFlags;
   import alternativa.tanks.display.usertitle.UserTitle;
   import alternativa.tanks.models.battle.battlefield.BattleUserInfoService;
   import alternativa.tanks.models.battle.battlefield.§static throw§;
   import alternativa.tanks.models.battle.gui.§&"4§;
   import alternativa.tanks.models.tank.spawn.spawnhandlers.§<6§;
   import alternativa.tanks.models.weapon.§catch catch false§;
   import alternativa.tanks.service.settings.ISettingsService;
   import alternativa.tanks.services.initialeffects.IInitialEffectsService;
   import alternativa.tanks.services.initialeffects.§if catch function§;
   import alternativa.tanks.services.tankregistry.TankUsersRegistry;
   import alternativa.tanks.utils.DataUnitValidator;
   import alternativa.types.Long;
   import §class catch import§.§switch package extends§;
   import §class catch import§.§use var var§;
   import com.alternativaplatform.projects.tanks.client.commons.types.TankParts;
   import com.alternativaplatform.projects.tanks.client.commons.types.TankSpecification;
   import com.alternativaplatform.projects.tanks.client.commons.types.TankState;
   import com.alternativaplatform.projects.tanks.client.models.tank.ClientTank;
   import §extends set extends§.§^#R§;
   import §extends set extends§.§do const for§;
   import §extends set extends§.§import set finally§;
   import §finally for continue§.§"U§;
   import §finally for each§.§with for true§;
   import flash.media.Sound;
   import flash.utils.Dictionary;
   import flash.utils.getTimer;
   import §for set super§.§super const continue§;
   import §function implements§.§return var class§;
   import §if package do§.§?"0§;
   import platform.client.fp10.core.registry.ModelRegistry;
   import platform.client.fp10.core.registry.ResourceRegistry;
   import platform.client.fp10.core.resource.types.ImageResource;
   import platform.client.fp10.core.resource.types.SoundResource;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.battle.IBattleInfoService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.userproperties.IUserPropertiesService;
   import §return set use§.§'">§;
   import scpacker.tanks.WeaponsManager;
   import §try for class§.§?!w§;
   import §try for class§.§return get§;
   import §with const throw§.§["R§;
   import §with const throw§.§^v§;
   
   public class §2!s§ extends §,s§ implements §%"i§, §+#`§, §[#6§, §throw package continue§, IObjectLoadListener, §finally var return§
   {
      [Inject]
      public static var logService:LogService;
      
      [Inject]
      public static var userPropertiesService:IUserPropertiesService;
      
      [Inject]
      public static var display:IDisplay;
      
      [Inject]
      public static var battleService:BattleService;
      
      [Inject]
      public static var battleUserInfoService:BattleUserInfoService;
      
      [Inject]
      public static var modelRegistry:ModelRegistry;
      
      [Inject]
      public static var battleInfoService:IBattleInfoService;
      
      [Inject]
      public static var §9#A§:TankUsersRegistry;
      
      [Inject]
      public static var settingsService:ISettingsService;
      
      [Inject]
      public static var §set catch switch§:IInitialEffectsService;
      
      [Inject]
      public static var battleEventDispatcher:BattleEventDispatcher;
      
      private static const §class for const§:Number = 0;
      
      private static const §>!N§:Number = 135;
      
      private static const §continue var dynamic§:§#">§ = new §#">§(0,0,0);
      
      private static const §'"h§:int = 5;
      
      private static const §return package implements§:Number = 1250;
      
      private static const § "1§:Number = 80000;
      
      private static const §false package case§:int = 4000;
      
      private static const §4^§:Number = -10000;
      
      private static const §2!n§:int = 3000;
      
      private var §%"h§:§each use§;
      
      private var §"&§:§var use§;
      
      private var §const set var§:§2a§;
      
      private var §]#Q§:§6"[§;
      
      private var §@#_§:Number = 7000;
      
      private var §catch const false§:Number = 7050;
      
      private var §]"_§:int;
      
      private var §%#?§:Boolean;
      
      public var §native const§:int;
      
      private var §>!0§:Dictionary;
      
      private var §6#^§:Dictionary;
      
      private var §6"o§:IModelService;
      
      private var battlefield:§static throw§;
      
      private var §5!-§:§use catch true§;
      
      public var §5!3§:§7!9§;
      
      private var §#"U§:int;
      
      private var §finally set super§:Boolean = true;
      
      private var §each finally§:int;
      
      private var §use throw§:§#">§;
      
      private var §dynamic package each§:§#">§;
      
      private var §6#m§:§#">§;
      
      private var §1"[§:§#">§;
      
      private var §break var throw§:§,X§;
      
      private var point:Vector3;
      
      private var §3#q§:Vector3;
      
      private var §+"#§:Vector3;
      
      private var §extends const default§:RayHit;
      
      public var §`#W§:TankParts;
      
      private var §const include§:§^#Z§;
      
      private var §package get§:§import set finally§;
      
      private var §2!w§:§in catch switch§;
      
      private var §0"h§:§?!w§;
      
      private var §const catch extends§:§finally var case§;
      
      private var §-"i§:§2!Y§;
      
      private var §try for function§:§in for for§;
      
      private var §5",§:int;
      
      private var §`"D§:int;
      
      private var §case set static§:§["R§;
      
      private var §static var const§:int;
      
      private var §0#2§:int;
      
      private var §try for use§:int;
      
      public function §2!s§()
      {
         this.§%"h§ = new §each use§();
         this.§include use§ = new §["R§(new §#">§(0,0,0),0,new §#">§(0,0,0),new §#">§(0,0,0),new §#">§(0,0,0));
         this.§5"F§ = new §^v§(0,0);
         this.§ "G§ = new Dictionary();
         this.§use throw§ = new §#">§(0,0,0);
         this.§dynamic package each§ = new §#">§(0,0,0);
         this.§6#m§ = new §#">§(0,0,0);
         this.§1"[§ = new §#">§(0,0,0);
         this.§default for switch§ = new Quaternion();
         this.§get var extends§ = new Quaternion();
         this.§>"I§ = new Vector3();
         this.point = new Vector3();
         this.§3#q§ = new Vector3();
         this.§+"#§ = new Vector3();
         this.§extends const default§ = new RayHit();
         this.§case set static§ = new §["R§(new §#">§(0,0,0),0,new §#">§(0,0,0),new §#">§(0,0,0),new §#">§(0,0,0));
         super();
         this.§-"i§ = new §2!Y§();
         this.§"&§ = new §var use§(battleEventDispatcher,this);
         this.§"&§.§#"<§(§const var finally§,this.§get const case§);
         this.§"&§.§#"<§(§throw each§,this.§do const switch§);
         this.§"&§.§#"<§(§catch var finally§,this.onSettingsAccepted);
         this.§"&§.§throw var set§();
         this.§break var throw§ = new §,X§();
         OSGi.getInstance().registerService(§finally var return§,this);
      }
      
      private static function §3!L§(param1:UserTitle, param2:int, param3:String, param4:int, param5:§class for case§, param6:int) : void
      {
         param1.setHealth(param2);
         param1.setLabelText(param3);
         param1.setRank(param4);
         param1.setTeamType(param5);
         param1.setConfiguration(param6);
      }
      
      private static function §2n§(param1:TankParts) : §with for while§
      {
         var _loc2_:§return var class§ = §return var class§(param1.hullObject.adapt(§return var class§));
         var _loc3_:Sound = _loc2_.§true extends§().engineIdleSound.sound;
         var _loc4_:Sound = _loc2_.§true extends§().engineStartMovingSound.sound;
         var _loc5_:Sound = _loc2_.§true extends§().engineMovingSound.sound;
         var _loc6_:Sound = SoundResource(ResourceRegistry(OSGi.getInstance().getService(ResourceRegistry)).getResource(Long.getLong(0,242699))).sound;
         return new §with for while§(_loc3_,_loc4_,_loc5_,_loc6_);
      }
      
      private static function §^a§(param1:§&!r§) : void
      {
         param1.§"!w§(settingsService.inverseBackDriving);
      }
      
      private static function §catch package if§(param1:§7!9§) : void
      {
         var _loc2_:int = 0;
         var _loc3_:§finally var return§ = null;
         var _loc4_:UserTitle = null;
         var _loc5_:§if catch function§ = null;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:Vector.<§if catch function§> = §set catch switch§.§+!m§(param1.user.id);
         if(_loc8_ != null)
         {
            _loc2_ = getTimer();
            _loc4_ = param1.tank.title;
            for each(_loc5_ in _loc8_)
            {
               _loc6_ = _loc2_ - _loc5_.§for set const§;
               _loc7_ = _loc5_.duration - _loc6_;
               if(_loc7_ > 0)
               {
                  _loc4_.showIndicator(_loc5_.effectId,_loc7_,false,_loc5_.effectLevel);
               }
            }
         }
      }
      
      public function objectLoaded(param1:ClientObject) : void
      {
      }
      
      public function onTurretDirectionCorrection(param1:Boolean) : void
      {
         var _loc2_:§try set for§ = §7!9§.§8"-§.tank.§3H§();
         this.§import function§(_loc2_.getControl());
         this.§]#Q§.reset();
      }
      
      public function §>#L§() : void
      {
         battleService.§'x§().§true for implements§(this.§const set var§);
         this.§const set var§.reset();
         battleService.§'x§().§true for implements§(this.§]#Q§);
         this.§]#Q§.reset();
      }
      
      public function §-#2§(param1:int) : void
      {
         this.§import function§(param1);
         this.§]#Q§.reset();
      }
      
      public function readyToSpawn(param1:Tank) : void
      {
         if(param1.tankData.local)
         {
            §do const for§(§7!9§.§8"-§.user.getParams(§import set finally§)).handleReadyToSpawn();
         }
         else
         {
            §^#R§(param1.tankData.user.getParams(§import set finally§)).handleReadyToSpawn();
         }
      }
      
      private function §9@§() : void
      {
         var _loc1_:§<c§ = §<c§(OSGi.getInstance().getService(§<c§));
         _loc1_.§9@§();
      }
      
      private function §import function§(param1:int) : void
      {
         var _loc2_:§try set for§ = this.§3H§(§7!9§.§8"-§.user);
         var _loc3_:Tank = §7!9§.§8"-§.tank;
         this.§case var import§(param1);
         this.§5"F§.angle = _loc2_.§do var§();
         this.§5"F§.control = param1;
         server.rotateTurretCommand(battleService.§'x§().§]"d§(),this.§5"F§,_loc3_.incarnation);
      }
      
      [Obfuscation(rename="false")]
      public function §9!^§(param1:ClientObject, param2:§^v§) : void
      {
         this.§try for implements§(param1,param2.angle,param2.control);
      }
      
      [Obfuscation(rename="false")]
      public function §each get§(param1:ClientObject, param2:int) : void
      {
         this.§2"K§(param1).§7"2§(param2);
      }
      
      public function onReadyToActivate() : void
      {
         var _loc1_:Tank = null;
         if(this.§5!3§ != null)
         {
            _loc1_ = this.§5!3§.tank;
            if(_loc1_.§1"-§() == 0)
            {
               server.§super for dynamic§();
               this.§override for function§();
            }
         }
      }
      
      [Obfuscation(rename="false")]
      public function §8"t§(param1:ClientObject, param2:§["R§, param3:Number) : void
      {
         this.move(param1,param2);
         this.§try for implements§(param1,param3,param2.control);
      }
      
      public function §6#t§(param1:ClientObject, param2:§#">§, param3:§#">§, param4:§#">§, param5:§#">§, param6:int) : void
      {
         var _loc7_:Tank = this.getTank(param1);
         if(_loc7_ != null)
         {
            if(§+$%§.§@#z§(param2) && §+$%§.§@#z§(param3) && §+$%§.§@#z§(param4) && §+$%§.§@#z§(param5))
            {
               _loc7_.§class for break§(param2,param3,param4,param5);
            }
            this.§2"K§(param1).§7"2§(param6);
         }
      }
      
      public function §2"K§(param1:ClientObject) : §^#Z§
      {
         return §^#Z§(param1.getParams(§^#Z§));
      }
      
      private function §try for implements§(param1:ClientObject, param2:Number, param3:int) : void
      {
         var _loc4_:§try set for§ = null;
         var _loc5_:Tank = this.getTank(param1);
         if(_loc5_ != null)
         {
            _loc4_ = _loc5_.§3H§();
            _loc4_.§function var package§(param2);
            _loc4_.§7"2§(param3);
         }
      }
      
      private function §case var import§(param1:int) : void
      {
         if(this.§`"D§ != param1)
         {
            this.§`"D§ = param1;
            this.§9@§();
         }
      }
      
      public function objectUnloaded(param1:ClientObject) : void
      {
         this.§-"i§.objectUnloaded(param1);
         this.§["L§(param1);
         this.§include set continue§(param1);
      }
      
      private function §extends set with§(param1:ClientObject) : void
      {
         var _loc2_:§,!3§ = this.§^"l§(param1);
         if(_loc2_)
         {
            battleService.§'x§().§%"7§(_loc2_);
            param1.removeParams(§,!3§);
         }
      }
      
      private function §["L§(param1:ClientObject) : void
      {
         §9#A§.removeUser(param1);
         if(§9#A§.§set var extends§() == 0)
         {
            battleUserInfoService.§8"J§(this.§break var throw§);
         }
      }
      
      private function §throw var default§(param1:§7!9§) : void
      {
         var §3!§:§7!9§ = param1;
         try
         {
            this.§"&§.dispatchEvent(new §+#k§(§3!§.tank,§3!§.local));
            return;
         }
         catch(e:Error)
         {
            return;
         }
      }
      
      private function §include set continue§(param1:ClientObject) : void
      {
         var _loc2_:Tank = this.getTank(param1);
         this.§1"]§(_loc2_);
         this.§package package do§(_loc2_);
         this.§throw var default§(_loc2_.tankData);
         this.§6"+§(_loc2_);
         _loc2_.destroy();
      }
      
      private function §6"+§(param1:Tank) : void
      {
         if(§'">§(param1.§if for with§().getParams(§'">§)) != null)
         {
            §'">§(param1.§if for with§().getParams(§'">§)).close();
         }
         WeaponsManager.clearSFXModel(param1.§if for with§());
         UserTitle(param1.§if for with§().removeParams(UserTitle)).close();
         §^#Z§(param1.§if for with§().removeParams(§^#Z§)).close();
         if(param1.tankData.local)
         {
            §super catch function§(param1.§if for with§().removeParams(§super catch function§)).close();
            §2c§(param1.§if for with§().removeParams(§2c§)).close();
            §do const for§(param1.§if for with§().getParams(§import set finally§)).close();
            if(param1.§if for with§().getParams(§<6§) != null)
            {
               §<6§(param1.§if for with§().removeParams(§<6§)).close();
            }
            §static implements§(param1.§if for with§().removeParams(§static implements§)).close();
            §!!r§(param1.§if for with§().removeParams(§!!r§)).close();
            §63§.teamType = §class for case§.NONE;
            §do for switch§(param1.§if for with§().removeParams(§do for switch§)).close();
            §6"0§(param1.§if for with§().removeParams(§6"0§)).close();
            §continue var static§(OSGi.getInstance().getService(§<c§)).getPauseSupport().close();
            §]#E§(param1.§if for with§().removeParams(§]#E§)).close();
            §while var final§(param1.§if for with§().removeParams(§while var final§)).close();
            §%#A§(param1.§if for with§().removeParams(§%#A§)).close();
            §switch var implements§(param1.§if for with§().removeParams(§switch var implements§)).close();
            this.§override for function§();
            this.§const set var§ = null;
            this.§]#Q§ = null;
            this.§5!3§.tank = null;
            §7!9§.§8"-§ = null;
         }
      }
      
      public function §true const use§(param1:String, param2:String) : ClientObject
      {
         var _loc3_:ClientClass = new ClientClass(param1,null,param2);
         return new ClientObject(param1,_loc3_,param2,null);
      }
      
      public function initObject(param1:ClientObject, param2:Number, param3:TankParts, param4:Number, param5:Number, param6:Number, param7:Number, param8:String = null) : void
      {
         this.§9$!§(param1);
         param1.putParams(§in for for§,new §in for for§(battleUserInfoService.§include for package§(param8),battleUserInfoService.§try set set§(param8),true,battleUserInfoService.§if const with§(param8)));
         this.createData(param1,param2,param3,param4,param5,param6,param7,param8);
      }
      
      private function §9$!§(param1:ClientObject) : void
      {
         §9#A§.addUser(param1);
         if(§9#A§.§set var extends§() == 1)
         {
            battleUserInfoService.§catch for with§(this.§break var throw§);
         }
      }
      
      private function createData(param1:ClientObject, param2:Number, param3:TankParts, param4:Number, param5:Number, param6:Number, param7:Number, param8:String = null) : void
      {
         var _loc9_:§7!9§;
         (_loc9_ = new §7!9§()).user = param1;
         _loc9_.userName = param8;
         _loc9_.mass = param2;
         _loc9_.hull = this.§true const use§(param8 + "_hull",param8 + "_hull");
         _loc9_.turret = WeaponsManager.getObjectFor(param3.turretObject.name);
         WeaponsManager.§case const function§(param1,_loc9_.turret,param4,param5,param6,param7);
         _loc9_.turretObject = param3.turretObject;
         param1.putParams(§2!s§,_loc9_);
      }
      
      public function §`K§(param1:ClientObject, param2:ClientTank, param3:TankParts) : void
      {
         var _loc4_:§7!9§;
         (_loc4_ = this.getTankData(param1)).local = param2.self;
         _loc4_.§import extends§ = param2.tankSpecification;
         var _loc5_:§try set for§ = this.§2C§(_loc4_);
         var _loc6_:§switch var implements§ = this.§class catch false§(param1);
         var _loc7_:UserTitle = this.§catch for continue§(_loc4_);
         param1.putParams(UserTitle,_loc7_);
         var _loc8_:§4"3§ = this.§0+§(_loc4_);
         this.§finally set default§(_loc8_,_loc4_);
         var _loc9_:Tank = this.createTank(_loc5_,_loc6_,_loc8_,_loc4_,param3,_loc7_);
         this.§class catch package§(_loc9_);
         this.§^#v§(_loc9_);
         this.§@!'§(_loc9_);
         _loc4_.tank = _loc9_;
         _loc4_.user = param1;
         if(_loc4_.local)
         {
            this.§5!3§ = _loc4_;
            this.§@#p§();
            this.§1"%§(_loc4_);
            param1.putParams(§import set finally§,new §do const for§(_loc9_,server));
            _loc9_.§[9§(new §""m§(_loc9_));
         }
         else
         {
            param1.putParams(§import set finally§,new §^#R§(_loc9_));
            _loc9_.§[9§(new §include const implements§(_loc9_));
         }
         this.§-"i§.objectLoadedPost(param1);
         this.§&F§(_loc4_,param2.tankSpecification,true);
         this.§"#[§(_loc4_);
         this.§"&§.dispatchEvent(new §;!?§(_loc4_.tank,_loc4_.local));
         if(this.§get set finally§(param2))
         {
            this.§static package dynamic§(_loc4_,param2);
         }
         if(_loc4_.local)
         {
            §continue var static§(OSGi.getInstance().getService(§<c§)).localTankLoaded();
            §with for true§(modelRegistry.getModel(Long.getLong(1286074115,-176946994))).localTankLoaded(param1);
            this.§9@§();
         }
      }
      
      private function §class catch package§(param1:Tank) : void
      {
         if(param1.tankData.local)
         {
            §7!9§.§8"-§ = param1.tankData;
         }
         param1.§if for with§().putParams(Tank,param1);
      }
      
      private function §get set finally§(param1:ClientTank) : Boolean
      {
         return param1.tankState != null && param1.health > 0;
      }
      
      private function §@#p§() : void
      {
         this.§"&§.§#!V§();
         this.§"&§.§throw var set§();
      }
      
      private function §@!'§(param1:Tank) : void
      {
         var _loc2_:DataUnitValidator = param1.§%#o§();
         param1.§if for with§().putParams(§super catch function§,new §super catch function§(_loc2_));
      }
      
      private function §^#v§(param1:Tank) : void
      {
         var _loc2_:§^#Z§ = null;
         var _loc3_:§&!r§ = null;
         if(param1.tankData.local)
         {
            _loc3_ = new §&!r§(param1,this);
            _loc3_.lock(§<"]§.DEAD);
            §^a§(_loc3_);
            _loc2_ = _loc3_;
            param1.tankData.user.putParams(§6"0§,new §6"0§(_loc3_));
         }
         else
         {
            _loc2_ = new §^#Z§(param1);
            _loc2_.lock(§<"]§.DEAD);
         }
         param1.§if for with§().putParams(§^#Z§,_loc2_);
      }
      
      public function §else var try§(param1:ClientObject, param2:int) : void
      {
         this.§2"K§(param1).lock(param2);
         this.§3H§(param1).lock(param2);
      }
      
      public function §["W§(param1:ClientObject, param2:int) : void
      {
         this.§2"K§(param1).unlock(param2);
         this.§3H§(param1).unlock(param2);
      }
      
      public function §3H§(param1:ClientObject) : §try set for§
      {
         return §try set for§(param1.getParams(§try set for§));
      }
      
      public function §class catch false§(param1:ClientObject) : §switch var implements§
      {
         return §switch var implements§(param1.getParams(§switch var implements§));
      }
      
      private function §`">§(param1:ClientObject) : void
      {
         var _loc2_:§,!3§ = new §,!3§(this.getTank(param1),this.§implements catch extends§,4000,2000);
         param1.putParams(§,!3§,_loc2_);
         battleService.§'x§().§%#9§(_loc2_);
      }
      
      private function §implements catch extends§(param1:ClientObject, param2:§#">§, param3:§#">§) : void
      {
         this.§6#t§(param1,param2,param3,§continue var dynamic§,§continue var dynamic§,0);
         this.getTank(param1).§0"t§().saveState();
      }
      
      private function §"#[§(param1:§7!9§) : void
      {
         var _loc2_:§if for else§ = §if for else§(OSGi.getInstance().getService(§if for else§));
         if(!_loc2_.isLoaded(param1.userName))
         {
            §function catch extends§(OSGi.getInstance().getService(§&"4§)).userConnect(_loc2_.getShortUserInfo(param1.userName));
         }
      }
      
      private function §2C§(param1:§7!9§) : §try set for§
      {
         var _loc2_:§try set for§ = null;
         var _loc3_:§switch var implements§ = null;
         if(param1.local)
         {
            _loc3_ = this.§set package break§().§class catch false§(param1);
            _loc2_ = _loc3_.§3H§();
            _loc2_.setListener(this);
            param1.user.putParams(§switch var implements§,_loc3_);
         }
         else
         {
            _loc2_ = new §try set for§(true,param1);
         }
         param1.user.putParams(§try set for§,_loc2_);
         return _loc2_;
      }
      
      private function §0+§(param1:§7!9§) : §4"3§
      {
         var _loc2_:§catch catch false§ = §7;§.§"!$§(param1.turret);
         if(param1.local)
         {
            return _loc2_.§return package set§(param1.user);
         }
         return _loc2_.§each package class§(param1.user);
      }
      
      private function §finally set default§(param1:§4"3§, param2:§7!9§) : void
      {
         if(param2.local)
         {
            param2.user.putParams(§function package while§,new §8"x§(param1));
         }
         else
         {
            param2.user.putParams(§function package while§,new §!!a§(param1));
         }
      }
      
      public function §6"$§() : void
      {
         var _loc4_:§7!9§ = null;
         var _loc1_:ClientObject = null;
         var _loc2_:§finally var return§ = null;
         var _loc3_:Tank = null;
         for each(_loc1_ in §9#A§.§ !c§())
         {
            _loc4_ = this.getTankData(_loc1_);
            if(_loc4_ != §7!9§.§8"-§)
            {
               _loc3_ = _loc4_.tank;
               if(_loc3_ != null)
               {
                  this.§&]§(_loc4_);
                  §catch package if§(_loc4_);
               }
            }
         }
      }
      
      public function §&]§(param1:§7!9§) : void
      {
         var _loc2_:* = 0;
         var _loc3_:§in for for§ = null;
         var _loc4_:Tank = null;
         var _loc5_:Tank = null;
         if(§7!9§.§8"-§ != null)
         {
            _loc5_ = §7!9§.§8"-§.tank;
            if(_loc5_.teamType != null)
            {
               _loc2_ = TitleConfigFlags.LABEL | TitleConfigFlags.EFFECTS;
               _loc3_ = this.§,m§(param1.user);
               _loc4_ = param1.tank;
               if(§7!9§.§8"-§ != null && _loc4_.§="%§(_loc5_.teamType))
               {
                  _loc2_ |= TitleConfigFlags.HEALTH;
               }
               §3!L§(param1.tank.title,_loc4_.tankData.health,_loc3_.name,_loc3_.rank,_loc4_.teamType,_loc2_);
            }
         }
         if(battleInfoService.isSpectatorMode())
         {
            _loc2_ = TitleConfigFlags.LABEL | TitleConfigFlags.EFFECTS | TitleConfigFlags.HEALTH;
            _loc3_ = this.§,m§(param1.user);
            _loc4_ = param1.tank;
            §3!L§(param1.tank.title,_loc4_.tankData.health,_loc3_.name,_loc3_.rank,_loc4_.teamType,_loc2_);
         }
      }
      
      private function §catch for continue§(param1:§7!9§) : UserTitle
      {
         var _loc2_:UserTitle = null;
         var _loc3_:§in for for§ = null;
         var _loc4_:§[!r§ = battleService.§3l§();
         if(param1.local)
         {
            _loc2_ = new UserTitle(§class for const§,_loc4_.§]!4§(),10000,true);
            _loc3_ = this.§,m§(param1.user);
            _loc2_.setRank(_loc3_.rank);
            _loc2_.setLabelText(_loc3_.name);
            _loc2_.setConfiguration(TitleConfigFlags.HEALTH | TitleConfigFlags.WEAPON | TitleConfigFlags.EFFECTS);
         }
         else
         {
            _loc2_ = new UserTitle(§>!N§,_loc4_.§9#"§(),10000,false);
            _loc2_.setSuspicious(battleUserInfoService.§final catch switch§(param1.userName));
         }
         return _loc2_;
      }
      
      public function getTitle(param1:ClientObject) : UserTitle
      {
         return UserTitle(param1.getParams(UserTitle));
      }
      
      public function §,m§(param1:ClientObject) : §in for for§
      {
         return §in for for§(param1.getParams(§in for for§));
      }
      
      public function getTank(param1:ClientObject) : Tank
      {
         return Tank(param1.getParams(Tank));
      }
      
      public function §1!l§(param1:ClientObject) : void
      {
         var _loc2_:§7!9§ = this.getTankData(param1);
         if(_loc2_ == null || _loc2_.tank == null)
         {
            return;
         }
         _loc2_.tank.§throw var else§();
         this.§set set super§(param1).§break catch false§();
         this.§set set super§(param1).§9!-§(§<"]§.DEAD | §<"]§.DISABLED);
         if(_loc2_.local)
         {
            _loc2_.tank.§`8§(_loc2_.tank.§null var include§() | §super const continue§.§try var continue§);
            this.§"&§.dispatchEvent(new §7o§(_loc2_.tank));
         }
         this.§"&§.dispatchEvent(new §native for if§(_loc2_.tank));
         this.§package package do§(_loc2_.tank);
      }
      
      public function §set set super§(param1:ClientObject) : §function package while§
      {
         return §function package while§(param1.getParams(§function package while§));
      }
      
      public function §`!C§(param1:ClientObject, param2:Number) : void
      {
         var _loc3_:§7!9§ = this.getTankData(param1);
         if(_loc3_.tank != null)
         {
            this.§return for case§(_loc3_.tank,param2);
         }
      }
      
      public function getTankData(param1:ClientObject) : §7!9§
      {
         return §7!9§(param1.getParams(§2!s§));
      }
      
      public function handleBattleEvent(param1:Object) : void
      {
         this.§"&§.handleBattleEvent(param1);
      }
      
      [Obfuscation(rename="false")]
      public function move(param1:ClientObject, param2:§["R§) : void
      {
         this.§switch set override§(param1,param2);
         this.§function for switch§(param1,param2);
      }
      
      private function §1U§(param1:ClientObject, param2:§["R§) : void
      {
         var _loc3_:Body = null;
         var _loc4_:Number = NaN;
         var _loc5_:Tank = this.getTankData(param1).tank;
         if(_loc5_ != null)
         {
            _loc3_ = _loc5_.§0"t§();
            _loc4_ = 0.5;
            this.§function package class§(_loc4_,_loc3_.state.position,param2.position,param2.position);
            this.§function package class§(_loc4_,_loc3_.state.velocity,param2.§const null§,param2.§const null§);
            this.§function package class§(_loc4_,_loc3_.state.angularVelocity,param2.angularVelocity,param2.angularVelocity);
            this.§[#R§(_loc4_,_loc3_.state.orientation,param2.orientation,param2.orientation);
         }
      }
      
      private function §function for switch§(param1:ClientObject, param2:§["R§) : void
      {
         this.§6#t§(param1,param2.position,param2.orientation,param2.§const null§,param2.angularVelocity,param2.control);
      }
      
      private function §switch set override§(param1:ClientObject, param2:§["R§) : void
      {
         this.§1U§(param1,param2);
      }
      
      public function §^"l§(param1:ClientObject) : §,!3§
      {
         return §,!3§(param1.getParams(§,!3§));
      }
      
      private function §function package class§(param1:Number, param2:Vector3, param3:§#">§, param4:§#">§) : void
      {
         param4.x = param2.x + (param3.x - param2.x) * param1;
         param4.y = param2.y + (param3.y - param2.y) * param1;
         param4.z = param2.z + (param3.z - param2.z) * param1;
      }
      
      private function §[#R§(param1:Number, param2:Quaternion, param3:§#">§, param4:§#">§) : void
      {
         this.§default for switch§.setFromEulerAnglesXYZ(param3.x,param3.y,param3.z);
         this.§get var extends§.slerp(param2,this.§default for switch§,param1);
         this.§get var extends§.getEulerAngles(this.§>"I§);
         param4.x = this.§>"I§.x;
         param4.y = this.§>"I§.y;
         param4.z = this.§>"I§.z;
      }
      
      public function §null for try§(param1:Tank) : void
      {
         var _loc2_:Dictionary = battleService.§^#6§();
         _loc2_[param1.§in package default§().§2"F§()] = true;
         _loc2_[param1.§in package default§().§7!T§()] = true;
      }
      
      private function §package package do§(param1:Tank) : void
      {
         var _loc2_:Dictionary = battleService.§^#6§();
         delete _loc2_[param1.§in package default§().§2"F§()];
         delete _loc2_[param1.§in package default§().§7!T§()];
      }
      
      public function §null for get§(param1:Tank) : void
      {
         this.§ "G§[param1.tankData.userName] = param1;
         param1.§&"K§(battleService);
         this.§"&§.dispatchEvent(new §,!7§(param1,param1.tankData.local));
      }
      
      public function §1"]§(param1:Tank) : void
      {
         if(this.§ "G§[param1.§if for with§().id])
         {
            delete this.§ "G§[param1.§if for with§().id];
            param1.§implements package var§();
            battleEventDispatcher.dispatchEvent(new §case for null§(param1));
         }
      }
      
      private function §get const case§(param1:§const var finally§) : void
      {
         this.§?#9§();
      }
      
      private function §?#9§() : void
      {
         var _loc1_:ClientObject = null;
         var _loc2_:Tank = null;
         for each(_loc1_ in §9#A§.§ !c§())
         {
            _loc2_ = this.getTankData(_loc1_).tank;
            if(_loc2_ != null)
            {
               _loc2_.disable();
               this.§else var try§(_loc2_.§if for with§(),§<"]§.DISABLED);
               this.§set set super§(_loc2_.§if for with§()).§-!e§(§<"]§.DISABLED,false);
            }
         }
      }
      
      private function §do const switch§(param1:§throw each§) : void
      {
         var _loc2_:ClientObject = null;
         var _loc3_:Tank = null;
         for each(_loc2_ in §9#A§.§ !c§())
         {
            _loc3_ = this.getTankData(_loc2_).tank;
            this.§1"]§(_loc3_);
         }
      }
      
      public function §;!2§(param1:§#">§, param2:§#">§) : void
      {
         this.§2!w§.§native catch package§(param1,param2);
         this.§#"^§();
         this.§0"h§ = new §?!w§(battleService.§;2§(),object);
         battleService.§'x§().§%#9§(this.§0"h§);
      }
      
      public function setReadyToPlace() : void
      {
         this.§#"^§();
         server.setReadyToPlace();
      }
      
      private function §#"^§() : void
      {
         if(this.§0"h§)
         {
            battleService.§'x§().§%"7§(this.§0"h§);
            this.§0"h§ = null;
         }
      }
      
      public function spawn(param1:ClientObject, param2:§class for case§, param3:§#">§, param4:§#">§, param5:int, param6:int) : void
      {
         var _loc7_:int = 0;
         var _loc8_:§,!3§ = null;
         var _loc9_:§7!9§ = this.getTankData(param1);
         if(_loc9_.local)
         {
            §63§.teamType = param2;
         }
         var _loc10_:Tank = _loc9_.tank;
         this.§1"]§(_loc10_);
         _loc10_.spawn(param2,param6);
         _loc10_.§try package const§();
         this.§import for if§(_loc9_,param5);
         this.§["W§(param1,§<"]§.DEAD | §<"]§.DISABLED);
         _loc7_ = this.§,m§(_loc9_.user).isLocal ? int(this.§2"K§(param1).§,#I§()) : int(0);
         this.§6#t§(_loc9_.user,param3,param4,§continue var dynamic§,§continue var dynamic§,_loc7_);
         _loc8_ = this.§^"l§(param1);
         if(_loc8_)
         {
            _loc8_.§while for else§(param3,param4);
         }
         if(_loc9_.local)
         {
            this.§null for try§(_loc10_);
            this.§>#L§();
            this.§override for function§();
            this.§const catch extends§ = new §finally var case§(getTimer() + battleService.§override true§(),param1);
            battleService.§'x§().§%#9§(this.§const catch extends§);
            battleService.§get package dynamic§();
            battleService.§continue package try§();
            battleService.§'x§().§%"§(_loc10_.§0"t§());
            this.getTitle(param1).show();
            this.§6"$§();
         }
         else
         {
            this.§null for try§(_loc10_);
            this.§&]§(_loc10_.tankData);
            this.§3H§(_loc10_.§if for with§()).§7"2§(0);
         }
         this.§null for get§(_loc9_.tank);
      }
      
      private function §override for function§() : void
      {
         if(this.§const catch extends§ != null)
         {
            battleService.§'x§().§%"7§(this.§const catch extends§);
            this.§const catch extends§ = null;
         }
      }
      
      public function kill(param1:ClientObject, param2:String, param3:int) : void
      {
         this.§each for final§(param1,param3);
         battleEventDispatcher.dispatchEvent(new §switch package extends§(param2,param1.id));
      }
      
      public function §each for final§(param1:ClientObject, param2:int) : void
      {
         var _loc3_:§7!9§ = this.getTankData(param1);
         if(_loc3_ == null || _loc3_.tank == null)
         {
            return;
         }
         if(_loc3_.local)
         {
            this.§false set function§(true);
            battleService.§?#E§();
            battleService.§set finally§();
            battleEventDispatcher.dispatchEvent(§]!`§.EVENT);
         }
         _loc3_.health = 0;
         this.§set set super§(_loc3_.user).§-!e§(§<"]§.DEAD,false);
         this.§set set super§(_loc3_.user).§8#0§();
         _loc3_.tank.kill();
         _loc3_.tank.disable();
         _loc3_.spawnState = §continue var case§.DEAD;
         _loc3_.tank.§`8§(_loc3_.tank.§null var include§() & ~§super const continue§.§try var continue§);
         this.§else var try§(param1,§<"]§.DEAD);
         this.§'#!§(_loc3_);
         battleService.§'x§().§%#9§(new §return get§(getTimer() + param2,_loc3_.tank));
         battleEventDispatcher.dispatchEvent(new §use var var§(_loc3_.tank));
      }
      
      public function setHealth(param1:ClientObject, param2:int) : void
      {
         var _loc3_:§7!9§ = this.getTankData(param1);
         if(_loc3_ != null)
         {
            this.§import for if§(_loc3_,param2);
         }
      }
      
      public function §else package final§(param1:ClientObject, param2:Number, param3:Number, param4:Number, param5:Number, param6:int) : void
      {
         var _loc7_:§7!9§ = this.getTankData(param1);
         if(_loc7_ != null)
         {
            this.§[#o§(_loc7_,param2,param3,param4,param5,false);
            if(_loc7_.local)
            {
               §63§.§<!?§(param6);
            }
         }
      }
      
      private function §[#o§(param1:§7!9§, param2:Number, param3:Number, param4:Number, param5:Number, param6:Boolean) : void
      {
         param1.tank.§^!Y§(§+$%§.§use final§(param2),param6);
         param1.tank.setMaxTurnSpeed(param3,param6);
         param1.tank.§5`§(§+$%§.§use final§(param5));
         param1.tank.§3H§().setMaxTurnSpeed(param4,param6);
         param1.§import extends§.acceleration = param5;
         param1.§import extends§.speed = param2;
         param1.§import extends§.turnSpeed = param3;
         param1.§import extends§.turretRotationSpeed = param4;
      }
      
      public function §]#W§() : Dictionary
      {
         return this.§ "G§;
      }
      
      public function §3#g§(param1:ClientObject, param2:int, param3:int, param4:Boolean, param5:int) : void
      {
         var _loc6_:UserTitle = null;
         var _loc7_:int = 0;
         var _loc8_:ClientObject = §9#A§.§if for with§(param1.id);
         var _loc9_:Boolean = true;
         if(_loc8_ != null)
         {
            _loc6_ = this.getTitle(param1);
            if(_loc6_ != null)
            {
               if(_loc6_.hasAnyFlag(TitleConfigFlags.EFFECTS))
               {
                  _loc9_ = false;
                  _loc7_ = this.§,[§(param2,param3);
                  _loc6_.showIndicator(param2,_loc7_,param4,param5);
               }
            }
         }
         if(_loc9_)
         {
            §set catch switch§.addInitialEffect(param1.id,param2,param3,param5);
         }
      }
      
      private function §,[§(param1:int, param2:int) : int
      {
         return int(param2);
      }
      
      public function §get catch do§(param1:ClientObject, param2:int, param3:Boolean) : void
      {
         var _loc4_:UserTitle = null;
         §set catch switch§.§try§(param1.id,param2);
         var _loc5_:ClientObject = §9#A§.§if for with§(param1.id);
         if(_loc5_ != null)
         {
            _loc4_ = this.getTitle(param1);
            if(_loc4_ != null)
            {
               _loc4_.hideIndicator(param2,param3);
            }
         }
      }
      
      private function §set set extends§(param1:int) : Boolean
      {
         return param1 == §,Q§.§&B§;
      }
      
      private function §static package dynamic§(param1:§7!9§, param2:ClientTank) : void
      {
         var _loc3_:TankState = param2.tankState;
         param1.tank.spawn(param2.teamType,param2.incarnationId);
         this.§import for if§(param1,param2.health);
         if(param2.health <= 0)
         {
            param1.tank.§in package default§().§2!<§();
            param1.tank.title.hide();
            this.§else var try§(param1.user,§<"]§.DEAD);
         }
         else
         {
            this.§["W§(param1.user,§<"]§.ALL);
            param1.tank.title.show();
            this.§&]§(param1);
            this.§set set super§(param1.user).§break catch false§();
            this.§set set super§(param1.user).§9!-§(§<"]§.ALL);
         }
         this.§6#t§(param1.user,_loc3_.position,_loc3_.orientation,§continue var dynamic§,§continue var dynamic§,_loc3_.control);
         this.§try for implements§(param1.user,_loc3_.turretAngle,_loc3_.turretControl);
         switch(param2.spawnState)
         {
            case §continue var case§.§set for for§:
               param1.tank.§try package const§();
               break;
            case §continue var case§.§?!S§:
               param1.tank.§throw var else§();
         }
         this.§null for get§(param1.tank);
      }
      
      private function §1"%§(param1:§7!9§) : void
      {
         §&H§(modelRegistry.getModelsByInterface(§switch catch extends§)[0]).localTankLoaded(param1.tank);
         §^a§(§&!r§(this.§2"K§(param1.user)));
         this.§2!w§ = new §in catch switch§(battleService.§!#;§());
         if(battleService.§!#;§())
         {
            param1.user.putParams(§<6§,new §<6§(object,server));
         }
         this.§const set var§ = new §2a§(param1.tank,this.§ "G§);
         this.§]#Q§ = new §6"[§(param1.tank);
         var _loc2_:§static implements§ = new §static implements§(param1.tank,this.§ "G§);
         param1.user.putParams(§static implements§,_loc2_);
         battleService.§3l§().§true var extends§(_loc2_);
         battleService.§^!6§(param1.tank);
         param1.user.putParams(§do for switch§,new §do for switch§(param1.tank));
         param1.user.putParams(§%#A§,new §%#A§(param1.tank));
         param1.user.putParams(§]#E§,new §]#E§(param1.user));
         param1.user.putParams(§while var final§,new §while var final§(param1.user));
         battleService.§4!D§();
      }
      
      private function onSettingsAccepted(param1:§catch var finally§) : void
      {
         if(this.§2"K§(§7!9§.§8"-§.user) != null)
         {
            §^a§(§&!r§(this.§2"K§(§7!9§.§8"-§.user)));
         }
      }
      
      public function §super package case§() : void
      {
         battleService.§'x§().§finally set throw§(this.§const set var§);
         battleService.§'x§().§finally set throw§(this.§]#Q§);
      }
      
      public function §true package var§(param1:int) : void
      {
         this.§const set var§.§@#b§();
      }
      
      public function §false set function§(param1:Boolean) : void
      {
         var _loc2_:§^#Z§ = this.§2"K§(this.§5!3§.user);
         this.§;"#§(_loc2_.§,#I§(),param1);
         this.§const set var§.reset();
      }
      
      private function §;"#§(param1:int, param2:Boolean) : void
      {
         var _loc3_:Tank = null;
         if(this.§ "G§[§7!9§.§8"-§.userName] != null)
         {
            _loc3_ = §7!9§.§8"-§.tank;
            this.§?"S§(param1);
            _loc3_.§5"R§(this.§include use§.position,this.§include use§.orientation,this.§include use§.§const null§,this.§include use§.angularVelocity);
            this.§include use§.control = param1 | this.§3H§(§7!9§.§8"-§.user).getControl();
            this.§1?§(battleService.§'x§().§]"d§(),param2);
         }
      }
      
      private function §6#+§(param1:int, param2:Boolean) : void
      {
         var _loc3_:§finally var return§ = null;
         var _loc4_:Tank = null;
         var _loc5_:int = 0;
         if(this.§ "G§[§7!9§.§8"-§.userName] != null)
         {
            _loc4_ = §7!9§.§8"-§.tank;
            this.§?"S§(param1);
            _loc4_.§3#1§(this.§include use§.position,this.§include use§.orientation,this.§include use§.§const null§,this.§include use§.angularVelocity);
            this.§include use§.control = param1;
            _loc5_ = battleService.§'x§().§]"d§() - §class true§.§@"r§;
            this.§1?§(_loc5_,param2);
         }
      }
      
      public function §+#+§(param1:Boolean) : void
      {
         var _loc2_:§^#Z§ = this.§2"K§(§7!9§.§8"-§.user);
         this.§6#+§(_loc2_.§,#I§(),true);
      }
      
      private function §?"S§(param1:int) : void
      {
         if(this.§5",§ != param1)
         {
            this.§5",§ = param1;
            this.§9@§();
         }
      }
      
      private function §1?§(param1:int, param2:Boolean) : void
      {
         if(param1 <= this.§static var const§)
         {
            return;
         }
         if(param2)
         {
            server.§6"X§(param1,§63§.§false import§(),this.§include use§,this.§3H§(§7!9§.§8"-§.user).§do var§());
            §do set include§.§##F§(this.§include use§,this.§case set static§);
            this.§static var const§ = param1;
         }
         else if(§do set include§.§=!=§(this.§include use§,this.§case set static§))
         {
            if(this.§include use§.control != this.§case set static§.control)
            {
               this.§each for var§(param1,this.§include use§.control);
            }
         }
         else
         {
            this.§`#R§(param1,this.§include use§);
         }
      }
      
      private function §each for var§(param1:int, param2:int) : void
      {
         if(param1 <= this.§0#2§ || param1 <= this.§try for use§)
         {
            return;
         }
         server.§override get§(param1,§63§.§false import§(),param2);
         this.§case set static§.control = param2;
         this.§try for use§ = param1;
      }
      
      private function §`#R§(param1:int, param2:§["R§) : void
      {
         if(param1 <= this.§0#2§)
         {
            return;
         }
         server.moveCommand(param1,§63§.§false import§(),param2);
         §do set include§.§##F§(param2,this.§case set static§);
         this.§0#2§ = param1;
      }
      
      private function §="%§(param1:§class for case§, param2:§class for case§) : Boolean
      {
         return param1 != §class for case§.NONE && param1 == param2;
      }
      
      private function §'#!§(param1:§7!9§) : void
      {
         battleService.§3l§().§7"0§(new §"U§(param1));
      }
      
      private function §set package break§() : §?"0§
      {
         var _loc1_:IModelService = OSGi.getInstance().getService(IModelService) as IModelService;
         return _loc1_.getModelsByInterface(§?"0§)[0] as §?"0§;
      }
      
      private function §import for if§(param1:§7!9§, param2:int) : void
      {
         var _loc4_:§use catch true§ = null;
         param1.health = param2;
         this.getTitle(param1.user).setHealth(param2);
         var _loc3_:int = 10000;
         if(param1.local)
         {
            _loc4_ = §use catch true§(modelRegistry.getModelsByInterface(§use catch true§)[0]);
            _loc4_.§6#C§(§,Q§.§&B§,§get for null§.§super const var§,param2 >= _loc3_);
         }
      }
      
      private function §&F§(param1:§7!9§, param2:TankSpecification, param3:Boolean) : void
      {
         param1.tank.§5!c§(§+$%§.§use final§(param2.reverseAcceleration));
         param1.tank.§catch const catch§(§+$%§.§use final§(param2.sideAcceleration));
         param1.tank.setTurnAcceleration(param2.turnAcceleration);
         param1.tank.§null override§(param2.reverseTurnAcceleration);
         this.§[#o§(param1,param2.speed,param2.turnSpeed,param2.turretRotationSpeed,param2.acceleration,true);
      }
      
      private function createTank(param1:§try set for§, param2:§switch var implements§, param3:§4"3§, param4:§7!9§, param5:TankParts, param6:UserTitle) : Tank
      {
         var _loc7_:§with for while§ = §2n§(param5);
         var _loc8_:§false catch set§ = new §false catch set§(param5.hullObject,param5.turretObject,param5.coloringObject,ImageResource(ResourceRegistry(OSGi.getInstance().getService(ResourceRegistry)).getResource(Long.getLong(0,97860))));
         var _loc9_:int = 10000;
         var _loc10_:Tank;
         (_loc10_ = new Tank(_loc8_,param1,_loc7_,param2,param3,param6,param4.mass,param4.local,battleEventDispatcher,_loc9_,param4.§import extends§.dampingCoeff)).tankData = param4;
         return _loc10_;
      }
      
      private function §return for case§(param1:Tank, param2:Number) : void
      {
         param1.§`!C§(param2);
      }
   }
}

