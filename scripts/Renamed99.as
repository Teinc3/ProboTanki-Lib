package
{
   import Renamed9.Renamed10;
   import Renamed9.Renamed11;
   import Renamed12.Renamed13;
   import Renamed12.Renamed14;
   import Renamed15.Renamed16;
   import Renamed17.Renamed18;
   import Renamed19.Renamed20;
   import Renamed21.Renamed22;
   import Renamed23.Renamed24;
   import Renamed25.Renamed26;
   import Renamed27.Renamed28;
   import Renamed29.Renamed30;
   import Renamed31.Renamed32;
   import Renamed31.Renamed33;
   import Renamed1.Renamed2;
   import Renamed34.Renamed35;
   import Renamed34.Renamed36;
   import Renamed37.Renamed38;
   import Renamed39.Renamed40;
   import Renamed41.Renamed42;
   import alternativa.init.BattlefieldModelActivator;
   import alternativa.init.TanksWarfareActivator;
   import alternativa.object.ClientObject;
   import alternativa.osgi.OSGi;
   import alternativa.tanks.models.weapon.Renamed43;
   import alternativa.tanks.models.weapon.machinegun.Renamed44;
   import alternativa.tanks.models.weapon.shaft.Renamed45;
   import alternativa.tanks.models.weapon.shotgun.Renamed46;
   import alternativa.tanks.models.weapon.smoky.Renamed47;
   import alternativa.tanks.service.money.IMoneyService;
   import alternativa.types.Long;
   import Renamed48.Renamed49;
   import Renamed50.Renamed51;
   import Renamed52.Renamed53;
   import Renamed54.Renamed55;
   import Renamed56.Renamed57;
   import Renamed58.Renamed59;
   import Renamed58.Renamed60;
   import Renamed61.Renamed62;
   import Renamed63.Renamed64;
   import Renamed65.Renamed66;
   import Renamed65.Renamed67;
   import flash.utils.Dictionary;
   import Renamed68.Renamed69;
   import Renamed70.Renamed71;
   import Renamed72.Renamed73;
   import Renamed74.Renamed75;
   import Renamed74.Renamed76;
   import Renamed77.Renamed78;
   import platform.client.fp10.core.registry.GameTypeRegistry;
   import platform.client.fp10.core.registry.ModelRegistry;
   import platform.client.fp10.core.registry.ResourceRegistry;
   import platform.client.fp10.core.resource.types.ImageResource;
   import platform.client.fp10.core.resource.types.SoundResource;
   import platform.client.fp10.core.type.ISpace;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.userproperties.IUserPropertiesService;
   import Renamed79.Renamed80;
   import Renamed79.Renamed81;
   import scpacker.server.models.premium.BattlePremiumService;
   import scpacker.tanks.WeaponsManager;
   import Renamed82.Renamed83;
   import Renamed82.Renamed84;
   import Renamed85.Renamed86;
   import Renamed87.Renamed88;
   import Renamed89.Renamed90;
   import Renamed91.Renamed92;
   import Renamed91.Renamed93;
   import Renamed94.Renamed95;
   import Renamed94.Renamed96;
   import Renamed97.Renamed98;
   
   public class Renamed99
   {
      public static var Renamed100:Dictionary;
      
      public static var client:ClientObject;
      
      private static var Renamed101:Renamed57;
      
      private static var Renamed102:Renamed47;
      
      private static var Renamed103:Renamed73;
      
      private static var Renamed104:Renamed71;
      
      private static var Renamed105:Renamed51;
      
      private static var Renamed106:Renamed20;
      
      private static var Renamed107:Renamed49;
      
      private static var Renamed108:Renamed64;
      
      private static var Renamed109:Renamed45;
      
      private static var Renamed110:Renamed46;
      
      [Inject]
      public static var userPropertiesService:IUserPropertiesService = OSGi.getInstance().getService(IUserPropertiesService) as IUserPropertiesService;
      
      [Inject]
      public static var moneyService:IMoneyService = OSGi.getInstance().getService(IMoneyService) as IMoneyService;
      
      public static var resourceRegistry:ResourceRegistry = OSGi.getInstance().getService(ResourceRegistry) as ResourceRegistry;
      
      public static var modelRegistry:ModelRegistry = OSGi.getInstance().getService(ModelRegistry) as ModelRegistry;
      
      public static var gameTypeRegistry:GameTypeRegistry = OSGi.getInstance().getService(GameTypeRegistry) as GameTypeRegistry;
      
      private var battle:BattlefieldModelActivator;
      
      private var Renamed111:Renamed28;
      
      private var Renamed112:Renamed42;
      
      private var Renamed113:Renamed69;
      
      private var Renamed114:Renamed88;
      
      private var Renamed115:Renamed40;
      
      private var Renamed116:Renamed98;
      
      private var Renamed117:BattlePremiumService;
      
      private var Renamed118:Renamed62;
      
      private var Renamed119:Renamed30;
      
      private var Renamed120:Renamed38;
      
      private var Renamed121:ISpace;
      
      private var Renamed122:Renamed18;
      
      private var Renamed123:Renamed4;
      
      public function Renamed99()
      {
         super();
         var _loc1_:TanksWarfareActivator = new TanksWarfareActivator();
         _loc1_.start(OSGi.getInstance());
         Renamed100 = new Dictionary();
         this.Renamed118 = Renamed62(modelRegistry.getModel(Long.getLong(118876660,-1267889929)));
         this.Renamed118.putInitParams(new Renamed16(SoundResource(resourceRegistry.getResource(Long.getLong(0,269321)))));
         this.Renamed119 = Renamed30(modelRegistry.getModel(Long.getLong(815932807,-684891581)));
         this.Renamed120 = Renamed38(modelRegistry.getModel(Long.getLong(759725658,1071543601)));
         this.Renamed122 = Renamed18(modelRegistry.getModel(Long.getLong(1965338956,1417730743)));
         Renamed2.init();
      }
      
      public static function Renamed124(param1:ClientObject) : Renamed43
      {
         var _loc4_:* = undefined;
         var _loc6_:Renamed78 = null;
         var _loc7_:Renamed81 = null;
         var _loc8_:Renamed96 = null;
         var _loc9_:Renamed10 = null;
         var _loc10_:Renamed92 = null;
         var _loc11_:Renamed66 = null;
         var _loc12_:Renamed33 = null;
         var _loc13_:Renamed90 = null;
         var _loc14_:Renamed13 = null;
         var _loc15_:Renamed90 = null;
         var _loc16_:Renamed84 = null;
         var _loc17_:Renamed55 = null;
         var _loc18_:Renamed26 = null;
         var _loc19_:Renamed125 = null;
         var _loc20_:Renamed60 = null;
         var _loc21_:Renamed24 = null;
         var _loc22_:Renamed44 = null;
         if(Renamed102 == null)
         {
            Renamed102 = Renamed47(modelRegistry.getModelsByInterface(Renamed22)[0]);
            Renamed106 = Renamed20(modelRegistry.getModelsByInterface(Renamed53)[0]);
            Renamed105 = Renamed51(modelRegistry.getModelsByInterface(Renamed83)[0]);
            Renamed109 = Renamed45(modelRegistry.getModelsByInterface(Renamed95)[0]);
            Renamed108 = Renamed64(modelRegistry.getModelsByInterface(Renamed93)[0]);
            Renamed104 = Renamed71(modelRegistry.getModelsByInterface(Renamed67)[0]);
            Renamed101 = Renamed57(modelRegistry.getModelsByInterface(Renamed11)[0]);
            Renamed103 = Renamed73(modelRegistry.getModelsByInterface(Renamed32)[0]);
            Renamed107 = Renamed49(modelRegistry.getModelsByInterface(Renamed14)[0]);
            Renamed110 = Renamed46(modelRegistry.getModelsByInterface(Renamed36)[0]);
         }
         var _loc2_:String = param1.id.split("_")[0];
         var _loc3_:Renamed43 = null;
         _loc4_ = WeaponsManager.specialEntity[param1.id];
         var _loc5_:Renamed86 = WeaponsManager.shotDatas[param1.id];
         switch(_loc2_)
         {
            case "smoky":
               _loc3_ = Renamed102;
               break;
            case "shaft":
               (_loc6_ = new Renamed78()).fadeInTimeMs = _loc4_.fadeInTimeMs;
               _loc6_.laserPointerBlueColor = _loc4_.laserPointerBlueColor;
               _loc6_.laserPointerRedColor = _loc4_.laserPointerRedColor;
               _loc6_.locallyVisible = _loc4_.locallyVisible;
               _loc7_ = Renamed81(modelRegistry.getModelsByInterface(Renamed80)[0]);
               _loc7_.putInitParams(_loc6_);
               param1.putParams(Renamed78,_loc6_);
               (_loc8_ = new Renamed96()).afterShotPause = _loc4_.afterShotPause;
               _loc8_.aimingImpact = _loc4_.aimingImpact;
               _loc8_.chargeRate = _loc4_.charge_rate;
               _loc8_.Renamed126 = _loc4_.discharge_rate;
               _loc8_.fastShotEnergy = _loc4_.fastShotEnergy;
               _loc8_.Renamed127 = _loc4_.horizontal_targeting_speed;
               _loc8_.Renamed128 = _loc4_.initial_fov;
               _loc8_.Renamed129 = _loc4_.max_energy;
               _loc8_.minAimedShotEnergy = _loc4_.minAimedShotEnergy;
               _loc8_.Renamed130 = _loc4_.minimum_fov;
               _loc8_.Renamed131 = ImageResource(resourceRegistry.getResource(Long.getLong(0,_loc4_.reticleImageId)));
               _loc8_.rotationCoeffKmin = _loc4_.rotationCoeffKmin;
               _loc8_.rotationCoeffT1 = _loc4_.rotationCoeffT1;
               _loc8_.rotationCoeffT2 = _loc4_.rotationCoeffT2;
               _loc8_.Renamed132 = _loc4_.shrubs_hiding_radius_max;
               _loc8_.Renamed133 = _loc4_.shrubs_hiding_radius_min;
               _loc8_.targetingAcceleration = _loc4_.targetingAcceleration;
               _loc8_.targetingTransitionTime = _loc4_.targetingTransitionTime;
               _loc8_.Renamed134 = _loc4_.vertical_targeting_speed;
               Renamed109.putInitParams(_loc8_);
               Renamed109.objectLoaded(param1);
               _loc3_ = Renamed109;
               break;
            case "railgun":
            case "railgun_xt":
               (_loc9_ = new Renamed10()).chargingTimeMsec = _loc4_.chargingTimeMsec;
               _loc9_.weakeningCoeff = _loc4_.weakeningCoeff;
               Renamed101.putInitParams(_loc9_);
               Renamed101.objectLoaded(param1);
               _loc3_ = Renamed101;
               break;
            case "ricochet":
               (_loc10_ = new Renamed92()).energyCapacity = _loc4_.energyCapacity;
               _loc10_.energyPerShot = _loc4_.energyPerShot;
               _loc10_.energyRechargeSpeed = _loc4_.energyRechargeSpeed;
               _loc10_.maxRicochetCount = _loc4_.maxRicochetCount;
               _loc10_.shellRadius = _loc4_.shellRadius;
               _loc10_.shellSpeed = _loc4_.shellSpeed;
               _loc10_.shotDistance = _loc4_.shotDistance;
               Renamed108.putInitParams(_loc10_);
               Renamed108.objectLoaded(param1);
               _loc3_ = Renamed108;
               break;
            case "twins":
               (_loc11_ = new Renamed66()).distance = _loc4_.distance;
               _loc11_.shellRadius = _loc4_.shellRadius;
               _loc11_.speed = _loc4_.speed;
               Renamed104.putInitParams(_loc11_);
               Renamed104.objectLoaded(param1);
               _loc3_ = Renamed104;
               break;
            case "flamethrower":
               (_loc12_ = new Renamed33()).coneAngle = _loc4_.coneAngle;
               _loc12_.range = _loc4_.range;
               _loc13_ = new Renamed90(_loc4_.energyCapacity,_loc4_.energyDischargeSpeed,_loc4_.energyRechargeSpeed,_loc4_.tickIntervalMsec);
               param1.putParams(Renamed90,_loc13_);
               Renamed103.putInitParams(_loc12_);
               Renamed103.objectLoaded(param1);
               _loc3_ = Renamed103;
               break;
            case "freeze":
               (_loc14_ = new Renamed13()).damageAreaConeAngle = _loc4_.damageAreaConeAngle;
               _loc14_.damageAreaRange = _loc4_.damageAreaRange;
               _loc15_ = new Renamed90(_loc4_.energyCapacity,_loc4_.energyDischargeSpeed,_loc4_.energyRechargeSpeed,_loc4_.tickIntervalMsec);
               param1.putParams(Renamed90,_loc15_);
               Renamed107.putInitParams(_loc14_);
               Renamed107.objectLoaded(param1);
               _loc3_ = Renamed107;
               break;
            case "isida":
               (_loc16_ = new Renamed84()).capacity = _loc4_.capacity;
               _loc16_.chargeRate = _loc4_.chargeRate;
               _loc16_.checkPeriodMsec = _loc4_.checkPeriodMsec;
               _loc16_.coneAngle = _loc4_.coneAngle;
               _loc16_.dischargeDamageRate = _loc4_.dischargeDamageRate;
               _loc16_.dischargeHealingRate = _loc4_.dischargeHealingRate;
               _loc16_.dischargeIdleRate = _loc4_.dischargeIdleRate;
               _loc16_.radius = _loc4_.radius;
               Renamed105.putInitParams(_loc16_);
               Renamed105.objectLoaded(param1);
               _loc3_ = Renamed105;
               break;
            case "thunder":
               (_loc17_ = new Renamed55()).impactForce = _loc4_.impactForce;
               _loc17_.minSplashDamagePercent = _loc4_.minSplashDamagePercent;
               _loc17_.radiusOfMaxSplashDamage = _loc4_.radiusOfMaxSplashDamage;
               _loc17_.splashDamageRadius = _loc4_.splashDamageRadius;
               param1.putParams(Renamed55,_loc17_);
               _loc3_ = Renamed106;
               break;
            case "shotgun":
               (_loc18_ = new Renamed26()).coneHorizontalAngle = _loc4_.coneHorizontalAngle;
               _loc18_.coneVerticalAngle = _loc4_.coneVerticalAngle;
               _loc18_.pelletCount = _loc4_.pelletCount;
               param1.putParams(Renamed26,_loc18_);
               (_loc19_ = new Renamed125()).magazineReloadTime = _loc4_.magazineReloadTime;
               _loc19_.magazineSize = _loc4_.magazineSize;
               Renamed110.putInitParams(_loc19_);
               _loc20_ = new Renamed60();
               _loc20_.putInitParams(_loc18_);
               param1.putParams(Renamed59,_loc20_);
               param1.putParams(§implements const useRenamed35dynamic set§(modelRegistry.getModel(Long.getLong(486222912,-663069007))));
               _loc3_ = Renamed110;
               break;
            case "machinegun":
               (_loc21_ = new Renamed24()).spinDownTime = _loc4_.spinDownTime;
               _loc21_.spinUpTime = _loc4_.spinUpTime;
               _loc21_.temperatureHittingTime = _loc4_.temperatureHittingTime;
               _loc21_.weaponTurnDecelerationCoeff = _loc4_.weaponTurnDecelerationCoeff;
               _loc22_ = Renamed44(modelRegistry.getModel(Long.getLong(1635158664,1411719504)));
               _loc22_.putInitParams(_loc21_);
               _loc3_ = _loc22_;
         }
         return _loc3_;
      }
   }
}

