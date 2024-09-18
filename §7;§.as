package
{
   import § "u§.§in package try§;
   import § "u§.§static set class§;
   import §!#u§.§7"=§;
   import §!#u§.§while package super§;
   import §!A§.§#"+§;
   import §%3§.§super var default§;
   import §+Q§.§finally const§;
   import §0#1§.§try catch static§;
   import §1#c§.§-"c§;
   import §2"X§.§[q§;
   import §3"§.§?!1§;
   import §3^§.§"u§;
   import §6"N§.§null for break§;
   import §6"N§.§while set true§;
   import §7"j§.§!"_§;
   import §;q§.§,§;
   import §;q§.§override const null§;
   import §<#<§.§switch const null§;
   import §?#f§.§8#o§;
   import §[=§.§finally for package§;
   import alternativa.init.BattlefieldModelActivator;
   import alternativa.init.TanksWarfareActivator;
   import alternativa.object.ClientObject;
   import alternativa.osgi.OSGi;
   import alternativa.tanks.models.weapon.§catch catch false§;
   import alternativa.tanks.models.weapon.machinegun.§dynamic package false§;
   import alternativa.tanks.models.weapon.shaft.§>"i§;
   import alternativa.tanks.models.weapon.shotgun.§case package null§;
   import alternativa.tanks.models.weapon.smoky.§do override§;
   import alternativa.tanks.service.money.IMoneyService;
   import alternativa.types.Long;
   import §break set catch§.§each set continue§;
   import §case include§.§case native§;
   import §catch set dynamic§.§@!Z§;
   import §catch var function§.§>@§;
   import §class for§.§each var var§;
   import §continue package switch§.§6"?§;
   import §continue package switch§.§static set in§;
   import §each catch§.§<#=§;
   import §false const case§.§'!U§;
   import §final var static§.§"#;§;
   import §final var static§.§'r§;
   import flash.utils.Dictionary;
   import §implements var final§.§[P§;
   import §in const true§.§case for§;
   import §in set var§.§!#,§;
   import §in var super§.§dynamic set§;
   import §in var super§.§implements const use§;
   import §include package while§.§5!V§;
   import platform.client.fp10.core.registry.GameTypeRegistry;
   import platform.client.fp10.core.registry.ModelRegistry;
   import platform.client.fp10.core.registry.ResourceRegistry;
   import platform.client.fp10.core.resource.types.ImageResource;
   import platform.client.fp10.core.resource.types.SoundResource;
   import platform.client.fp10.core.type.ISpace;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.userproperties.IUserPropertiesService;
   import §return set use§.§6!g§;
   import §return set use§.§^!P§;
   import scpacker.server.models.premium.BattlePremiumService;
   import scpacker.tanks.WeaponsManager;
   import §set break§.§^z§;
   import §set break§.§else package finally§;
   import §super var native§.§return for while§;
   import §switch package return§.§+"O§;
   import §switch var return§.§var const with§;
   import §use var final§.§implements each§;
   import §use var final§.§set const final§;
   import §while const const§.§"!d§;
   import §while const const§.§^"x§;
   import §with for function§.§final set native§;
   
   public class §7;§
   {
      public static var §catch const finally§:Dictionary;
      
      public static var client:ClientObject;
      
      private static var §-"W§:§each var var§;
      
      private static var §+=§:§do override§;
      
      private static var §final const catch§:§!#,§;
      
      private static var §=#N§:§case for§;
      
      private static var §static const in§:§case native§;
      
      private static var §+!1§:§finally const§;
      
      private static var §dynamic import§:§each set continue§;
      
      private static var §="s§:§'!U§;
      
      private static var §9#l§:§>"i§;
      
      private static var §continue var override§:§case package null§;
      
      [Inject]
      public static var userPropertiesService:IUserPropertiesService = OSGi.getInstance().getService(IUserPropertiesService) as IUserPropertiesService;
      
      [Inject]
      public static var moneyService:IMoneyService = OSGi.getInstance().getService(IMoneyService) as IMoneyService;
      
      public static var resourceRegistry:ResourceRegistry = OSGi.getInstance().getService(ResourceRegistry) as ResourceRegistry;
      
      public static var modelRegistry:ModelRegistry = OSGi.getInstance().getService(ModelRegistry) as ModelRegistry;
      
      public static var gameTypeRegistry:GameTypeRegistry = OSGi.getInstance().getService(GameTypeRegistry) as GameTypeRegistry;
      
      private var battle:BattlefieldModelActivator;
      
      private var §null const each§:§?!1§;
      
      private var §=!5§:§finally for package§;
      
      private var §7!w§:§[P§;
      
      private var §%9§:§+"O§;
      
      private var §while for function§:§8#o§;
      
      private var §get for const§:§final set native§;
      
      private var §return set break§:BattlePremiumService;
      
      private var §@#!§:§<#=§;
      
      private var §<!p§:§"u§;
      
      private var §break var set§:§switch const null§;
      
      private var §-c§:ISpace;
      
      private var §9A§:§super var default§;
      
      private var §3N§:§finally for include§;
      
      public function §7;§()
      {
         super();
         var _loc1_:TanksWarfareActivator = new TanksWarfareActivator();
         _loc1_.start(OSGi.getInstance());
         §catch const finally§ = new Dictionary();
         this.§@#!§ = §<#=§(modelRegistry.getModel(Long.getLong(118876660,-1267889929)));
         this.§@#!§.putInitParams(new §#"+§(SoundResource(resourceRegistry.getResource(Long.getLong(0,269321)))));
         this.§<!p§ = §"u§(modelRegistry.getModel(Long.getLong(815932807,-684891581)));
         this.§break var set§ = §switch const null§(modelRegistry.getModel(Long.getLong(759725658,1071543601)));
         this.§9A§ = §super var default§(modelRegistry.getModel(Long.getLong(1965338956,1417730743)));
         §!"_§.init();
      }
      
      public static function §"!$§(param1:ClientObject) : §catch catch false§
      {
         var _loc4_:* = undefined;
         var _loc6_:§5!V§ = null;
         var _loc7_:§^!P§ = null;
         var _loc8_:§^"x§ = null;
         var _loc9_:§in package try§ = null;
         var _loc10_:§implements each§ = null;
         var _loc11_:§"#;§ = null;
         var _loc12_:§while set true§ = null;
         var _loc13_:§var const with§ = null;
         var _loc14_:§7"=§ = null;
         var _loc15_:§var const with§ = null;
         var _loc16_:§else package finally§ = null;
         var _loc17_:§>@§ = null;
         var _loc18_:§[q§ = null;
         var _loc19_:§,#1§ = null;
         var _loc20_:§static set in§ = null;
         var _loc21_:§-"c§ = null;
         var _loc22_:§dynamic package false§ = null;
         if(§+=§ == null)
         {
            §+=§ = §do override§(modelRegistry.getModelsByInterface(§try catch static§)[0]);
            §+!1§ = §finally const§(modelRegistry.getModelsByInterface(§@!Z§)[0]);
            §static const in§ = §case native§(modelRegistry.getModelsByInterface(§^z§)[0]);
            §9#l§ = §>"i§(modelRegistry.getModelsByInterface(§"!d§)[0]);
            §="s§ = §'!U§(modelRegistry.getModelsByInterface(§set const final§)[0]);
            §=#N§ = §case for§(modelRegistry.getModelsByInterface(§'r§)[0]);
            §-"W§ = §each var var§(modelRegistry.getModelsByInterface(§static set class§)[0]);
            §final const catch§ = §!#,§(modelRegistry.getModelsByInterface(§null for break§)[0]);
            §dynamic import§ = §each set continue§(modelRegistry.getModelsByInterface(§while package super§)[0]);
            §continue var override§ = §case package null§(modelRegistry.getModelsByInterface(§override const null§)[0]);
         }
         var _loc2_:String = param1.id.split("_")[0];
         var _loc3_:§catch catch false§ = null;
         _loc4_ = WeaponsManager.specialEntity[param1.id];
         var _loc5_:§return for while§ = WeaponsManager.shotDatas[param1.id];
         switch(_loc2_)
         {
            case "smoky":
               _loc3_ = §+=§;
               break;
            case "shaft":
               (_loc6_ = new §5!V§()).fadeInTimeMs = _loc4_.fadeInTimeMs;
               _loc6_.laserPointerBlueColor = _loc4_.laserPointerBlueColor;
               _loc6_.laserPointerRedColor = _loc4_.laserPointerRedColor;
               _loc6_.locallyVisible = _loc4_.locallyVisible;
               _loc7_ = §^!P§(modelRegistry.getModelsByInterface(§6!g§)[0]);
               _loc7_.putInitParams(_loc6_);
               param1.putParams(§5!V§,_loc6_);
               (_loc8_ = new §^"x§()).afterShotPause = _loc4_.afterShotPause;
               _loc8_.aimingImpact = _loc4_.aimingImpact;
               _loc8_.chargeRate = _loc4_.charge_rate;
               _loc8_.§!§ = _loc4_.discharge_rate;
               _loc8_.fastShotEnergy = _loc4_.fastShotEnergy;
               _loc8_.§="S§ = _loc4_.horizontal_targeting_speed;
               _loc8_.§break set for§ = _loc4_.initial_fov;
               _loc8_.§]!n§ = _loc4_.max_energy;
               _loc8_.minAimedShotEnergy = _loc4_.minAimedShotEnergy;
               _loc8_.§7#o§ = _loc4_.minimum_fov;
               _loc8_.§in for default§ = ImageResource(resourceRegistry.getResource(Long.getLong(0,_loc4_.reticleImageId)));
               _loc8_.rotationCoeffKmin = _loc4_.rotationCoeffKmin;
               _loc8_.rotationCoeffT1 = _loc4_.rotationCoeffT1;
               _loc8_.rotationCoeffT2 = _loc4_.rotationCoeffT2;
               _loc8_.§8l§ = _loc4_.shrubs_hiding_radius_max;
               _loc8_.§]<§ = _loc4_.shrubs_hiding_radius_min;
               _loc8_.targetingAcceleration = _loc4_.targetingAcceleration;
               _loc8_.targetingTransitionTime = _loc4_.targetingTransitionTime;
               _loc8_.§continue var true§ = _loc4_.vertical_targeting_speed;
               §9#l§.putInitParams(_loc8_);
               §9#l§.objectLoaded(param1);
               _loc3_ = §9#l§;
               break;
            case "railgun":
            case "railgun_xt":
               (_loc9_ = new §in package try§()).chargingTimeMsec = _loc4_.chargingTimeMsec;
               _loc9_.weakeningCoeff = _loc4_.weakeningCoeff;
               §-"W§.putInitParams(_loc9_);
               §-"W§.objectLoaded(param1);
               _loc3_ = §-"W§;
               break;
            case "ricochet":
               (_loc10_ = new §implements each§()).energyCapacity = _loc4_.energyCapacity;
               _loc10_.energyPerShot = _loc4_.energyPerShot;
               _loc10_.energyRechargeSpeed = _loc4_.energyRechargeSpeed;
               _loc10_.maxRicochetCount = _loc4_.maxRicochetCount;
               _loc10_.shellRadius = _loc4_.shellRadius;
               _loc10_.shellSpeed = _loc4_.shellSpeed;
               _loc10_.shotDistance = _loc4_.shotDistance;
               §="s§.putInitParams(_loc10_);
               §="s§.objectLoaded(param1);
               _loc3_ = §="s§;
               break;
            case "twins":
               (_loc11_ = new §"#;§()).distance = _loc4_.distance;
               _loc11_.shellRadius = _loc4_.shellRadius;
               _loc11_.speed = _loc4_.speed;
               §=#N§.putInitParams(_loc11_);
               §=#N§.objectLoaded(param1);
               _loc3_ = §=#N§;
               break;
            case "flamethrower":
               (_loc12_ = new §while set true§()).coneAngle = _loc4_.coneAngle;
               _loc12_.range = _loc4_.range;
               _loc13_ = new §var const with§(_loc4_.energyCapacity,_loc4_.energyDischargeSpeed,_loc4_.energyRechargeSpeed,_loc4_.tickIntervalMsec);
               param1.putParams(§var const with§,_loc13_);
               §final const catch§.putInitParams(_loc12_);
               §final const catch§.objectLoaded(param1);
               _loc3_ = §final const catch§;
               break;
            case "freeze":
               (_loc14_ = new §7"=§()).damageAreaConeAngle = _loc4_.damageAreaConeAngle;
               _loc14_.damageAreaRange = _loc4_.damageAreaRange;
               _loc15_ = new §var const with§(_loc4_.energyCapacity,_loc4_.energyDischargeSpeed,_loc4_.energyRechargeSpeed,_loc4_.tickIntervalMsec);
               param1.putParams(§var const with§,_loc15_);
               §dynamic import§.putInitParams(_loc14_);
               §dynamic import§.objectLoaded(param1);
               _loc3_ = §dynamic import§;
               break;
            case "isida":
               (_loc16_ = new §else package finally§()).capacity = _loc4_.capacity;
               _loc16_.chargeRate = _loc4_.chargeRate;
               _loc16_.checkPeriodMsec = _loc4_.checkPeriodMsec;
               _loc16_.coneAngle = _loc4_.coneAngle;
               _loc16_.dischargeDamageRate = _loc4_.dischargeDamageRate;
               _loc16_.dischargeHealingRate = _loc4_.dischargeHealingRate;
               _loc16_.dischargeIdleRate = _loc4_.dischargeIdleRate;
               _loc16_.radius = _loc4_.radius;
               §static const in§.putInitParams(_loc16_);
               §static const in§.objectLoaded(param1);
               _loc3_ = §static const in§;
               break;
            case "thunder":
               (_loc17_ = new §>@§()).impactForce = _loc4_.impactForce;
               _loc17_.minSplashDamagePercent = _loc4_.minSplashDamagePercent;
               _loc17_.radiusOfMaxSplashDamage = _loc4_.radiusOfMaxSplashDamage;
               _loc17_.splashDamageRadius = _loc4_.splashDamageRadius;
               param1.putParams(§>@§,_loc17_);
               _loc3_ = §+!1§;
               break;
            case "shotgun":
               (_loc18_ = new §[q§()).coneHorizontalAngle = _loc4_.coneHorizontalAngle;
               _loc18_.coneVerticalAngle = _loc4_.coneVerticalAngle;
               _loc18_.pelletCount = _loc4_.pelletCount;
               param1.putParams(§[q§,_loc18_);
               (_loc19_ = new §,#1§()).magazineReloadTime = _loc4_.magazineReloadTime;
               _loc19_.magazineSize = _loc4_.magazineSize;
               §continue var override§.putInitParams(_loc19_);
               _loc20_ = new §static set in§();
               _loc20_.putInitParams(_loc18_);
               param1.putParams(§6"?§,_loc20_);
               param1.putParams(§implements const use§,§dynamic set§(modelRegistry.getModel(Long.getLong(486222912,-663069007))));
               _loc3_ = §continue var override§;
               break;
            case "machinegun":
               (_loc21_ = new §-"c§()).spinDownTime = _loc4_.spinDownTime;
               _loc21_.spinUpTime = _loc4_.spinUpTime;
               _loc21_.temperatureHittingTime = _loc4_.temperatureHittingTime;
               _loc21_.weaponTurnDecelerationCoeff = _loc4_.weaponTurnDecelerationCoeff;
               _loc22_ = §dynamic package false§(modelRegistry.getModel(Long.getLong(1635158664,1411719504)));
               _loc22_.putInitParams(_loc21_);
               _loc3_ = _loc22_;
         }
         return _loc3_;
      }
   }
}

