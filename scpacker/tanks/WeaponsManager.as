package scpacker.tanks
{
   import §+Q§.§set if§;
   import §-#^§.§false catch true§;
   import §-Q§.§do set package§;
   import §0#y§.§?"8§;
   import §4E§.§override set function§;
   import §8#@§.§final const continue§;
   import §9#o§.§switch const native§;
   import §<#&§.§7B§;
   import §>!X§.§in each§;
   import §>u§.§>"M§;
   import §>u§.§function catch dynamic§;
   import §>u§.§override var var§;
   import §]2§.§+!§;
   import §^#G§.§3#>§;
   import alternativa.object.ClientObject;
   import alternativa.osgi.OSGi;
   import alternativa.register.ClientClass;
   import alternativa.tanks.models.weapon.shaft.§=#k§;
   import alternativa.types.Long;
   import §break set catch§.§91§;
   import §case include§.§const package in§;
   import §catch catch true§.§@?§;
   import §catch catch true§.§implements const with§;
   import §class for§.§3!+§;
   import §const set catch§.§7!!§;
   import §false const case§.§0#i§;
   import §finally package else§.§;!q§;
   import flash.utils.Dictionary;
   import §if package do§.§?"0§;
   import §if package do§.§for const include§;
   import §import const class§.§dynamic set catch§;
   import §in const true§.§^!W§;
   import §in set var§.§dynamic package dynamic§;
   import platform.client.fp10.core.model.ObjectLoadListener;
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.registry.ModelRegistry;
   import platform.client.fp10.core.registry.ResourceRegistry;
   import platform.client.fp10.core.resource.types.ImageResource;
   import platform.client.fp10.core.resource.types.MultiframeImageResource;
   import platform.client.fp10.core.resource.types.SoundResource;
   import platform.client.fp10.core.type.IGameObject;
   import §use catch get§.§false each§;
   import §with for class§.§7#i§;
   
   public class WeaponsManager
   {
      public static var resourceRegistry:ResourceRegistry = OSGi.getInstance().getService(ResourceRegistry) as ResourceRegistry;
      
      public static var modelRegistry:ModelRegistry = OSGi.getInstance().getService(ModelRegistry) as ModelRegistry;
      
      public static var shotDatas:Dictionary = new Dictionary();
      
      public static var specialEntity:Dictionary = new Dictionary();
      
      private static var railgunSFXModels:Dictionary = new Dictionary();
      
      private static var smokySFXModels:Dictionary = new Dictionary();
      
      private static var flamethrowerSFXModels:Dictionary = new Dictionary();
      
      private static var twinsSFXModels:Dictionary = new Dictionary();
      
      private static var isidaSFXModels:Dictionary = new Dictionary();
      
      private static var thunderSFXModels:Dictionary = new Dictionary();
      
      private static var frezeeSFXModels:Dictionary = new Dictionary();
      
      private static var ricochetSFXModels:Dictionary = new Dictionary();
      
      private static var shaftSFXModel:Dictionary = new Dictionary();
      
      private static var §case set else§:Dictionary = new Dictionary();
      
      private static var §9I§:Dictionary = new Dictionary();
      
      private static var turretObjects:Dictionary = new Dictionary();
      
      public function WeaponsManager()
      {
         super();
      }
      
      public static function §case const function§(param1:ClientObject, param2:ClientObject, param3:Number, param4:Number, param5:Number, param6:Number) : void
      {
         var _loc7_:§for const include§ = OSGi.getInstance().getService(§?"0§) as §for const include§;
         if(_loc7_ == null)
         {
            _loc7_ = new §for const include§();
            OSGi.getInstance().registerService(§?"0§,_loc7_);
         }
         _loc7_.initObject(param2,param3,param4,param5,param6);
      }
      
      public static function §import set in§(param1:ClientObject, param2:String, param3:Object, param4:IGameObject) : void
      {
         initBCSH(param3,param4);
         initLighting(param3,param4);
         Model.object = param4;
         switch(param2.split("_")[0])
         {
            case "smoky":
               getSmokySFX(param1,param3);
               break;
            case "flamethrower":
               getFlamethrowerSFX(param1,param3);
               break;
            case "twins":
               getTwinsSFX(param1,param3);
               break;
            case "railgun":
               getRailgunSFX(param1,param3);
               break;
            case "ricochet":
               getRicochetSFXModel(param1,param3);
               break;
            case "freeze":
               getFrezeeSFXModel(param1,param3);
               break;
            case "isida":
               getIsidaSFX(param1,param3);
               break;
            case "shaft":
               getShaftSFX(param1,param3);
               break;
            case "thunder":
               getThunderSFX(param1,param3);
               break;
            case "shotgun":
               §%!e§(param1,param3);
               break;
            case "machinegun":
               §-"]§(param1,param3);
         }
         Model.popObject();
      }
      
      public static function initBCSH(param1:Object, param2:IGameObject) : void
      {
         var _loc4_:* = undefined;
         var _loc5_:§@?§ = null;
         if(param1 == null)
         {
            return;
         }
         var _loc3_:Vector.<§@?§> = new Vector.<§@?§>();
         for each(_loc4_ in param1.bcsh)
         {
            (_loc5_ = new §@?§()).brightness = _loc4_.brightness;
            _loc5_.contrast = _loc4_.contrast;
            _loc5_.hue = _loc4_.hue;
            _loc5_.key = _loc4_.key;
            _loc5_.saturation = _loc4_.saturation;
            _loc3_.push(_loc5_);
         }
         Model.object = param2;
         modelRegistry.getModel(param2.gameClass.models[3]).putInitParams(new §implements const with§(_loc3_));
         ObjectLoadListener(modelRegistry.getModel(param2.gameClass.models[3])).objectLoaded();
         Model.popObject();
      }
      
      public static function initLighting(param1:Object, param2:IGameObject) : void
      {
         var _loc4_:* = undefined;
         var _loc5_:§function catch dynamic§ = null;
         var _loc6_:* = undefined;
         var _loc7_:§override var var§ = null;
         if(param1 == null)
         {
            return;
         }
         var _loc3_:Vector.<§function catch dynamic§> = new Vector.<§function catch dynamic§>();
         for each(_loc4_ in param1.lighting)
         {
            (_loc5_ = new §function catch dynamic§()).name = _loc4_.name;
            _loc5_.§!#c§ = new Vector.<§override var var§>();
            for each(_loc6_ in _loc4_.light)
            {
               (_loc7_ = new §override var var§()).attenuationBegin = _loc6_.attenuationBegin;
               _loc7_.attenuationEnd = _loc6_.attenuationEnd;
               _loc7_.color = _loc6_.color;
               _loc7_.intensity = _loc6_.intensity;
               _loc7_.time = _loc6_.time;
               _loc5_.§!#c§.push(_loc7_);
            }
            _loc3_.push(_loc5_);
         }
         Model.object = param2;
         modelRegistry.getModel(param2.gameClass.models[4]).putInitParams(new §>"M§(_loc3_));
         Model.popObject();
      }
      
      public static function getRailgunSFX(param1:ClientObject, param2:Object = null) : §3!+§
      {
         var _loc3_:§3!+§ = null;
         var _loc4_:§false each§ = null;
         if(railgunSFXModels == null)
         {
            railgunSFXModels = new Dictionary();
         }
         if(param2 != null)
         {
            railgunSFXModels[param1.id] = new §3!+§();
            (_loc4_ = new §false each§()).chargingPart1 = ImageResource(resourceRegistry.getResource(Long.getLong(0,param2.chargingPart1)));
            _loc4_.chargingPart2 = ImageResource(resourceRegistry.getResource(Long.getLong(0,param2.chargingPart2)));
            _loc4_.chargingPart3 = ImageResource(resourceRegistry.getResource(Long.getLong(0,param2.chargingPart3)));
            _loc4_.hitMarkTexture = ImageResource(resourceRegistry.getResource(Long.getLong(0,param2.hitMarkTexture)));
            _loc4_.powTexture = MultiframeImageResource(resourceRegistry.getResource(Long.getLong(0,param2.powTexture)));
            _loc4_.ringsTexture = MultiframeImageResource(resourceRegistry.getResource(Long.getLong(0,param2.ringsTexture)));
            _loc4_.shotSound = SoundResource(resourceRegistry.getResource(Long.getLong(0,param2.shotSound)));
            _loc4_.smokeImage = ImageResource(resourceRegistry.getResource(Long.getLong(0,param2.smokeImage)));
            _loc4_.sphereTexture = MultiframeImageResource(resourceRegistry.getResource(Long.getLong(0,param2.sphereTexture)));
            _loc4_.trailImage = ImageResource(resourceRegistry.getResource(Long.getLong(0,param2.trailImage)));
            railgunSFXModels[param1.id].putInitParams(_loc4_);
            railgunSFXModels[param1.id].objectLoadedPost(param1);
         }
         return railgunSFXModels[param1.id];
      }
      
      public static function getSmokySFX(param1:ClientObject, param2:Object = null) : §override set function§
      {
         var _loc3_:§override set function§ = null;
         var _loc4_:§7!!§ = null;
         if(smokySFXModels == null)
         {
            smokySFXModels = new Dictionary();
         }
         if(param2 != null)
         {
            (_loc4_ = new §7!!§()).criticalHitSize = param2.criticalHitSize;
            _loc4_.criticalHitTexture = MultiframeImageResource(resourceRegistry.getResource(Long.getLong(0,param2.criticalHitTexture)));
            _loc4_.explosionMarkTexture = ImageResource(resourceRegistry.getResource(Long.getLong(0,param2.explosionMarkTexture)));
            _loc4_.explosionSize = param2.explosionSize;
            _loc4_.explosionSound = SoundResource(resourceRegistry.getResource(Long.getLong(0,param2.explosionSound)));
            _loc4_.explosionTexture = MultiframeImageResource(resourceRegistry.getResource(Long.getLong(0,param2.explosionTexture)));
            _loc4_.shotSound = SoundResource(resourceRegistry.getResource(Long.getLong(0,param2.shotSound)));
            _loc4_.shotTexture = ImageResource(resourceRegistry.getResource(Long.getLong(0,param2.shotTexture)));
            smokySFXModels[param1.id] = new §override set function§();
            smokySFXModels[param1.id].putInitParams(_loc4_);
            smokySFXModels[param1.id].objectLoaded(param1);
         }
         return smokySFXModels[param1.id];
      }
      
      public static function getFlamethrowerSFX(param1:ClientObject, param2:Object = null) : §dynamic package dynamic§
      {
         var _loc3_:§final const continue§ = null;
         var _loc4_:Vector.<§;!q§> = null;
         var _loc5_:* = undefined;
         var _loc6_:§;!q§ = null;
         if(flamethrowerSFXModels == null)
         {
            flamethrowerSFXModels = new Dictionary();
         }
         if(param2 != null)
         {
            flamethrowerSFXModels[param1.id] = new §dynamic package dynamic§();
            _loc3_ = new §final const continue§();
            _loc3_.fireTexture = MultiframeImageResource(resourceRegistry.getResource(Long.getLong(0,param2.fireTexture)));
            _loc3_.flameSound = SoundResource(resourceRegistry.getResource(Long.getLong(0,param2.flameSound)));
            _loc3_.muzzlePlaneTexture = MultiframeImageResource(resourceRegistry.getResource(Long.getLong(0,param2.muzzlePlaneTexture)));
            flamethrowerSFXModels[param1.id].putInitParams(_loc3_);
            flamethrowerSFXModels[param1.id].objectLoaded(param1);
            _loc4_ = new Vector.<§;!q§>();
            for each(_loc5_ in param2.colorTransform)
            {
               _loc6_ = new §;!q§(_loc5_.redMultiplier,_loc5_.greenMultiplier,_loc5_.blueMultiplier,_loc5_.alphaMultiplier,_loc5_.redOffset,_loc5_.greenOffset,_loc5_.blueOffset,_loc5_.alphaOffset,_loc5_.t);
               _loc4_.push(_loc6_);
            }
            flamethrowerSFXModels[param1.id].initColorTransform(param1,_loc4_);
         }
         return flamethrowerSFXModels[param1.id];
      }
      
      public static function getTwinsSFX(param1:ClientObject, param2:Object = null) : §^!W§
      {
         var _loc3_:§3#>§ = null;
         if(twinsSFXModels == null)
         {
            twinsSFXModels = new Dictionary();
         }
         if(param2 != null)
         {
            twinsSFXModels[param1.id] = new §^!W§();
            _loc3_ = new §3#>§();
            _loc3_.explosionTexture = MultiframeImageResource(resourceRegistry.getResource(Long.getLong(0,param2.explosionTexture)));
            _loc3_.hitMarkTexture = ImageResource(resourceRegistry.getResource(Long.getLong(0,param2.hitMarkTexture)));
            _loc3_.muzzleFlashTexture = ImageResource(resourceRegistry.getResource(Long.getLong(0,param2.muzzleFlashTexture)));
            _loc3_.shotSound = SoundResource(resourceRegistry.getResource(Long.getLong(0,param2.shotSound)));
            _loc3_.shotTexture = MultiframeImageResource(resourceRegistry.getResource(Long.getLong(0,param2.shotTexture)));
            twinsSFXModels[param1.id].putInitParams(_loc3_);
            twinsSFXModels[param1.id].objectLoadedPost(param1);
         }
         return twinsSFXModels[param1.id];
      }
      
      public static function getIsidaSFX(param1:ClientObject, param2:Object = null) : §const package in§
      {
         var _loc3_:§7B§ = null;
         if(isidaSFXModels == null)
         {
            isidaSFXModels = new Dictionary();
         }
         if(param2 != null)
         {
            isidaSFXModels[param1.id] = new §const package in§();
            _loc3_ = new §7B§();
            _loc3_.damagingBall = MultiframeImageResource(resourceRegistry.getResource(Long.getLong(0,param2.damagingBall)));
            _loc3_.damagingRay = ImageResource(resourceRegistry.getResource(Long.getLong(0,param2.damagingRay)));
            _loc3_.damagingSound = SoundResource(resourceRegistry.getResource(Long.getLong(0,param2.damagingSound)));
            _loc3_.healingBall = MultiframeImageResource(resourceRegistry.getResource(Long.getLong(0,param2.healingBall)));
            _loc3_.healingRay = ImageResource(resourceRegistry.getResource(Long.getLong(0,param2.healingRay)));
            _loc3_.healingSound = SoundResource(resourceRegistry.getResource(Long.getLong(0,param2.healingSound)));
            _loc3_.idleSound = SoundResource(resourceRegistry.getResource(Long.getLong(0,param2.idleSound)));
            isidaSFXModels[param1.id].putInitParams(_loc3_);
            isidaSFXModels[param1.id].objectLoadedPost(param1);
         }
         return isidaSFXModels[param1.id];
      }
      
      public static function getThunderSFX(param1:ClientObject, param2:Object = null) : §set if§
      {
         var _loc3_:§in each§ = null;
         if(thunderSFXModels == null)
         {
            thunderSFXModels = new Dictionary();
         }
         if(param2 != null)
         {
            thunderSFXModels[param1.id] = new §set if§();
            _loc3_ = new §in each§();
            _loc3_.explosionMarkTexture = ImageResource(resourceRegistry.getResource(Long.getLong(0,param2.explosionMarkTexture)));
            _loc3_.explosionSize = param2.explosionSize;
            _loc3_.explosionSound = SoundResource(resourceRegistry.getResource(Long.getLong(0,param2.explosionSound)));
            _loc3_.explosionTexture = MultiframeImageResource(resourceRegistry.getResource(Long.getLong(0,param2.explosionTexture)));
            _loc3_.shotSound = SoundResource(resourceRegistry.getResource(Long.getLong(0,param2.shotSound)));
            _loc3_.shotTexture = ImageResource(resourceRegistry.getResource(Long.getLong(0,param2.shotTexture)));
            thunderSFXModels[param1.id].putInitParams(_loc3_);
            thunderSFXModels[param1.id].objectLoaded(param1);
         }
         return thunderSFXModels[param1.id];
      }
      
      public static function getFrezeeSFXModel(param1:ClientObject, param2:Object = null) : §91§
      {
         var _loc3_:§false catch true§ = null;
         if(frezeeSFXModels == null)
         {
            frezeeSFXModels = new Dictionary();
         }
         if(param2 != null)
         {
            frezeeSFXModels[param1.id] = new §91§();
            _loc3_ = new §false catch true§();
            _loc3_.particleSpeed = param2.particleSpeed;
            _loc3_.particleTextureResource = MultiframeImageResource(resourceRegistry.getResource(Long.getLong(0,param2.particleTextureResource)));
            _loc3_.planeTextureResource = MultiframeImageResource(resourceRegistry.getResource(Long.getLong(0,param2.planeTextureResource)));
            _loc3_.shotSoundResource = SoundResource(resourceRegistry.getResource(Long.getLong(0,param2.shotSoundResource)));
            frezeeSFXModels[param1.id].putInitParams(_loc3_);
            frezeeSFXModels[param1.id].objectLoaded(param1);
         }
         return frezeeSFXModels[param1.id];
      }
      
      public static function getRicochetSFXModel(param1:ClientObject, param2:Object = null) : §0#i§
      {
         var _loc3_:§0#i§ = null;
         var _loc4_:§dynamic set catch§ = null;
         if(ricochetSFXModels == null)
         {
            ricochetSFXModels = new Dictionary();
         }
         if(param2 != null)
         {
            ricochetSFXModels[param1.id] = new §0#i§();
            (_loc4_ = new §dynamic set catch§()).bumpFlashTexture = MultiframeImageResource(resourceRegistry.getResource(Long.getLong(0,param2.bumpFlashTexture)));
            _loc4_.explosionTexture = MultiframeImageResource(resourceRegistry.getResource(Long.getLong(0,param2.explosionTexture)));
            _loc4_.§4"M§ = SoundResource(resourceRegistry.getResource(Long.getLong(0,param2.explosionSound)));
            _loc4_.ricochetSound = SoundResource(resourceRegistry.getResource(Long.getLong(0,param2.ricochetSound)));
            _loc4_.shotFlashTexture = ImageResource(resourceRegistry.getResource(Long.getLong(0,param2.shotFlashTexture)));
            _loc4_.shotSound = SoundResource(resourceRegistry.getResource(Long.getLong(0,param2.shotSound)));
            _loc4_.shotTexture = MultiframeImageResource(resourceRegistry.getResource(Long.getLong(0,param2.shotTexture)));
            _loc4_.tailTrailTexutre = ImageResource(resourceRegistry.getResource(Long.getLong(0,param2.tailTrailTexutre)));
            ricochetSFXModels[param1.id].putInitParams(_loc4_);
            ricochetSFXModels[param1.id].objectLoadedPost(param1);
         }
         return ricochetSFXModels[param1.id];
      }
      
      public static function getShaftSFX(param1:ClientObject, param2:Object = null) : §=#k§
      {
         var _loc3_:§=#k§ = null;
         var _loc4_:§do set package§ = null;
         if(shaftSFXModel == null)
         {
            shaftSFXModel = new Dictionary();
         }
         if(param2 != null)
         {
            shaftSFXModel[param1.id] = new §=#k§();
            (_loc4_ = new §do set package§()).explosionSound = SoundResource(resourceRegistry.getResource(Long.getLong(0,param2.explosionSound)));
            _loc4_.explosionTexture = MultiframeImageResource(resourceRegistry.getResource(Long.getLong(0,param2.explosionTexture)));
            _loc4_.hitMarkTexture = ImageResource(resourceRegistry.getResource(Long.getLong(0,param2.hitMarkTexture)));
            _loc4_.muzzleFlashTexture = MultiframeImageResource(resourceRegistry.getResource(Long.getLong(0,param2.muzzleFlashTexture)));
            _loc4_.shotSound = SoundResource(resourceRegistry.getResource(Long.getLong(0,param2.shotSound)));
            _loc4_.targetingSound = SoundResource(resourceRegistry.getResource(Long.getLong(0,param2.targetingSound)));
            _loc4_.trailTexture = ImageResource(resourceRegistry.getResource(Long.getLong(0,param2.trailTexture)));
            _loc4_.zoomModeSound = SoundResource(resourceRegistry.getResource(Long.getLong(0,param2.zoomModeSound)));
            shaftSFXModel[param1.id].putInitParams(_loc4_);
            shaftSFXModel[param1.id].objectLoadedPost(param1);
         }
         return shaftSFXModel[param1.id];
      }
      
      public static function §%!e§(param1:ClientObject, param2:Object = null) : §?"8§
      {
         var _loc3_:§?"8§ = null;
         var _loc4_:§switch const native§ = null;
         if(§case set else§ == null)
         {
            §case set else§ = new Dictionary();
         }
         if(param2 != null)
         {
            §case set else§[param1.id] = new §?"8§();
            (_loc4_ = new §switch const native§()).§with for set§ = new Vector.<ImageResource>();
            _loc4_.§with for set§.push(ImageResource(resourceRegistry.getResource(Long.getLong(0,param2.explosionMarkTexture0))));
            _loc4_.§with for set§.push(ImageResource(resourceRegistry.getResource(Long.getLong(0,param2.explosionMarkTexture1))));
            _loc4_.§with for set§.push(ImageResource(resourceRegistry.getResource(Long.getLong(0,param2.explosionMarkTexture2))));
            _loc4_.§with for set§.push(ImageResource(resourceRegistry.getResource(Long.getLong(0,param2.explosionMarkTexture3))));
            _loc4_.magazineReloadSound = SoundResource(resourceRegistry.getResource(Long.getLong(0,param2.magazineReloadSound)));
            _loc4_.pelletTrailTexture = ImageResource(resourceRegistry.getResource(Long.getLong(0,param2.pelletTrailTexture)));
            _loc4_.reloadSound = SoundResource(resourceRegistry.getResource(Long.getLong(0,param2.reloadSound)));
            _loc4_.shotAcrossTexture = MultiframeImageResource(resourceRegistry.getResource(Long.getLong(0,param2.shotAcrossTexture)));
            _loc4_.shotAlongTexture = MultiframeImageResource(resourceRegistry.getResource(Long.getLong(0,param2.shotAlongTexture)));
            _loc4_.shotSound = SoundResource(resourceRegistry.getResource(Long.getLong(0,param2.shotSound)));
            _loc4_.smokeTexture = MultiframeImageResource(resourceRegistry.getResource(Long.getLong(0,param2.smokeTexture)));
            _loc4_.sparkleTexture = ImageResource(resourceRegistry.getResource(Long.getLong(0,param2.sparkleTexture)));
            §case set else§[param1.id].putInitParams(_loc4_);
            §case set else§[param1.id].objectLoadedPost(param1);
         }
         return §case set else§[param1.id];
      }
      
      public static function §-"]§(param1:ClientObject, param2:Object = null) : §7#i§
      {
         var _loc3_:§7#i§ = null;
         var _loc4_:§+!§ = null;
         if(§9I§ == null)
         {
            §9I§ = new Dictionary();
         }
         if(param2 != null)
         {
            §9I§[param1.id] = new §7#i§();
            (_loc4_ = new §+!§()).chainStartSound = SoundResource(resourceRegistry.getResource(Long.getLong(0,param2.chainStartSound)));
            _loc4_.crumbsTexture = ImageResource(resourceRegistry.getResource(Long.getLong(0,param2.crumbsTexture)));
            _loc4_.dustTexture = MultiframeImageResource(resourceRegistry.getResource(Long.getLong(0,param2.dustTexture)));
            _loc4_.fireAcrossTexture = MultiframeImageResource(resourceRegistry.getResource(Long.getLong(0,param2.fireAcrossTexture)));
            _loc4_.fireAlongTexture = MultiframeImageResource(resourceRegistry.getResource(Long.getLong(0,param2.fireAlongTexture)));
            _loc4_.hitSound = SoundResource(resourceRegistry.getResource(Long.getLong(0,param2.hitSound)));
            _loc4_.longFailSound = SoundResource(resourceRegistry.getResource(Long.getLong(0,param2.longFailSound)));
            _loc4_.shootEndSound = SoundResource(resourceRegistry.getResource(Long.getLong(0,param2.shootEndSound)));
            _loc4_.shootSound = SoundResource(resourceRegistry.getResource(Long.getLong(0,param2.shootSound)));
            _loc4_.smokeTexture = MultiframeImageResource(resourceRegistry.getResource(Long.getLong(0,param2.smokeTexture)));
            _loc4_.sparklesTexture = MultiframeImageResource(resourceRegistry.getResource(Long.getLong(0,param2.sparklesTexture)));
            _loc4_.tankHitSound = SoundResource(resourceRegistry.getResource(Long.getLong(0,param2.tankHitSound)));
            _loc4_.tankSparklesTexture = MultiframeImageResource(resourceRegistry.getResource(Long.getLong(0,param2.tankSparklesTexture)));
            _loc4_.tracerTexture = ImageResource(resourceRegistry.getResource(Long.getLong(0,param2.tracerTexture)));
            _loc4_.turbineStartSound = SoundResource(resourceRegistry.getResource(Long.getLong(0,param2.turbineStartSound)));
            §9I§[param1.id].putInitParams(_loc4_);
            §9I§[param1.id].objectLoadedPost(param1);
         }
         return §9I§[param1.id];
      }
      
      public static function getObjectFor(param1:String) : ClientObject
      {
         if(turretObjects[param1] == null)
         {
            turretObjects[param1] = initObject(param1);
         }
         return turretObjects[param1];
      }
      
      public static function clearSFXModel(param1:ClientObject) : void
      {
         if(param1 == null)
         {
            return;
         }
         if(shaftSFXModel != null)
         {
            if(shaftSFXModel[param1.id] != null)
            {
               shaftSFXModel[param1.id].objectUnloaded(param1);
               delete shaftSFXModel[param1.id];
            }
         }
         if(thunderSFXModels != null)
         {
            if(thunderSFXModels[param1.id] != null)
            {
               thunderSFXModels[param1.id].objectUnloaded(param1);
               delete thunderSFXModels[param1.id];
            }
         }
         if(ricochetSFXModels != null)
         {
            if(ricochetSFXModels[param1.id] != null)
            {
               ricochetSFXModels[param1.id].objectUnloaded(param1);
               delete ricochetSFXModels[param1.id];
            }
         }
         if(frezeeSFXModels != null)
         {
            if(frezeeSFXModels[param1.id] != null)
            {
               frezeeSFXModels[param1.id].objectUnloaded(param1);
               delete frezeeSFXModels[param1.id];
            }
         }
         if(isidaSFXModels != null)
         {
            if(isidaSFXModels[param1.id] != null)
            {
               isidaSFXModels[param1.id].objectUnloaded(param1);
               delete isidaSFXModels[param1.id];
            }
         }
         if(twinsSFXModels != null)
         {
            if(twinsSFXModels[param1.id] != null)
            {
               twinsSFXModels[param1.id].objectUnloaded(param1);
               delete twinsSFXModels[param1.id];
            }
         }
         if(flamethrowerSFXModels != null)
         {
            if(flamethrowerSFXModels[param1.id] != null)
            {
               flamethrowerSFXModels[param1.id].objectUnloaded(param1);
               delete flamethrowerSFXModels[param1.id];
            }
         }
         if(smokySFXModels != null)
         {
            if(smokySFXModels[param1.id] != null)
            {
               smokySFXModels[param1.id].objectUnloaded(param1);
               delete smokySFXModels[param1.id];
            }
         }
         if(railgunSFXModels != null)
         {
            if(railgunSFXModels[param1.id] != null)
            {
               railgunSFXModels[param1.id].objectUnloaded(param1);
               delete railgunSFXModels[param1.id];
            }
         }
         if(§case set else§ != null)
         {
            if(§case set else§[param1.id] != null)
            {
               §case set else§[param1.id].objectUnloaded(param1);
               delete §case set else§[param1.id];
            }
         }
         if(§9I§ != null)
         {
            if(§9I§[param1.id] != null)
            {
               §9I§[param1.id].objectUnloaded(param1);
               delete §9I§[param1.id];
            }
         }
      }
      
      private static function initObject(param1:String) : ClientObject
      {
         return new ClientObject(param1,new ClientClass(param1,null,param1,null),param1,null);
      }
      
      public static function destroy() : void
      {
         isidaSFXModels = null;
         twinsSFXModels = null;
         flamethrowerSFXModels = null;
         smokySFXModels = null;
         railgunSFXModels = null;
         thunderSFXModels = null;
         ricochetSFXModels = null;
         frezeeSFXModels = null;
         shaftSFXModel = null;
         §case set else§ = null;
      }
   }
}

