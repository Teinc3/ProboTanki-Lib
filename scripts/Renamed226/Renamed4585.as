package Renamed226
{
   import Renamed3253.Renamed3254;
   import Renamed1.Renamed3193;
   import Renamed285.Renamed6437;
   import alternativa.engine3d.materials.TextureMaterial;
   import alternativa.tanks.engine3d.EffectsMaterialRegistry;
   import alternativa.tanks.engine3d.Renamed843;
   import alternativa.tanks.utils.GraphicsUtils;
   import flash.display.BitmapData;
   import flash.filters.BitmapFilter;
   import flash.media.Sound;
   import platform.client.fp10.core.resource.types.ImageResource;
   import platform.client.fp10.core.resource.types.MultiframeImageResource;
   import platform.client.fp10.core.type.AutoClosable;
   
   public class Renamed4585 implements AutoClosable
   {
      [Inject]
      public static var Renamed1368:EffectsMaterialRegistry;
      
      public var shotSound:Sound;
      
      public var reloadSound:Sound;
      
      public var magazineReloadSound:Sound;
      
      public var Renamed6416:Renamed843;
      
      public var Renamed6414:Renamed843;
      
      public var Renamed6423:Renamed843;
      
      public var Renamed6433:TextureMaterial;
      
      public var Renamed6434:TextureMaterial;
      
      public var Renamed6435:Vector.<TextureMaterial>;
      
      public var Renamed3192:Renamed3193;
      
      public function Renamed4585(param1:Renamed6437, param2:Renamed3193, param3:Renamed3254)
      {
         var _loc4_:ImageResource = null;
         var _loc5_:TextureMaterial = null;
         super();
         this.shotSound = param1.shotSound.sound;
         this.reloadSound = param1.reloadSound.sound;
         this.magazineReloadSound = param1.magazineReloadSound.sound;
         this.Renamed6416 = this.Renamed6438(param1.shotAcrossTexture,param3.createFilter("fire_across"));
         this.Renamed6414 = this.Renamed6438(param1.shotAlongTexture,param3.createFilter("fire_along"));
         this.Renamed6423 = GraphicsUtils.getTextureAnimationFromResource(Renamed1368,param1.smokeTexture);
         this.Renamed6433 = this.Renamed6439(param1.pelletTrailTexture,param3.createFilter("trail"));
         this.Renamed6434 = this.Renamed6439(param1.sparkleTexture,param3.createFilter("sparkle"));
         this.Renamed6435 = new Vector.<TextureMaterial>();
         for each(_loc4_ in param1.Renamed6440)
         {
            _loc5_ = Renamed1368.getMaterial(_loc4_.data);
            this.Renamed6435.push(_loc5_);
         }
         this.Renamed3192 = param2;
      }
      
      private function Renamed6439(param1:ImageResource, param2:BitmapFilter) : TextureMaterial
      {
         var _loc3_:BitmapData = GraphicsUtils.createFilteredImage(param1.data,param2);
         return Renamed1368.getMaterial(_loc3_);
      }
      
      private function Renamed6438(param1:MultiframeImageResource, param2:BitmapFilter) : Renamed843
      {
         return GraphicsUtils.getFilteredTextureAnimationFromResource(Renamed1368,param1,param2);
      }
      
      [Obfuscation(rename="false")]
      public function close() : void
      {
         var _loc1_:TextureMaterial = null;
         this.shotSound = null;
         this.reloadSound = null;
         this.magazineReloadSound = null;
         Renamed1368.releaseMaterial(this.Renamed6416.material);
         Renamed1368.releaseMaterial(this.Renamed6414.material);
         Renamed1368.releaseMaterial(this.Renamed6423.material);
         Renamed1368.releaseMaterial(this.Renamed6433);
         Renamed1368.releaseMaterial(this.Renamed6434);
         for each(_loc1_ in this.Renamed6435)
         {
            Renamed1368.releaseMaterial(_loc1_);
         }
      }
   }
}

