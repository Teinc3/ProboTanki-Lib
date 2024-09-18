package alternativa.tanks.models.weapon.shaft
{
   import Renamed219.Renamed3250;
   import Renamed219.Renamed3251;
   import Renamed219.Renamed3252;
   import Renamed3253.Renamed3254;
   import Renamed259.Renamed3255;
   import Renamed500.Renamed3256;
   import alternativa.engine3d.materials.TextureMaterial;
   import alternativa.object.ClientObject;
   import alternativa.tanks.battle.BattleService;
   import alternativa.tanks.engine3d.EffectsMaterialRegistry;
   import alternativa.tanks.engine3d.Renamed843;
   import alternativa.tanks.utils.GraphicsUtils;
   import flash.display.BitmapData;
   import flash.filters.BitmapFilter;
   import flash.media.Sound;
   import platform.client.fp10.core.resource.types.MultiframeImageResource;
   
   public class Renamed3257 extends Renamed3252 implements Renamed3250, Renamed3161
   {
      [Inject]
      public static var Renamed1368:EffectsMaterialRegistry;
      
      [Inject]
      public static var battleService:BattleService;
      
      public function Renamed3257()
      {
         super();
      }
      
      private static function Renamed3258(param1:String) : BitmapFilter
      {
         var _loc2_:Renamed3254 = Renamed3254(object.adapt(Renamed3254));
         return _loc2_.createFilter(param1);
      }
      
      private static function getTextureAnimation(param1:MultiframeImageResource, param2:BitmapFilter, param3:Number) : Renamed843
      {
         var _loc4_:Renamed843 = GraphicsUtils.getFilteredTextureAnimationFromResource(Renamed1368,param1,param2);
         _loc4_.material.resolution = param3 / param1.frameWidth;
         return _loc4_;
      }
      
      private static function Renamed3259(param1:BitmapData, param2:BitmapFilter) : TextureMaterial
      {
         var _loc3_:BitmapData = GraphicsUtils.createFilteredImage(param1,param2);
         var _loc4_:TextureMaterial;
         (_loc4_ = Renamed1368.getMaterial(_loc3_)).resolution = Renamed3256.WIDTH / _loc3_.width;
         return _loc4_;
      }
      
      [Obfuscation(rename="false")]
      public function objectLoadedPost(param1:ClientObject) : void
      {
         var _loc2_:Renamed3251 = getInitParam();
         var _loc3_:Sound = _loc2_.targetingSound.sound;
         var _loc4_:Sound = _loc2_.zoomModeSound.sound;
         var _loc5_:Sound = _loc2_.shotSound.sound;
         var _loc6_:Sound = _loc2_.explosionSound.sound;
         var _loc7_:BitmapFilter = Renamed3258("def");
         var _loc8_:Renamed843 = getTextureAnimation(_loc2_.muzzleFlashTexture,_loc7_,Renamed3160.Renamed3260);
         var _loc9_:Renamed843 = getTextureAnimation(_loc2_.explosionTexture,_loc7_,Renamed3160.Renamed3261);
         var _loc10_:TextureMaterial = Renamed3259(_loc2_.trailTexture.data,_loc7_);
         var _loc11_:TextureMaterial = Renamed1368.getMaterial(_loc2_.hitMarkTexture.data);
         var _loc12_:Number = 500;
         var _loc13_:Renamed3186 = new Renamed3186(_loc5_,_loc6_,_loc4_,_loc3_,_loc8_,_loc10_,_loc9_,_loc11_,_loc12_);
         var _loc14_:Renamed3255 = Renamed3255(object.adapt(Renamed3255));
         _loc13_.Renamed3192 = _loc14_.Renamed3262("shot");
         _loc13_.Renamed3194 = _loc14_.Renamed3262("hit");
         param1.putParams(Renamed3186,_loc13_);
      }
      
      [Obfuscation(rename="false")]
      public function objectUnloaded(param1:ClientObject) : void
      {
         var _loc2_:Renamed3186 = Renamed3186(param1.getParams(Renamed3186));
         Renamed1368.releaseMaterial(_loc2_.Renamed3189);
         Renamed1368.releaseMaterial(_loc2_.Renamed3187.material);
         Renamed1368.releaseMaterial(_loc2_.Renamed3188.material);
         Renamed1368.releaseMaterial(_loc2_.Renamed3190);
      }
      
      public function Renamed3159(param1:ClientObject) : Renamed3160
      {
         var _loc2_:Renamed3186 = Renamed3186(param1.getParams(Renamed3186));
         return new Renamed3160(_loc2_,battleService);
      }
   }
}

