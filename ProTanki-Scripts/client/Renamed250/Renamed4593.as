package Renamed250
{
   import Renamed259.Renamed3255;
   import alternativa.engine3d.materials.TextureMaterial;
   import alternativa.object.ClientObject;
   import alternativa.tanks.battle.BattleService;
   import alternativa.tanks.engine3d.EffectsMaterialRegistry;
   import alternativa.tanks.engine3d.Renamed843;
   import alternativa.tanks.models.weapon.smoky.Renamed3471;
   import alternativa.tanks.models.weapon.smoky.Renamed3499;
   import alternativa.tanks.utils.GraphicsUtils;
   import Renamed337.Renamed6728;
   import Renamed337.Renamed6729;
   import Renamed337.Renamed6730;
   import platform.client.fp10.core.resource.types.ImageResource;
   import platform.client.fp10.core.resource.types.MultiframeImageResource;
   
   public class Renamed4593 extends Renamed6729 implements Renamed6730, Renamed3489
   {
      [Inject]
      public static var Renamed1368:EffectsMaterialRegistry;
      
      [Inject]
      public static var battleService:BattleService;
      
      public function Renamed4593()
      {
         super();
      }
      
      private static function Renamed5883(param1:ImageResource) : TextureMaterial
      {
         var _loc2_:TextureMaterial = Renamed1368.getMaterial(param1.data);
         _loc2_.resolution = Renamed3499.Renamed3500 / param1.data.height;
         return _loc2_;
      }
      
      private static function Renamed6731(param1:MultiframeImageResource, param2:int) : Renamed843
      {
         var _loc3_:Renamed843 = GraphicsUtils.getTextureAnimationFromResource(Renamed1368,param1);
         _loc3_.material.resolution = param2 / param1.frameWidth;
         return _loc3_;
      }
      
      [Obfuscation(rename="false")]
      public function objectLoaded(param1:ClientObject) : void
      {
         var _loc2_:Renamed6728 = getInitParam();
         var _loc3_:Renamed6721 = new Renamed6721();
         _loc3_.Renamed5828 = Renamed5883(_loc2_.shotTexture);
         _loc3_.Renamed3188 = Renamed6731(_loc2_.explosionTexture,_loc2_.explosionSize);
         _loc3_.Renamed5830 = Renamed1368.getMaterial(_loc2_.explosionMarkTexture.data);
         _loc3_.Renamed6722 = Renamed6731(_loc2_.criticalHitTexture,_loc2_.criticalHitSize);
         _loc3_.criticalHitSize = _loc2_.criticalHitSize;
         _loc3_.shotSound = _loc2_.shotSound.sound;
         _loc3_.explosionSound = _loc2_.explosionSound.sound;
         _loc3_.explosionSize = _loc2_.explosionSize;
         var _loc4_:Renamed3255 = Renamed3255(object.adapt(Renamed3255));
         _loc3_.Renamed3192 = _loc4_.Renamed3262("shot");
         _loc3_.Renamed3194 = _loc4_.Renamed3262("hit");
         param1.putParams(Renamed6721,_loc3_);
      }
      
      [Obfuscation(rename="false")]
      public function objectUnloaded(param1:ClientObject) : void
      {
         var _loc2_:Renamed6721 = Renamed6721(param1.getParams(Renamed6721));
         Renamed1368.releaseMaterial(_loc2_.Renamed5828);
         Renamed1368.releaseMaterial(_loc2_.Renamed3188.material);
         Renamed1368.releaseMaterial(_loc2_.Renamed5830);
         Renamed1368.releaseMaterial(_loc2_.Renamed6722.material);
      }
      
      public function Renamed3159(param1:ClientObject) : Renamed3471
      {
         var _loc2_:Renamed6721 = Renamed6721(param1.getParams(Renamed6721));
         return new Renamed4592(battleService.Renamed619().Renamed801(),battleService.Renamed618(),_loc2_);
      }
   }
}

