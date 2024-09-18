package Renamed56
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
   import platform.client.fp10.core.resource.types.ImageResource;
   import platform.client.fp10.core.resource.types.MultiframeImageResource;
   import Renamed449.Renamed8995;
   import Renamed449.Renamed8996;
   import Renamed449.Renamed9005;
   
   public class Renamed4659 extends Renamed9005 implements Renamed8995, Renamed10062
   {
      [Inject]
      public static var Renamed1368:EffectsMaterialRegistry;
      
      [Inject]
      public static var battleService:BattleService;
      
      private static const Renamed10063:Renamed10043 = new Renamed10043();
      
      public function Renamed4659()
      {
         super();
      }
      
      private static function getTextureAnimation(param1:MultiframeImageResource, param2:Number, param3:BitmapFilter) : Renamed843
      {
         var _loc4_:Renamed843 = GraphicsUtils.getFilteredTextureAnimationFromResource(Renamed1368,param1,param3);
         _loc4_.material.resolution = param2 / param1.frameWidth;
         return _loc4_;
      }
      
      private static function Renamed3259(param1:BitmapData, param2:BitmapFilter) : TextureMaterial
      {
         var _loc3_:BitmapData = GraphicsUtils.createFilteredImage(param1,param2);
         var _loc4_:TextureMaterial;
         (_loc4_ = Renamed1368.getMaterial(_loc3_)).repeat = true;
         return _loc4_;
      }
      
      private static function Renamed8654(param1:String) : BitmapFilter
      {
         var _loc2_:Renamed3254 = Renamed3254(object.adapt(Renamed3254));
         return _loc2_.createFilter(param1);
      }
      
      [Obfuscation(rename="false")]
      public function objectLoadedPost(param1:ClientObject) : void
      {
         var _loc2_:Renamed8996 = getInitParam();
         var _loc3_:Renamed10064 = new Renamed10064();
         var _loc4_:BitmapFilter = Renamed8654("trail");
         _loc3_.Renamed3189 = Renamed3259(_loc2_.trailImage.data,_loc4_);
         _loc3_.Renamed10065 = Renamed3259(_loc2_.smokeImage.data,_loc4_);
         _loc3_.Renamed3190 = Renamed1368.getMaterial(_loc2_.hitMarkTexture.data);
         _loc3_.Renamed10066 = this.Renamed10067(_loc2_.chargingPart1,_loc2_.chargingPart2,_loc2_.chargingPart3,Renamed8654("charge"));
         _loc3_.Renamed10068 = getTextureAnimation(_loc2_.ringsTexture,Renamed10069.Renamed10070,_loc4_);
         _loc3_.Renamed10071 = getTextureAnimation(_loc2_.sphereTexture,Renamed10069.Renamed10072,_loc4_);
         _loc3_.Renamed10073 = getTextureAnimation(_loc2_.powTexture,Renamed10069.Renamed10074,_loc4_);
         _loc3_.sound = _loc2_.shotSound.sound;
         var _loc5_:Renamed3255 = Renamed3255(object.adapt(Renamed3255));
         _loc3_.Renamed10075 = _loc5_.Renamed3262("charge");
         _loc3_.Renamed3192 = _loc5_.Renamed3262("shot");
         _loc3_.Renamed3194 = _loc5_.Renamed3262("hit");
         _loc3_.Renamed10076 = _loc5_.Renamed3262("rail");
         param1.putParams(Renamed10064,_loc3_);
      }
      
      private function Renamed10067(param1:ImageResource, param2:ImageResource, param3:ImageResource, param4:BitmapFilter) : Renamed843
      {
         var _loc5_:BitmapData = GraphicsUtils.createFilteredImage(Renamed10063.getTexture(param1,param2,param3),param4);
         var _loc6_:int = _loc5_.height;
         var _loc7_:Renamed843 = GraphicsUtils.getTextureAnimation(Renamed1368,_loc5_,_loc6_,_loc6_);
         _loc7_.material.resolution = Renamed10069.Renamed10077 / _loc6_;
         return _loc7_;
      }
      
      [Obfuscation(rename="false")]
      public function objectUnloaded(param1:ClientObject) : void
      {
         var _loc2_:Renamed10064 = Renamed10064(param1.getParams(Renamed10064));
         Renamed1368.releaseMaterial(_loc2_.Renamed3189);
         Renamed1368.releaseMaterial(_loc2_.Renamed10065);
         Renamed1368.releaseMaterial(_loc2_.Renamed10066.material);
         Renamed1368.releaseMaterial(_loc2_.Renamed3190);
         Renamed1368.releaseMaterial(_loc2_.Renamed10068.material);
         Renamed1368.releaseMaterial(_loc2_.Renamed10071.material);
         Renamed1368.releaseMaterial(_loc2_.Renamed10073.material);
      }
      
      public function Renamed3159(param1:ClientObject) : Renamed10078
      {
         return new Renamed10069(Renamed10064(param1.getParams(Renamed10064)),battleService);
      }
   }
}

