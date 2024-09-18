package §0#y§
{
   import §4"%§.§80§;
   import §7"j§.§include finally§;
   import §9#o§.§switch const native§;
   import alternativa.engine3d.materials.TextureMaterial;
   import alternativa.tanks.engine3d.EffectsMaterialRegistry;
   import alternativa.tanks.engine3d.§throw const switch§;
   import alternativa.tanks.utils.GraphicsUtils;
   import flash.display.BitmapData;
   import flash.filters.BitmapFilter;
   import flash.media.Sound;
   import platform.client.fp10.core.resource.types.ImageResource;
   import platform.client.fp10.core.resource.types.MultiframeImageResource;
   import platform.client.fp10.core.type.AutoClosable;
   
   public class §if catch use§ implements AutoClosable
   {
      [Inject]
      public static var §@#R§:EffectsMaterialRegistry;
      
      public var shotSound:Sound;
      
      public var reloadSound:Sound;
      
      public var magazineReloadSound:Sound;
      
      public var §while break§:§throw const switch§;
      
      public var §6#f§:§throw const switch§;
      
      public var §82§:§throw const switch§;
      
      public var §class const null§:TextureMaterial;
      
      public var §1!6§:TextureMaterial;
      
      public var §default for if§:Vector.<TextureMaterial>;
      
      public var §super default§:§include finally§;
      
      public function §if catch use§(param1:§switch const native§, param2:§include finally§, param3:§80§)
      {
         var _loc4_:ImageResource = null;
         var _loc5_:TextureMaterial = null;
         super();
         this.shotSound = param1.shotSound.sound;
         this.reloadSound = param1.reloadSound.sound;
         this.magazineReloadSound = param1.magazineReloadSound.sound;
         this.§while break§ = this.§native catch false§(param1.shotAcrossTexture,param3.createFilter("fire_across"));
         this.§6#f§ = this.§native catch false§(param1.shotAlongTexture,param3.createFilter("fire_along"));
         this.§82§ = GraphicsUtils.getTextureAnimationFromResource(§@#R§,param1.smokeTexture);
         this.§class const null§ = this.§import package override§(param1.pelletTrailTexture,param3.createFilter("trail"));
         this.§1!6§ = this.§import package override§(param1.sparkleTexture,param3.createFilter("sparkle"));
         this.§default for if§ = new Vector.<TextureMaterial>();
         for each(_loc4_ in param1.§with for set§)
         {
            _loc5_ = §@#R§.getMaterial(_loc4_.data);
            this.§default for if§.push(_loc5_);
         }
         this.§super default§ = param2;
      }
      
      private function §import package override§(param1:ImageResource, param2:BitmapFilter) : TextureMaterial
      {
         var _loc3_:BitmapData = GraphicsUtils.createFilteredImage(param1.data,param2);
         return §@#R§.getMaterial(_loc3_);
      }
      
      private function §native catch false§(param1:MultiframeImageResource, param2:BitmapFilter) : §throw const switch§
      {
         return GraphicsUtils.getFilteredTextureAnimationFromResource(§@#R§,param1,param2);
      }
      
      [Obfuscation(rename="false")]
      public function close() : void
      {
         var _loc1_:TextureMaterial = null;
         this.shotSound = null;
         this.reloadSound = null;
         this.magazineReloadSound = null;
         §@#R§.releaseMaterial(this.§while break§.material);
         §@#R§.releaseMaterial(this.§6#f§.material);
         §@#R§.releaseMaterial(this.§82§.material);
         §@#R§.releaseMaterial(this.§class const null§);
         §@#R§.releaseMaterial(this.§1!6§);
         for each(_loc1_ in this.§default for if§)
         {
            §@#R§.releaseMaterial(_loc1_);
         }
      }
   }
}

