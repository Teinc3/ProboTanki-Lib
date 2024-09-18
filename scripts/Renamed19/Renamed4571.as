package Renamed19
{
   import Renamed259.Renamed3255;
   import Renamed5511.Renamed5513;
   import Renamed5511.Renamed5514;
   import Renamed5511.Renamed5515;
   import alternativa.engine3d.materials.TextureMaterial;
   import alternativa.object.ClientObject;
   import alternativa.tanks.battle.BattleService;
   import alternativa.tanks.engine3d.EffectsMaterialRegistry;
   import alternativa.tanks.engine3d.Renamed843;
   import alternativa.tanks.utils.GraphicsUtils;
   import flash.display.BitmapData;
   import platform.client.fp10.core.resource.types.ImageResource;
   import platform.client.fp10.core.resource.types.MultiframeImageResource;
   
   public class Renamed4571 extends Renamed5513 implements Renamed5514, Renamed5833
   {
      [Inject]
      public static var Renamed1368:EffectsMaterialRegistry;
      
      [Inject]
      public static var battleService:BattleService;
      
      public function Renamed4571()
      {
         super();
      }
      
      private static function Renamed5883(param1:ImageResource) : TextureMaterial
      {
         var _loc2_:BitmapData = param1.data;
         var _loc3_:TextureMaterial = Renamed1368.getMaterial(_loc2_);
         _loc3_.resolution = Renamed5827.Renamed5839 / _loc2_.height;
         return _loc3_;
      }
      
      private static function Renamed5884(param1:MultiframeImageResource, param2:Number) : Renamed843
      {
         var _loc3_:Renamed843 = GraphicsUtils.getTextureAnimationFromResource(Renamed1368,param1);
         _loc3_.material.resolution = param2 / param1.frameWidth;
         return _loc3_;
      }
      
      [Obfuscation(rename="false")]
      public function objectLoaded(param1:ClientObject) : void
      {
         var _loc2_:Renamed5515 = getInitParam();
         var _loc3_:Renamed5826 = new Renamed5826();
         _loc3_.Renamed5828 = Renamed5883(_loc2_.shotTexture);
         _loc3_.Renamed3188 = Renamed5884(_loc2_.explosionTexture,_loc2_.explosionSize);
         _loc3_.explosionSize = _loc2_.explosionSize;
         _loc3_.shotSound = _loc2_.shotSound.sound;
         _loc3_.explosionSound = _loc2_.explosionSound.sound;
         _loc3_.Renamed5830 = Renamed1368.getMaterial(_loc2_.explosionMarkTexture.data);
         var _loc4_:Renamed3255 = Renamed3255(object.adapt(Renamed3255));
         _loc3_.Renamed3192 = _loc4_.Renamed3262("shot");
         _loc3_.Renamed3194 = _loc4_.Renamed3262("hit");
         param1.putParams(Renamed5826,_loc3_);
      }
      
      [Obfuscation(rename="false")]
      public function objectUnloaded(param1:ClientObject) : void
      {
         var _loc2_:Renamed5826 = Renamed5826(param1.getParams(Renamed5826));
         Renamed1368.releaseMaterial(_loc2_.Renamed5828);
         Renamed1368.releaseMaterial(_loc2_.Renamed3188.material);
         Renamed1368.releaseMaterial(_loc2_.Renamed5830);
      }
      
      public function Renamed3159(param1:ClientObject) : Renamed5823
      {
         return new Renamed5822(battleService,Renamed5826(param1.getParams(Renamed5826)));
      }
   }
}

