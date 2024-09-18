package §false const case§
{
   import §4"%§.§80§;
   import §6!u§.§false set false§;
   import alternativa.engine3d.materials.TextureMaterial;
   import alternativa.object.ClientObject;
   import alternativa.tanks.battle.BattleService;
   import alternativa.tanks.engine3d.EffectsMaterialRegistry;
   import alternativa.tanks.engine3d.§throw const switch§;
   import alternativa.tanks.utils.GraphicsUtils;
   import flash.display.BitmapData;
   import flash.filters.BitmapFilter;
   import §import const class§.§continue set each§;
   import §import const class§.§dynamic set catch§;
   import §import const class§.§set var finally§;
   import platform.client.fp10.core.resource.types.ImageResource;
   import platform.client.fp10.core.resource.types.MultiframeImageResource;
   
   public class §0#i§ extends §set var finally§ implements §continue set each§, § #K§
   {
      [Inject]
      public static var §@#R§:EffectsMaterialRegistry;
      
      [Inject]
      public static var battleService:BattleService;
      
      public function §0#i§()
      {
         super();
      }
      
      private static function §while package implements§(param1:MultiframeImageResource, param2:BitmapFilter) : §throw const switch§
      {
         return getTextureAnimation(param1,§&!_§.§;H§,param2);
      }
      
      private static function getTextureAnimation(param1:MultiframeImageResource, param2:Number, param3:BitmapFilter) : §throw const switch§
      {
         var _loc4_:§throw const switch§ = GraphicsUtils.getFilteredTextureAnimationFromResource(§@#R§,param1,param3);
         _loc4_.material.resolution = param2 / param1.frameWidth;
         return _loc4_;
      }
      
      private static function §4"6§(param1:String) : BitmapFilter
      {
         var _loc2_:§80§ = §80§(object.adapt(§80§));
         return _loc2_.createFilter(param1);
      }
      
      private static function §false set while§(param1:MultiframeImageResource, param2:BitmapFilter) : §throw const switch§
      {
         return getTextureAnimation(param1,§&!_§.§3"Z§,param2);
      }
      
      private static function §7-§(param1:MultiframeImageResource, param2:BitmapFilter) : §throw const switch§
      {
         return getTextureAnimation(param1,§&!_§.§3"Z§,param2);
      }
      
      private static function §finally const case§(param1:ImageResource) : TextureMaterial
      {
         var _loc2_:BitmapData = param1.data;
         var _loc3_:TextureMaterial = §@#R§.getMaterial(_loc2_);
         _loc3_.resolution = §catch const null§.§catch for do§ / _loc2_.height;
         return _loc3_;
      }
      
      private static function §each for get§(param1:BitmapData, param2:BitmapFilter) : TextureMaterial
      {
         var _loc3_:TextureMaterial = §@#R§.getMaterial(param1);
         _loc3_.resolution = §&!_§.§5Z§ / param1.height;
         return _loc3_;
      }
      
      [Obfuscation(rename="false")]
      public function objectLoadedPost(param1:ClientObject) : void
      {
         var _loc2_:§dynamic set catch§ = getInitParam();
         var _loc3_:§0!L§ = new §0!L§();
         _loc3_.§case package finally§ = §while package implements§(_loc2_.shotTexture,§4"6§("shot"));
         _loc3_.§get catch dynamic§ = §false set while§(_loc2_.explosionTexture,§4"6§("expl"));
         _loc3_.§1l§ = §7-§(_loc2_.bumpFlashTexture,§4"6§("expl"));
         _loc3_.§%1§ = §finally const case§(_loc2_.shotFlashTexture);
         _loc3_.§@#J§ = §each for get§(_loc2_.tailTrailTexutre.data,§4"6§("trail"));
         _loc3_.shotSound = _loc2_.shotSound.sound;
         _loc3_.ricochetSound = _loc2_.ricochetSound.sound;
         _loc3_.explosionSound = _loc2_.§4"M§.sound;
         var _loc4_:§false set false§ = §false set false§(object.adapt(§false set false§));
         _loc3_.§super default§ = _loc4_.§switch for return§("shot");
         _loc3_.§##X§ = _loc4_.§switch for return§("ricochet");
         _loc3_.§^]§ = _loc4_.§switch for return§("hit");
         _loc3_.§%!P§ = _loc4_.§switch for return§("bullet");
         param1.putParams(§0!L§,_loc3_);
         param1.putParams(§catch const null§,new §catch const null§(battleService,_loc3_));
      }
      
      [Obfuscation(rename="false")]
      public function objectUnloaded(param1:ClientObject) : void
      {
         var _loc2_:§0!L§ = this.§if var set§(param1);
         §@#R§.releaseMaterial(_loc2_.§get catch dynamic§.material);
         §@#R§.releaseMaterial(_loc2_.§1l§.material);
         §@#R§.releaseMaterial(_loc2_.§case package finally§.material);
         §@#R§.releaseMaterial(_loc2_.§%1§);
         §@#R§.releaseMaterial(_loc2_.§@#J§);
      }
      
      public function §if var set§(param1:ClientObject) : §0!L§
      {
         return §0!L§(param1.getParams(§0!L§));
      }
      
      public function §function package extends§(param1:ClientObject) : §catch const null§
      {
         return §catch const null§(param1.getParams(§catch const null§));
      }
   }
}

