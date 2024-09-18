package §in const true§
{
   import §4"%§.§80§;
   import §6!u§.§false set false§;
   import §^#G§.§3#>§;
   import §^#G§.§catch package extends§;
   import §^#G§.§try set each§;
   import alternativa.engine3d.materials.TextureMaterial;
   import alternativa.object.ClientObject;
   import alternativa.tanks.battle.BattleService;
   import alternativa.tanks.engine3d.EffectsMaterialRegistry;
   import alternativa.tanks.engine3d.§throw const switch§;
   import alternativa.tanks.utils.GraphicsUtils;
   import flash.display.BitmapData;
   import flash.filters.BitmapFilter;
   import platform.client.fp10.core.resource.types.MultiframeImageResource;
   
   public class §^!W§ extends §catch package extends§ implements §try set each§, §include var dynamic§
   {
      [Inject]
      public static var battleService:BattleService;
      
      [Inject]
      public static var §@#R§:EffectsMaterialRegistry;
      
      public function §^!W§()
      {
         super();
      }
      
      private static function §finally const case§(param1:BitmapData, param2:BitmapFilter) : TextureMaterial
      {
         var _loc3_:BitmapData = GraphicsUtils.createFilteredImage(param1,param2);
         var _loc4_:TextureMaterial;
         (_loc4_ = §@#R§.getMaterial(_loc3_)).resolution = §const var if§.§^!$§ / param1.height;
         return _loc4_;
      }
      
      private static function §null catch return§(param1:MultiframeImageResource, param2:BitmapFilter) : §throw const switch§
      {
         return getTextureAnimation(param1,param2,§try import§.§;H§);
      }
      
      private static function §false set while§(param1:MultiframeImageResource, param2:BitmapFilter) : §throw const switch§
      {
         return getTextureAnimation(param1,param2,§try import§.§3"Z§);
      }
      
      private static function getTextureAnimation(param1:MultiframeImageResource, param2:BitmapFilter, param3:Number) : §throw const switch§
      {
         var _loc4_:§throw const switch§ = GraphicsUtils.getFilteredTextureAnimationFromResource(§@#R§,param1,param2);
         _loc4_.material.resolution = param3 / param1.frameWidth;
         return _loc4_;
      }
      
      private static function §4"6§(param1:String) : BitmapFilter
      {
         var _loc2_:§80§ = §80§(object.adapt(§80§));
         return _loc2_.createFilter(param1);
      }
      
      private static function §<V§(param1:§implements package in§) : void
      {
         §@#R§.releaseMaterial(param1.§%1§);
         §@#R§.releaseMaterial(param1.§case package finally§.material);
         §@#R§.releaseMaterial(param1.§get catch dynamic§.material);
         §@#R§.releaseMaterial(param1.§5#W§);
      }
      
      public function §%H§(param1:ClientObject) : §const var if§
      {
         return §const var if§(param1.getParams(§const var if§));
      }
      
      public function §@!1§(param1:ClientObject) : §implements package in§
      {
         return §implements package in§(param1.getParams(§implements package in§));
      }
      
      [Obfuscation(rename="false")]
      public function objectLoadedPost(param1:ClientObject) : void
      {
         var _loc2_:§3#>§ = getInitParam();
         var _loc3_:§implements package in§ = new §implements package in§();
         _loc3_.§%1§ = §finally const case§(_loc2_.muzzleFlashTexture.data,§4"6§("flash"));
         _loc3_.§case package finally§ = §null catch return§(_loc2_.shotTexture,§4"6§("shot"));
         _loc3_.§get catch dynamic§ = §false set while§(_loc2_.explosionTexture,§4"6§("expl"));
         _loc3_.§5#W§ = §@#R§.getMaterial(_loc2_.hitMarkTexture.data);
         _loc3_.shotSound = _loc2_.shotSound.sound;
         var _loc4_:§false set false§ = §false set false§(object.adapt(§false set false§));
         _loc3_.§9#9§ = _loc4_.§switch for return§("shot");
         _loc3_.§override for while§ = _loc4_.§switch for return§("bullet");
         _loc3_.§import var else§ = _loc4_.§switch for return§("hit");
         param1.putParams(§implements package in§,_loc3_);
         param1.putParams(§const var if§,new §const var if§(battleService,_loc3_));
      }
      
      [Obfuscation(rename="false")]
      public function objectUnloaded(param1:ClientObject) : void
      {
         §<V§(this.§@!1§(param1));
      }
   }
}

