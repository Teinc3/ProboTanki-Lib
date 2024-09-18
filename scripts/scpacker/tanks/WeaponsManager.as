package scpacker.tanks
{
   import Renamed19.Renamed4571;
   import Renamed217.Renamed6255;
   import Renamed219.Renamed3251;
   import Renamed226.Renamed4583;
   import Renamed250.Renamed4593;
   import Renamed273.Renamed7105;
   import Renamed285.Renamed6437;
   import Renamed5317.Renamed5321;
   import Renamed5511.Renamed5515;
   import Renamed4622.Renamed5630;
   import Renamed4622.Renamed5632;
   import Renamed4622.Renamed5636;
   import Renamed482.Renamed9244;
   import Renamed491.Renamed9631;
   import alternativa.object.ClientObject;
   import alternativa.osgi.OSGi;
   import alternativa.register.ClientClass;
   import alternativa.tanks.models.weapon.shaft.Renamed3257;
   import alternativa.types.Long;
   import Renamed48.Renamed4655;
   import Renamed50.Renamed4656;
   import Renamed320.Renamed6647;
   import Renamed320.Renamed7704;
   import Renamed56.Renamed4659;
   import Renamed337.Renamed6728;
   import Renamed63.Renamed4669;
   import Renamed366.Renamed3387;
   import flash.utils.Dictionary;
   import Renamed381.Renamed2768;
   import Renamed381.Renamed577;
   import Renamed391.Renamed8434;
   import Renamed70.Renamed4687;
   import Renamed72.Renamed4695;
   import platform.client.fp10.core.model.ObjectLoadListener;
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.registry.ModelRegistry;
   import platform.client.fp10.core.registry.ResourceRegistry;
   import platform.client.fp10.core.resource.types.ImageResource;
   import platform.client.fp10.core.resource.types.MultiframeImageResource;
   import platform.client.fp10.core.resource.types.SoundResource;
   import platform.client.fp10.core.type.IGameObject;
   import Renamed449.Renamed8996;
   import Renamed462.Renamed4721;
   
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
      
      private static var Renamed10775:Dictionary = new Dictionary();
      
      private static var Renamed10776:Dictionary = new Dictionary();
      
      private static var turretObjects:Dictionary = new Dictionary();
      
      public function WeaponsManager()
      {
         super();
      }
      
      public static function Renamed2870(param1:ClientObject, param2:ClientObject, param3:Number, param4:Number, param5:Number, param6:Number) : void
      {
         var _loc7_:Renamed577 = OSGi.getInstance().getService(Renamed2768) as Renamed577;
         if(_loc7_ == null)
         {
            _loc7_ = new Renamed577();
            OSGi.getInstance().registerService(Renamed2768,_loc7_);
         }
         _loc7_.initObject(param2,param3,param4,param5,param6);
      }
      
      public static function CodecRegisterer8(param1:ClientObject, param2:String, param3:Object, param4:IGameObject) : void
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
               Renamed3439(param1,param3);
               break;
            case "machinegun":
               Renamed3127(param1,param3);
         }
         Model.popObject();
      }
      
      public static function initBCSH(param1:Object, param2:IGameObject) : void
      {
         var _loc4_:* = undefined;
         var _loc5_:Renamed6647 = null;
         if(param1 == null)
         {
            return;
         }
         var _loc3_:Vector.<Renamed6647> = new Vector.<Renamed6647>();
         for each(_loc4_ in param1.bcsh)
         {
            (_loc5_ = new Renamed6647()).brightness = _loc4_.brightness;
            _loc5_.contrast = _loc4_.contrast;
            _loc5_.hue = _loc4_.hue;
            _loc5_.key = _loc4_.key;
            _loc5_.saturation = _loc4_.saturation;
            _loc3_.push(_loc5_);
         }
         Model.object = param2;
         modelRegistry.getModel(param2.gameClass.models[3]).putInitParams(new Renamed7704(_loc3_));
         ObjectLoadListener(modelRegistry.getModel(param2.gameClass.models[3])).objectLoaded();
         Model.popObject();
      }
      
      public static function initLighting(param1:Object, param2:IGameObject) : void
      {
         var _loc4_:* = undefined;
         var _loc5_:Renamed5632 = null;
         var _loc6_:* = undefined;
         var _loc7_:Renamed5636 = null;
         if(param1 == null)
         {
            return;
         }
         var _loc3_:Vector.<Renamed5632> = new Vector.<Renamed5632>();
         for each(_loc4_ in param1.lighting)
         {
            (_loc5_ = new Renamed5632()).name = _loc4_.name;
            _loc5_.Renamed5637 = new Vector.<Renamed5636>();
            for each(_loc6_ in _loc4_.light)
            {
               (_loc7_ = new Renamed5636()).attenuationBegin = _loc6_.attenuationBegin;
               _loc7_.attenuationEnd = _loc6_.attenuationEnd;
               _loc7_.color = _loc6_.color;
               _loc7_.intensity = _loc6_.intensity;
               _loc7_.time = _loc6_.time;
               _loc5_.Renamed5637.push(_loc7_);
            }
            _loc3_.push(_loc5_);
         }
         Model.object = param2;
         modelRegistry.getModel(param2.gameClass.models[4]).putInitParams(new Renamed5630(_loc3_));
         Model.popObject();
      }
      
      public static function getRailgunSFX(param1:ClientObject, param2:Object = null) : Renamed4659
      {
         var _loc3_:Renamed4659 = null;
         var _loc4_:Renamed8996 = null;
         if(railgunSFXModels == null)
         {
            railgunSFXModels = new Dictionary();
         }
         if(param2 != null)
         {
            railgunSFXModels[param1.id] = new Renamed4659();
            (_loc4_ = new Renamed8996()).chargingPart1 = ImageResource(resourceRegistry.getResource(Long.getLong(0,param2.chargingPart1)));
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
      
      public static function getSmokySFX(param1:ClientObject, param2:Object = null) : Renamed4593
      {
         var _loc3_:Renamed4593 = null;
         var _loc4_:Renamed6728 = null;
         if(smokySFXModels == null)
         {
            smokySFXModels = new Dictionary();
         }
         if(param2 != null)
         {
            (_loc4_ = new Renamed6728()).criticalHitSize = param2.criticalHitSize;
            _loc4_.criticalHitTexture = MultiframeImageResource(resourceRegistry.getResource(Long.getLong(0,param2.criticalHitTexture)));
            _loc4_.explosionMarkTexture = ImageResource(resourceRegistry.getResource(Long.getLong(0,param2.explosionMarkTexture)));
            _loc4_.explosionSize = param2.explosionSize;
            _loc4_.explosionSound = SoundResource(resourceRegistry.getResource(Long.getLong(0,param2.explosionSound)));
            _loc4_.explosionTexture = MultiframeImageResource(resourceRegistry.getResource(Long.getLong(0,param2.explosionTexture)));
            _loc4_.shotSound = SoundResource(resourceRegistry.getResource(Long.getLong(0,param2.shotSound)));
            _loc4_.shotTexture = ImageResource(resourceRegistry.getResource(Long.getLong(0,param2.shotTexture)));
            smokySFXModels[param1.id] = new Renamed4593();
            smokySFXModels[param1.id].putInitParams(_loc4_);
            smokySFXModels[param1.id].objectLoaded(param1);
         }
         return smokySFXModels[param1.id];
      }
      
      public static function getFlamethrowerSFX(param1:ClientObject, param2:Object = null) : Renamed4695
      {
         var _loc3_:Renamed7105 = null;
         var _loc4_:Vector.<Renamed3387> = null;
         var _loc5_:* = undefined;
         var _loc6_:Renamed3387 = null;
         if(flamethrowerSFXModels == null)
         {
            flamethrowerSFXModels = new Dictionary();
         }
         if(param2 != null)
         {
            flamethrowerSFXModels[param1.id] = new Renamed4695();
            _loc3_ = new Renamed7105();
            _loc3_.fireTexture = MultiframeImageResource(resourceRegistry.getResource(Long.getLong(0,param2.fireTexture)));
            _loc3_.flameSound = SoundResource(resourceRegistry.getResource(Long.getLong(0,param2.flameSound)));
            _loc3_.muzzlePlaneTexture = MultiframeImageResource(resourceRegistry.getResource(Long.getLong(0,param2.muzzlePlaneTexture)));
            flamethrowerSFXModels[param1.id].putInitParams(_loc3_);
            flamethrowerSFXModels[param1.id].objectLoaded(param1);
            _loc4_ = new Vector.<Renamed3387>();
            for each(_loc5_ in param2.colorTransform)
            {
               _loc6_ = new Renamed3387(_loc5_.redMultiplier,_loc5_.greenMultiplier,_loc5_.blueMultiplier,_loc5_.alphaMultiplier,_loc5_.redOffset,_loc5_.greenOffset,_loc5_.blueOffset,_loc5_.alphaOffset,_loc5_.t);
               _loc4_.push(_loc6_);
            }
            flamethrowerSFXModels[param1.id].initColorTransform(param1,_loc4_);
         }
         return flamethrowerSFXModels[param1.id];
      }
      
      public static function getTwinsSFX(param1:ClientObject, param2:Object = null) : Renamed4687
      {
         var _loc3_:Renamed9631 = null;
         if(twinsSFXModels == null)
         {
            twinsSFXModels = new Dictionary();
         }
         if(param2 != null)
         {
            twinsSFXModels[param1.id] = new Renamed4687();
            _loc3_ = new Renamed9631();
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
      
      public static function getIsidaSFX(param1:ClientObject, param2:Object = null) : Renamed4656
      {
         var _loc3_:Renamed5321 = null;
         if(isidaSFXModels == null)
         {
            isidaSFXModels = new Dictionary();
         }
         if(param2 != null)
         {
            isidaSFXModels[param1.id] = new Renamed4656();
            _loc3_ = new Renamed5321();
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
      
      public static function getThunderSFX(param1:ClientObject, param2:Object = null) : Renamed4571
      {
         var _loc3_:Renamed5515 = null;
         if(thunderSFXModels == null)
         {
            thunderSFXModels = new Dictionary();
         }
         if(param2 != null)
         {
            thunderSFXModels[param1.id] = new Renamed4571();
            _loc3_ = new Renamed5515();
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
      
      public static function getFrezeeSFXModel(param1:ClientObject, param2:Object = null) : Renamed4655
      {
         var _loc3_:Renamed6255 = null;
         if(frezeeSFXModels == null)
         {
            frezeeSFXModels = new Dictionary();
         }
         if(param2 != null)
         {
            frezeeSFXModels[param1.id] = new Renamed4655();
            _loc3_ = new Renamed6255();
            _loc3_.particleSpeed = param2.particleSpeed;
            _loc3_.particleTextureResource = MultiframeImageResource(resourceRegistry.getResource(Long.getLong(0,param2.particleTextureResource)));
            _loc3_.planeTextureResource = MultiframeImageResource(resourceRegistry.getResource(Long.getLong(0,param2.planeTextureResource)));
            _loc3_.shotSoundResource = SoundResource(resourceRegistry.getResource(Long.getLong(0,param2.shotSoundResource)));
            frezeeSFXModels[param1.id].putInitParams(_loc3_);
            frezeeSFXModels[param1.id].objectLoaded(param1);
         }
         return frezeeSFXModels[param1.id];
      }
      
      public static function getRicochetSFXModel(param1:ClientObject, param2:Object = null) : Renamed4669
      {
         var _loc3_:Renamed4669 = null;
         var _loc4_:Renamed8434 = null;
         if(ricochetSFXModels == null)
         {
            ricochetSFXModels = new Dictionary();
         }
         if(param2 != null)
         {
            ricochetSFXModels[param1.id] = new Renamed4669();
            (_loc4_ = new Renamed8434()).bumpFlashTexture = MultiframeImageResource(resourceRegistry.getResource(Long.getLong(0,param2.bumpFlashTexture)));
            _loc4_.explosionTexture = MultiframeImageResource(resourceRegistry.getResource(Long.getLong(0,param2.explosionTexture)));
            _loc4_.Renamed8440 = SoundResource(resourceRegistry.getResource(Long.getLong(0,param2.explosionSound)));
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
      
      public static function getShaftSFX(param1:ClientObject, param2:Object = null) : Renamed3257
      {
         var _loc3_:Renamed3257 = null;
         var _loc4_:Renamed3251 = null;
         if(shaftSFXModel == null)
         {
            shaftSFXModel = new Dictionary();
         }
         if(param2 != null)
         {
            shaftSFXModel[param1.id] = new Renamed3257();
            (_loc4_ = new Renamed3251()).explosionSound = SoundResource(resourceRegistry.getResource(Long.getLong(0,param2.explosionSound)));
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
      
      public static function Renamed3439(param1:ClientObject, param2:Object = null) : Renamed4583
      {
         var _loc3_:Renamed4583 = null;
         var _loc4_:Renamed6437 = null;
         if(Renamed10775 == null)
         {
            Renamed10775 = new Dictionary();
         }
         if(param2 != null)
         {
            Renamed10775[param1.id] = new Renamed4583();
            (_loc4_ = new Renamed6437()).Renamed6440 = new Vector.<ImageResource>();
            _loc4_.Renamed6440.push(ImageResource(resourceRegistry.getResource(Long.getLong(0,param2.explosionMarkTexture0))));
            _loc4_.Renamed6440.push(ImageResource(resourceRegistry.getResource(Long.getLong(0,param2.explosionMarkTexture1))));
            _loc4_.Renamed6440.push(ImageResource(resourceRegistry.getResource(Long.getLong(0,param2.explosionMarkTexture2))));
            _loc4_.Renamed6440.push(ImageResource(resourceRegistry.getResource(Long.getLong(0,param2.explosionMarkTexture3))));
            _loc4_.magazineReloadSound = SoundResource(resourceRegistry.getResource(Long.getLong(0,param2.magazineReloadSound)));
            _loc4_.pelletTrailTexture = ImageResource(resourceRegistry.getResource(Long.getLong(0,param2.pelletTrailTexture)));
            _loc4_.reloadSound = SoundResource(resourceRegistry.getResource(Long.getLong(0,param2.reloadSound)));
            _loc4_.shotAcrossTexture = MultiframeImageResource(resourceRegistry.getResource(Long.getLong(0,param2.shotAcrossTexture)));
            _loc4_.shotAlongTexture = MultiframeImageResource(resourceRegistry.getResource(Long.getLong(0,param2.shotAlongTexture)));
            _loc4_.shotSound = SoundResource(resourceRegistry.getResource(Long.getLong(0,param2.shotSound)));
            _loc4_.smokeTexture = MultiframeImageResource(resourceRegistry.getResource(Long.getLong(0,param2.smokeTexture)));
            _loc4_.sparkleTexture = ImageResource(resourceRegistry.getResource(Long.getLong(0,param2.sparkleTexture)));
            Renamed10775[param1.id].putInitParams(_loc4_);
            Renamed10775[param1.id].objectLoadedPost(param1);
         }
         return Renamed10775[param1.id];
      }
      
      public static function Renamed3127(param1:ClientObject, param2:Object = null) : Renamed4721
      {
         var _loc3_:Renamed4721 = null;
         var _loc4_:Renamed9244 = null;
         if(Renamed10776 == null)
         {
            Renamed10776 = new Dictionary();
         }
         if(param2 != null)
         {
            Renamed10776[param1.id] = new Renamed4721();
            (_loc4_ = new Renamed9244()).chainStartSound = SoundResource(resourceRegistry.getResource(Long.getLong(0,param2.chainStartSound)));
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
            Renamed10776[param1.id].putInitParams(_loc4_);
            Renamed10776[param1.id].objectLoadedPost(param1);
         }
         return Renamed10776[param1.id];
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
         if(Renamed10775 != null)
         {
            if(Renamed10775[param1.id] != null)
            {
               Renamed10775[param1.id].objectUnloaded(param1);
               delete Renamed10775[param1.id];
            }
         }
         if(Renamed10776 != null)
         {
            if(Renamed10776[param1.id] != null)
            {
               Renamed10776[param1.id].objectUnloaded(param1);
               delete Renamed10776[param1.id];
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
         Renamed10775 = null;
      }
   }
}

