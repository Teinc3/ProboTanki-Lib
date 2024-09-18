package Renamed462
{
   import Renamed3253.Renamed3254;
   import Renamed259.Renamed3255;
   import Renamed1.Renamed3193;
   import Renamed482.Renamed9244;
   import alternativa.engine3d.core.MipMapping;
   import alternativa.engine3d.materials.TextureMaterial;
   import alternativa.tanks.engine3d.EffectsMaterialRegistry;
   import alternativa.tanks.engine3d.Renamed843;
   import alternativa.tanks.utils.GraphicsUtils;
   import flash.display.BitmapData;
   import flash.filters.BitmapFilter;
   import flash.media.Sound;
   import platform.client.fp10.core.type.AutoClosable;
   
   public class Renamed3075 implements AutoClosable
   {
      [Inject]
      public static var Renamed1368:EffectsMaterialRegistry;
      
      private static const Renamed9245:String = "fire";
      
      private static const Renamed9246:String = "tracer";
      
      private static const Renamed9247:String = "tank_sparkles";
      
      private static const Renamed9248:String = "startFire";
      
      private static const Renamed9249:String = "loopFire";
      
      private var Renamed8484:Sound;
      
      private var Renamed8485:Sound;
      
      private var Renamed8487:Sound;
      
      private var Renamed8486:Sound;
      
      private var Renamed8488:Sound;
      
      private var Renamed9250:Sound;
      
      private var Renamed9251:Sound;
      
      private var Renamed9252:Renamed843;
      
      private var Renamed9253:Renamed843;
      
      private var Renamed9254:Renamed843;
      
      private var Renamed7246:Renamed843;
      
      private var Renamed9255:Renamed843;
      
      private var Renamed9256:Renamed843;
      
      private var Renamed9257:TextureMaterial;
      
      private var Renamed9258:Renamed3193;
      
      private var Renamed9259:Renamed3193;
      
      private var Renamed9260:TextureMaterial;
      
      public function Renamed3075(param1:Renamed9244, param2:Renamed3255, param3:Renamed3254)
      {
         super();
         this.Renamed8484 = param1.chainStartSound.sound;
         this.Renamed8485 = param1.turbineStartSound.sound;
         this.Renamed8487 = param1.shootEndSound.sound;
         this.Renamed8486 = param1.shootSound.sound;
         this.Renamed8488 = param1.longFailSound.sound;
         this.Renamed9250 = param1.hitSound.sound;
         this.Renamed9251 = param1.tankHitSound.sound;
         var _loc4_:BitmapFilter = param3.createFilter(Renamed9245);
         this.Renamed9252 = GraphicsUtils.getTextureAnimationFromResource(Renamed1368,param1.dustTexture);
         this.Renamed9253 = GraphicsUtils.getFilteredTextureAnimationFromResource(Renamed1368,param1.fireAcrossTexture,_loc4_);
         this.Renamed9254 = GraphicsUtils.getFilteredTextureAnimationFromResource(Renamed1368,param1.fireAlongTexture,_loc4_);
         this.Renamed7246 = GraphicsUtils.getTextureAnimationFromResource(Renamed1368,param1.smokeTexture);
         this.Renamed9255 = GraphicsUtils.getTextureAnimationFromResource(Renamed1368,param1.sparklesTexture);
         this.Renamed9256 = GraphicsUtils.getFilteredTextureAnimationFromResource(Renamed1368,param1.tankSparklesTexture,param3.createFilter(Renamed9247));
         this.Renamed9257 = Renamed9261(param1.tracerTexture.data,param3.createFilter(Renamed9246));
         this.Renamed9258 = param2.Renamed3262(Renamed9248);
         this.Renamed9259 = param2.Renamed3262(Renamed9249);
         this.Renamed9260 = Renamed1368.getMaterial(param1.crumbsTexture.data);
      }
      
      private static function Renamed9261(param1:BitmapData, param2:BitmapFilter) : TextureMaterial
      {
         var _loc3_:BitmapData = GraphicsUtils.createFilteredImage(param1,param2);
         var _loc4_:TextureMaterial;
         (_loc4_ = Renamed1368.getMaterial(_loc3_)).mipMapping = MipMapping.NONE;
         _loc4_.repeat = true;
         return _loc4_;
      }
      
      public function get chainStartSound() : Sound
      {
         return this.Renamed8484;
      }
      
      public function get turbineStartSound() : Sound
      {
         return this.Renamed8485;
      }
      
      public function get shootEndSound() : Sound
      {
         return this.Renamed8487;
      }
      
      public function get shootSound() : Sound
      {
         return this.Renamed8486;
      }
      
      public function get longFailSound() : Sound
      {
         return this.Renamed8488;
      }
      
      public function get hitSound() : Sound
      {
         return this.Renamed9250;
      }
      
      public function get tankHitSound() : Sound
      {
         return this.Renamed9251;
      }
      
      public function get dustTexture() : Renamed843
      {
         return this.Renamed9252;
      }
      
      public function get fireAcrossTexture() : Renamed843
      {
         return this.Renamed9253;
      }
      
      public function get fireAlongTexture() : Renamed843
      {
         return this.Renamed9254;
      }
      
      public function get smokeTexture() : Renamed843
      {
         return this.Renamed7246;
      }
      
      public function get sparklesTexture() : Renamed843
      {
         return this.Renamed9255;
      }
      
      public function get tankSparklesTexture() : Renamed843
      {
         return this.Renamed9256;
      }
      
      public function get tracerTexture() : TextureMaterial
      {
         return this.Renamed9257;
      }
      
      public function get Renamed9242() : Renamed3193
      {
         return this.Renamed9258;
      }
      
      public function get Renamed9243() : Renamed3193
      {
         return this.Renamed9259;
      }
      
      public function get crumbsTexture() : TextureMaterial
      {
         return this.Renamed9260;
      }
      
      [Obfuscation(rename="false")]
      public function close() : void
      {
         Renamed1368.releaseMaterial(this.dustTexture.material);
         Renamed1368.releaseMaterial(this.fireAcrossTexture.material);
         Renamed1368.releaseMaterial(this.fireAlongTexture.material);
         Renamed1368.releaseMaterial(this.smokeTexture.material);
         Renamed1368.releaseMaterial(this.sparklesTexture.material);
         Renamed1368.releaseMaterial(this.tankSparklesTexture.material);
         Renamed1368.releaseMaterial(this.tracerTexture);
         Renamed1368.releaseMaterial(this.crumbsTexture);
         this.Renamed8484 = null;
         this.Renamed8485 = null;
         this.Renamed8487 = null;
         this.Renamed8486 = null;
         this.Renamed8488 = null;
         this.Renamed9250 = null;
         this.Renamed9251 = null;
         this.Renamed9258 = null;
         this.Renamed9259 = null;
      }
   }
}

