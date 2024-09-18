package §+Q§
{
   import §6!u§.§false set false§;
   import §>!X§.§case catch catch§;
   import §>!X§.§continue package with§;
   import §>!X§.§in each§;
   import alternativa.engine3d.materials.TextureMaterial;
   import alternativa.object.ClientObject;
   import alternativa.tanks.battle.BattleService;
   import alternativa.tanks.engine3d.EffectsMaterialRegistry;
   import alternativa.tanks.engine3d.§throw const switch§;
   import alternativa.tanks.utils.GraphicsUtils;
   import flash.display.BitmapData;
   import platform.client.fp10.core.resource.types.ImageResource;
   import platform.client.fp10.core.resource.types.MultiframeImageResource;
   
   public class §set if§ extends §case catch catch§ implements §continue package with§, §40§
   {
      [Inject]
      public static var §@#R§:EffectsMaterialRegistry;
      
      [Inject]
      public static var battleService:BattleService;
      
      public function §set if§()
      {
         super();
      }
      
      private static function §finally const case§(param1:ImageResource) : TextureMaterial
      {
         var _loc2_:BitmapData = param1.data;
         var _loc3_:TextureMaterial = §@#R§.getMaterial(_loc2_);
         _loc3_.resolution = §="k§.§function catch static§ / _loc2_.height;
         return _loc3_;
      }
      
      private static function §false set while§(param1:MultiframeImageResource, param2:Number) : §throw const switch§
      {
         var _loc3_:§throw const switch§ = GraphicsUtils.getTextureAnimationFromResource(§@#R§,param1);
         _loc3_.material.resolution = param2 / param1.frameWidth;
         return _loc3_;
      }
      
      [Obfuscation(rename="false")]
      public function objectLoaded(param1:ClientObject) : void
      {
         var _loc2_:§in each§ = getInitParam();
         var _loc3_:§set const return§ = new §set const return§();
         _loc3_.§%1§ = §finally const case§(_loc2_.shotTexture);
         _loc3_.§get catch dynamic§ = §false set while§(_loc2_.explosionTexture,_loc2_.explosionSize);
         _loc3_.explosionSize = _loc2_.explosionSize;
         _loc3_.shotSound = _loc2_.shotSound.sound;
         _loc3_.explosionSound = _loc2_.explosionSound.sound;
         _loc3_.§4!8§ = §@#R§.getMaterial(_loc2_.explosionMarkTexture.data);
         var _loc4_:§false set false§ = §false set false§(object.adapt(§false set false§));
         _loc3_.§super default§ = _loc4_.§switch for return§("shot");
         _loc3_.§^]§ = _loc4_.§switch for return§("hit");
         param1.putParams(§set const return§,_loc3_);
      }
      
      [Obfuscation(rename="false")]
      public function objectUnloaded(param1:ClientObject) : void
      {
         var _loc2_:§set const return§ = §set const return§(param1.getParams(§set const return§));
         §@#R§.releaseMaterial(_loc2_.§%1§);
         §@#R§.releaseMaterial(_loc2_.§get catch dynamic§.material);
         §@#R§.releaseMaterial(_loc2_.§4!8§);
      }
      
      public function §continue for each§(param1:ClientObject) : §7#'§
      {
         return new §<§(battleService,§set const return§(param1.getParams(§set const return§)));
      }
   }
}

