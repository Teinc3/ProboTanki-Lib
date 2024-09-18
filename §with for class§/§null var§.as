package §with for class§
{
   import §4"%§.§80§;
   import §6!u§.§false set false§;
   import §7"j§.§include finally§;
   import §]2§.§+!§;
   import alternativa.engine3d.core.MipMapping;
   import alternativa.engine3d.materials.TextureMaterial;
   import alternativa.tanks.engine3d.EffectsMaterialRegistry;
   import alternativa.tanks.engine3d.§throw const switch§;
   import alternativa.tanks.utils.GraphicsUtils;
   import flash.display.BitmapData;
   import flash.filters.BitmapFilter;
   import flash.media.Sound;
   import platform.client.fp10.core.type.AutoClosable;
   
   public class §null var§ implements AutoClosable
   {
      [Inject]
      public static var §@#R§:EffectsMaterialRegistry;
      
      private static const §-!U§:String = "fire";
      
      private static const §^U§:String = "tracer";
      
      private static const §+7§:String = "tank_sparkles";
      
      private static const §super set for§:String = "startFire";
      
      private static const §%""§:String = "loopFire";
      
      private var §5,§:Sound;
      
      private var §set set do§:Sound;
      
      private var §;m§:Sound;
      
      private var §+!,§:Sound;
      
      private var §=!_§:Sound;
      
      private var §1#d§:Sound;
      
      private var §finally package null§:Sound;
      
      private var §extends const continue§:§throw const switch§;
      
      private var §override const set§:§throw const switch§;
      
      private var §%"'§:§throw const switch§;
      
      private var §0"x§:§throw const switch§;
      
      private var §7!y§:§throw const switch§;
      
      private var §9'§:§throw const switch§;
      
      private var §else catch if§:TextureMaterial;
      
      private var §["g§:§include finally§;
      
      private var §9$"§:§include finally§;
      
      private var §package set true§:TextureMaterial;
      
      public function §null var§(param1:§+!§, param2:§false set false§, param3:§80§)
      {
         super();
         this.§5,§ = param1.chainStartSound.sound;
         this.§set set do§ = param1.turbineStartSound.sound;
         this.§;m§ = param1.shootEndSound.sound;
         this.§+!,§ = param1.shootSound.sound;
         this.§=!_§ = param1.longFailSound.sound;
         this.§1#d§ = param1.hitSound.sound;
         this.§finally package null§ = param1.tankHitSound.sound;
         var _loc4_:BitmapFilter = param3.createFilter(§-!U§);
         this.§extends const continue§ = GraphicsUtils.getTextureAnimationFromResource(§@#R§,param1.dustTexture);
         this.§override const set§ = GraphicsUtils.getFilteredTextureAnimationFromResource(§@#R§,param1.fireAcrossTexture,_loc4_);
         this.§%"'§ = GraphicsUtils.getFilteredTextureAnimationFromResource(§@#R§,param1.fireAlongTexture,_loc4_);
         this.§0"x§ = GraphicsUtils.getTextureAnimationFromResource(§@#R§,param1.smokeTexture);
         this.§7!y§ = GraphicsUtils.getTextureAnimationFromResource(§@#R§,param1.sparklesTexture);
         this.§9'§ = GraphicsUtils.getFilteredTextureAnimationFromResource(§@#R§,param1.tankSparklesTexture,param3.createFilter(§+7§));
         this.§else catch if§ = §>"D§(param1.tracerTexture.data,param3.createFilter(§^U§));
         this.§["g§ = param2.§switch for return§(§super set for§);
         this.§9$"§ = param2.§switch for return§(§%""§);
         this.§package set true§ = §@#R§.getMaterial(param1.crumbsTexture.data);
      }
      
      private static function §>"D§(param1:BitmapData, param2:BitmapFilter) : TextureMaterial
      {
         var _loc3_:BitmapData = GraphicsUtils.createFilteredImage(param1,param2);
         var _loc4_:TextureMaterial;
         (_loc4_ = §@#R§.getMaterial(_loc3_)).mipMapping = MipMapping.NONE;
         _loc4_.repeat = true;
         return _loc4_;
      }
      
      public function get chainStartSound() : Sound
      {
         return this.§5,§;
      }
      
      public function get turbineStartSound() : Sound
      {
         return this.§set set do§;
      }
      
      public function get shootEndSound() : Sound
      {
         return this.§;m§;
      }
      
      public function get shootSound() : Sound
      {
         return this.§+!,§;
      }
      
      public function get longFailSound() : Sound
      {
         return this.§=!_§;
      }
      
      public function get hitSound() : Sound
      {
         return this.§1#d§;
      }
      
      public function get tankHitSound() : Sound
      {
         return this.§finally package null§;
      }
      
      public function get dustTexture() : §throw const switch§
      {
         return this.§extends const continue§;
      }
      
      public function get fireAcrossTexture() : §throw const switch§
      {
         return this.§override const set§;
      }
      
      public function get fireAlongTexture() : §throw const switch§
      {
         return this.§%"'§;
      }
      
      public function get smokeTexture() : §throw const switch§
      {
         return this.§0"x§;
      }
      
      public function get sparklesTexture() : §throw const switch§
      {
         return this.§7!y§;
      }
      
      public function get tankSparklesTexture() : §throw const switch§
      {
         return this.§9'§;
      }
      
      public function get tracerTexture() : TextureMaterial
      {
         return this.§else catch if§;
      }
      
      public function get §%!u§() : §include finally§
      {
         return this.§["g§;
      }
      
      public function get §import for with§() : §include finally§
      {
         return this.§9$"§;
      }
      
      public function get crumbsTexture() : TextureMaterial
      {
         return this.§package set true§;
      }
      
      [Obfuscation(rename="false")]
      public function close() : void
      {
         §@#R§.releaseMaterial(this.dustTexture.material);
         §@#R§.releaseMaterial(this.fireAcrossTexture.material);
         §@#R§.releaseMaterial(this.fireAlongTexture.material);
         §@#R§.releaseMaterial(this.smokeTexture.material);
         §@#R§.releaseMaterial(this.sparklesTexture.material);
         §@#R§.releaseMaterial(this.tankSparklesTexture.material);
         §@#R§.releaseMaterial(this.tracerTexture);
         §@#R§.releaseMaterial(this.crumbsTexture);
         this.§5,§ = null;
         this.§set set do§ = null;
         this.§;m§ = null;
         this.§+!,§ = null;
         this.§=!_§ = null;
         this.§1#d§ = null;
         this.§finally package null§ = null;
         this.§["g§ = null;
         this.§9$"§ = null;
      }
   }
}

