package Renamed48
{
   import Renamed217.Renamed6252;
   import Renamed217.Renamed6253;
   import Renamed217.Renamed6255;
   import Renamed259.Renamed3255;
   import alternativa.object.ClientObject;
   import alternativa.tanks.battle.Renamed668;
   import alternativa.tanks.battle.BattleService;
   import alternativa.tanks.engine3d.EffectsMaterialRegistry;
   import alternativa.tanks.engine3d.Renamed843;
   import alternativa.tanks.utils.GraphicsUtils;
   import Renamed384.Renamed8354;
   import platform.client.fp10.core.resource.types.MultiframeImageResource;
   import Renamed89.Renamed9469;
   
   public class Renamed4655 extends Renamed6253 implements Renamed6252, Renamed9489
   {
      [Inject]
      public static var battleService:BattleService;
      
      [Inject]
      public static var Renamed1368:EffectsMaterialRegistry;
      
      public function Renamed4655()
      {
         super();
      }
      
      [Obfuscation(rename="false")]
      public function objectLoaded(param1:ClientObject) : void
      {
         var _loc2_:Renamed6255 = getInitParam();
         var _loc3_:Renamed9469 = new Renamed9469();
         _loc3_.Renamed9490 = this.Renamed9491(_loc2_.particleTextureResource);
         _loc3_.Renamed9492 = this.Renamed9493(_loc2_.planeTextureResource);
         _loc3_.particleSpeed = Renamed668.Renamed674(_loc2_.particleSpeed);
         _loc3_.Renamed9487 = _loc2_.shotSoundResource.sound;
         var _loc4_:Renamed3255 = Renamed3255(object.adapt(Renamed3255));
         _loc3_.Renamed9476 = _loc4_.Renamed3262("start");
         _loc3_.Renamed9477 = _loc4_.Renamed3262("loop");
         _loc3_.Renamed9480 = _loc4_.Renamed3262("startFire");
         _loc3_.Renamed9481 = _loc4_.Renamed3262("loopFire");
         param1.putParams(Renamed9469,_loc3_);
      }
      
      private function Renamed9491(param1:MultiframeImageResource) : Renamed843
      {
         var _loc2_:Renamed843 = GraphicsUtils.getTextureAnimationFromResource(Renamed1368,param1);
         _loc2_.material.resolution = Renamed9478.Renamed9484 / param1.frameWidth;
         return _loc2_;
      }
      
      private function Renamed9493(param1:MultiframeImageResource) : Renamed843
      {
         var _loc2_:Renamed843 = GraphicsUtils.getTextureAnimationFromResource(Renamed1368,param1);
         _loc2_.material.resolution = Renamed9478.Renamed3501 / param1.frameWidth;
         return _loc2_;
      }
      
      [Obfuscation(rename="false")]
      public function objectUnloaded(param1:ClientObject) : void
      {
         var _loc2_:Renamed9469 = Renamed9469(param1.getParams(Renamed9469));
         Renamed1368.releaseMaterial(_loc2_.Renamed9490.material);
         Renamed1368.releaseMaterial(_loc2_.Renamed9492.material);
      }
      
      public function Renamed9494(param1:Number, param2:Number, param3:ClientObject) : Renamed8354
      {
         var _loc4_:Renamed9469 = Renamed9469(param3.getParams(Renamed9469));
         return new Renamed9470(battleService.Renamed618(),param1,param2,_loc4_);
      }
   }
}

