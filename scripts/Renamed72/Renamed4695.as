package Renamed72
{
   import Renamed259.Renamed3255;
   import Renamed273.Renamed7102;
   import Renamed273.Renamed7105;
   import Renamed273.Renamed7109;
   import alternativa.object.ClientObject;
   import alternativa.tanks.battle.BattleService;
   import alternativa.tanks.engine3d.EffectsMaterialRegistry;
   import alternativa.tanks.engine3d.Renamed843;
   import alternativa.tanks.utils.GraphicsUtils;
   import Renamed366.Renamed3387;
   import Renamed384.Renamed8354;
   import platform.client.fp10.core.resource.types.MultiframeImageResource;
   import Renamed89.Renamed9469;
   
   public class Renamed4695 extends Renamed7109 implements Renamed7102, Renamed10255
   {
      [Inject]
      public static var Renamed1368:EffectsMaterialRegistry;
      
      [Inject]
      public static var battleService:BattleService;
      
      public function Renamed4695()
      {
         super();
      }
      
      private static function Renamed9491(param1:MultiframeImageResource) : Renamed843
      {
         var _loc2_:Renamed843 = GraphicsUtils.getTextureAnimationFromResource(Renamed1368,param1);
         _loc2_.material.resolution = Renamed10258.Renamed9484 / param1.frameWidth;
         return _loc2_;
      }
      
      private static function Renamed9493(param1:MultiframeImageResource) : Renamed843
      {
         var _loc2_:Renamed843 = GraphicsUtils.getTextureAnimationFromResource(Renamed1368,param1);
         _loc2_.material.resolution = Renamed10258.Renamed3501 / param1.frameWidth;
         return _loc2_;
      }
      
      public function initColorTransform(param1:ClientObject, param2:Vector.<Renamed3387>) : void
      {
         var _loc3_:Renamed9469 = Renamed9469(param1.getParams(Renamed9469));
         _loc3_.Renamed10262 = param2;
      }
      
      [Obfuscation(rename="false")]
      public function objectLoaded(param1:ClientObject) : void
      {
         var _loc2_:Renamed7105 = getInitParam();
         var _loc3_:Renamed9469 = new Renamed9469();
         _loc3_.Renamed9490 = Renamed9491(_loc2_.fireTexture);
         _loc3_.Renamed9492 = Renamed9493(_loc2_.muzzlePlaneTexture);
         _loc3_.Renamed9487 = _loc2_.flameSound.sound;
         _loc3_.particleSpeed = Renamed10258.Renamed9482;
         var _loc4_:Renamed3255 = Renamed3255(object.adapt(Renamed3255));
         _loc3_.Renamed9476 = _loc4_.Renamed3262("start");
         _loc3_.Renamed9477 = _loc4_.Renamed3262("loop");
         _loc3_.Renamed9480 = _loc4_.Renamed3262("startFire");
         _loc3_.Renamed9481 = _loc4_.Renamed3262("loopFire");
         param1.putParams(Renamed9469,_loc3_);
      }
      
      [Obfuscation(rename="false")]
      public function objectUnloaded(param1:ClientObject) : void
      {
         var _loc2_:Renamed9469 = Renamed9469(param1.getParams(Renamed9469));
         Renamed1368.releaseMaterial(_loc2_.Renamed9490.material);
         Renamed1368.releaseMaterial(_loc2_.Renamed9492.material);
      }
      
      public function Renamed10256(param1:Number, param2:Number, param3:ClientObject) : Renamed8354
      {
         var _loc4_:Renamed9469 = Renamed9469(param3.getParams(Renamed9469));
         return new Renamed4694(battleService.Renamed618(),param1,param2,_loc4_);
      }
   }
}

