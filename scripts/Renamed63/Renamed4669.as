package Renamed63
{
   import Renamed3253.Renamed3254;
   import Renamed259.Renamed3255;
   import alternativa.engine3d.materials.TextureMaterial;
   import alternativa.object.ClientObject;
   import alternativa.tanks.battle.BattleService;
   import alternativa.tanks.engine3d.EffectsMaterialRegistry;
   import alternativa.tanks.engine3d.Renamed843;
   import alternativa.tanks.utils.GraphicsUtils;
   import flash.display.BitmapData;
   import flash.filters.BitmapFilter;
   import Renamed391.Renamed8433;
   import Renamed391.Renamed8434;
   import Renamed391.Renamed8442;
   import platform.client.fp10.core.resource.types.ImageResource;
   import platform.client.fp10.core.resource.types.MultiframeImageResource;
   
   public class Renamed4669 extends Renamed8442 implements Renamed8433, Renamed10137
   {
      [Inject]
      public static var Renamed1368:EffectsMaterialRegistry;
      
      [Inject]
      public static var battleService:BattleService;
      
      public function Renamed4669()
      {
         super();
      }
      
      private static function Renamed10190(param1:MultiframeImageResource, param2:BitmapFilter) : Renamed843
      {
         return getTextureAnimation(param1,Renamed10141.Renamed10142,param2);
      }
      
      private static function getTextureAnimation(param1:MultiframeImageResource, param2:Number, param3:BitmapFilter) : Renamed843
      {
         var _loc4_:Renamed843 = GraphicsUtils.getFilteredTextureAnimationFromResource(Renamed1368,param1,param3);
         _loc4_.material.resolution = param2 / param1.frameWidth;
         return _loc4_;
      }
      
      private static function Renamed8654(param1:String) : BitmapFilter
      {
         var _loc2_:Renamed3254 = Renamed3254(object.adapt(Renamed3254));
         return _loc2_.createFilter(param1);
      }
      
      private static function Renamed5884(param1:MultiframeImageResource, param2:BitmapFilter) : Renamed843
      {
         return getTextureAnimation(param1,Renamed10141.Renamed10143,param2);
      }
      
      private static function Renamed10191(param1:MultiframeImageResource, param2:BitmapFilter) : Renamed843
      {
         return getTextureAnimation(param1,Renamed10141.Renamed10143,param2);
      }
      
      private static function Renamed5883(param1:ImageResource) : TextureMaterial
      {
         var _loc2_:BitmapData = param1.data;
         var _loc3_:TextureMaterial = Renamed1368.getMaterial(_loc2_);
         _loc3_.resolution = Renamed10140.Renamed3260 / _loc2_.height;
         return _loc3_;
      }
      
      private static function Renamed3259(param1:BitmapData, param2:BitmapFilter) : TextureMaterial
      {
         var _loc3_:TextureMaterial = Renamed1368.getMaterial(param1);
         _loc3_.resolution = Renamed10141.Renamed10111 / param1.height;
         return _loc3_;
      }
      
      [Obfuscation(rename="false")]
      public function objectLoadedPost(param1:ClientObject) : void
      {
         var _loc2_:Renamed8434 = getInitParam();
         var _loc3_:Renamed10138 = new Renamed10138();
         _loc3_.Renamed10153 = Renamed10190(_loc2_.shotTexture,Renamed8654("shot"));
         _loc3_.Renamed3188 = Renamed5884(_loc2_.explosionTexture,Renamed8654("expl"));
         _loc3_.Renamed10167 = Renamed10191(_loc2_.bumpFlashTexture,Renamed8654("expl"));
         _loc3_.Renamed5828 = Renamed5883(_loc2_.shotFlashTexture);
         _loc3_.Renamed10154 = Renamed3259(_loc2_.tailTrailTexutre.data,Renamed8654("trail"));
         _loc3_.shotSound = _loc2_.shotSound.sound;
         _loc3_.ricochetSound = _loc2_.ricochetSound.sound;
         _loc3_.explosionSound = _loc2_.Renamed8440.sound;
         var _loc4_:Renamed3255 = Renamed3255(object.adapt(Renamed3255));
         _loc3_.Renamed3192 = _loc4_.Renamed3262("shot");
         _loc3_.Renamed10165 = _loc4_.Renamed3262("ricochet");
         _loc3_.Renamed3194 = _loc4_.Renamed3262("hit");
         _loc3_.Renamed10155 = _loc4_.Renamed3262("bullet");
         param1.putParams(Renamed10138,_loc3_);
         param1.putParams(Renamed10140,new Renamed10140(battleService,_loc3_));
      }
      
      [Obfuscation(rename="false")]
      public function objectUnloaded(param1:ClientObject) : void
      {
         var _loc2_:Renamed10138 = this.Renamed3126(param1);
         Renamed1368.releaseMaterial(_loc2_.Renamed3188.material);
         Renamed1368.releaseMaterial(_loc2_.Renamed10167.material);
         Renamed1368.releaseMaterial(_loc2_.Renamed10153.material);
         Renamed1368.releaseMaterial(_loc2_.Renamed5828);
         Renamed1368.releaseMaterial(_loc2_.Renamed10154);
      }
      
      public function Renamed3126(param1:ClientObject) : Renamed10138
      {
         return Renamed10138(param1.getParams(Renamed10138));
      }
      
      public function Renamed10139(param1:ClientObject) : Renamed10140
      {
         return Renamed10140(param1.getParams(Renamed10140));
      }
   }
}

