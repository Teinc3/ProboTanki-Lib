package Renamed70
{
   import Renamed3253.Renamed3254;
   import Renamed259.Renamed3255;
   import Renamed491.Renamed9631;
   import Renamed491.Renamed9633;
   import Renamed491.Renamed9635;
   import alternativa.engine3d.materials.TextureMaterial;
   import alternativa.object.ClientObject;
   import alternativa.tanks.battle.BattleService;
   import alternativa.tanks.engine3d.EffectsMaterialRegistry;
   import alternativa.tanks.engine3d.Renamed843;
   import alternativa.tanks.utils.GraphicsUtils;
   import flash.display.BitmapData;
   import flash.filters.BitmapFilter;
   import platform.client.fp10.core.resource.types.MultiframeImageResource;
   
   public class Renamed4687 extends Renamed9633 implements Renamed9635, Renamed10242
   {
      [Inject]
      public static var battleService:BattleService;
      
      [Inject]
      public static var Renamed1368:EffectsMaterialRegistry;
      
      public function Renamed4687()
      {
         super();
      }
      
      private static function Renamed5883(param1:BitmapData, param2:BitmapFilter) : TextureMaterial
      {
         var _loc3_:BitmapData = GraphicsUtils.createFilteredImage(param1,param2);
         var _loc4_:TextureMaterial;
         (_loc4_ = Renamed1368.getMaterial(_loc3_)).resolution = Renamed10245.Renamed10246 / param1.height;
         return _loc4_;
      }
      
      private static function Renamed10252(param1:MultiframeImageResource, param2:BitmapFilter) : Renamed843
      {
         return getTextureAnimation(param1,param2,Renamed10234.Renamed10142);
      }
      
      private static function Renamed5884(param1:MultiframeImageResource, param2:BitmapFilter) : Renamed843
      {
         return getTextureAnimation(param1,param2,Renamed10234.Renamed10143);
      }
      
      private static function getTextureAnimation(param1:MultiframeImageResource, param2:BitmapFilter, param3:Number) : Renamed843
      {
         var _loc4_:Renamed843 = GraphicsUtils.getFilteredTextureAnimationFromResource(Renamed1368,param1,param2);
         _loc4_.material.resolution = param3 / param1.frameWidth;
         return _loc4_;
      }
      
      private static function Renamed8654(param1:String) : BitmapFilter
      {
         var _loc2_:Renamed3254 = Renamed3254(object.adapt(Renamed3254));
         return _loc2_.createFilter(param1);
      }
      
      private static function Renamed1264(param1:Renamed10232) : void
      {
         Renamed1368.releaseMaterial(param1.Renamed5828);
         Renamed1368.releaseMaterial(param1.Renamed10153.material);
         Renamed1368.releaseMaterial(param1.Renamed3188.material);
         Renamed1368.releaseMaterial(param1.Renamed3190);
      }
      
      public function Renamed10250(param1:ClientObject) : Renamed10245
      {
         return Renamed10245(param1.getParams(Renamed10245));
      }
      
      public function Renamed10251(param1:ClientObject) : Renamed10232
      {
         return Renamed10232(param1.getParams(Renamed10232));
      }
      
      [Obfuscation(rename="false")]
      public function objectLoadedPost(param1:ClientObject) : void
      {
         var _loc2_:Renamed9631 = getInitParam();
         var _loc3_:Renamed10232 = new Renamed10232();
         _loc3_.Renamed5828 = Renamed5883(_loc2_.muzzleFlashTexture.data,Renamed8654("flash"));
         _loc3_.Renamed10153 = Renamed10252(_loc2_.shotTexture,Renamed8654("shot"));
         _loc3_.Renamed3188 = Renamed5884(_loc2_.explosionTexture,Renamed8654("expl"));
         _loc3_.Renamed3190 = Renamed1368.getMaterial(_loc2_.hitMarkTexture.data);
         _loc3_.shotSound = _loc2_.shotSound.sound;
         var _loc4_:Renamed3255 = Renamed3255(object.adapt(Renamed3255));
         _loc3_.Renamed10249 = _loc4_.Renamed3262("shot");
         _loc3_.Renamed10235 = _loc4_.Renamed3262("bullet");
         _loc3_.Renamed10237 = _loc4_.Renamed3262("hit");
         param1.putParams(Renamed10232,_loc3_);
         param1.putParams(Renamed10245,new Renamed10245(battleService,_loc3_));
      }
      
      [Obfuscation(rename="false")]
      public function objectUnloaded(param1:ClientObject) : void
      {
         Renamed1264(this.Renamed10251(param1));
      }
   }
}

