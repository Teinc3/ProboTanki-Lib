package alternativa.tanks.models.weapon.shaft
{
   import §-Q§.§,!P§;
   import §-Q§.§do set package§;
   import §-Q§.§false const switch§;
   import §4"%§.§80§;
   import §6!u§.§false set false§;
   import §`a§.§default for final§;
   import alternativa.engine3d.materials.TextureMaterial;
   import alternativa.object.ClientObject;
   import alternativa.tanks.battle.BattleService;
   import alternativa.tanks.engine3d.EffectsMaterialRegistry;
   import alternativa.tanks.engine3d.§throw const switch§;
   import alternativa.tanks.utils.GraphicsUtils;
   import flash.display.BitmapData;
   import flash.filters.BitmapFilter;
   import flash.media.Sound;
   import platform.client.fp10.core.resource.types.MultiframeImageResource;
   
   public class §=#k§ extends §false const switch§ implements §,!P§, §var var with§
   {
      [Inject]
      public static var §@#R§:EffectsMaterialRegistry;
      
      [Inject]
      public static var battleService:BattleService;
      
      public function §=#k§()
      {
         super();
      }
      
      private static function §static var super§(param1:String) : BitmapFilter
      {
         var _loc2_:§80§ = §80§(object.adapt(§80§));
         return _loc2_.createFilter(param1);
      }
      
      private static function getTextureAnimation(param1:MultiframeImageResource, param2:BitmapFilter, param3:Number) : §throw const switch§
      {
         var _loc4_:§throw const switch§ = GraphicsUtils.getFilteredTextureAnimationFromResource(§@#R§,param1,param2);
         _loc4_.material.resolution = param3 / param1.frameWidth;
         return _loc4_;
      }
      
      private static function §each for get§(param1:BitmapData, param2:BitmapFilter) : TextureMaterial
      {
         var _loc3_:BitmapData = GraphicsUtils.createFilteredImage(param1,param2);
         var _loc4_:TextureMaterial;
         (_loc4_ = §@#R§.getMaterial(_loc3_)).resolution = §default for final§.WIDTH / _loc3_.width;
         return _loc4_;
      }
      
      [Obfuscation(rename="false")]
      public function objectLoadedPost(param1:ClientObject) : void
      {
         var _loc2_:§do set package§ = getInitParam();
         var _loc3_:Sound = _loc2_.targetingSound.sound;
         var _loc4_:Sound = _loc2_.zoomModeSound.sound;
         var _loc5_:Sound = _loc2_.shotSound.sound;
         var _loc6_:Sound = _loc2_.explosionSound.sound;
         var _loc7_:BitmapFilter = §static var super§("def");
         var _loc8_:§throw const switch§ = getTextureAnimation(_loc2_.muzzleFlashTexture,_loc7_,§=#n§.§catch for do§);
         var _loc9_:§throw const switch§ = getTextureAnimation(_loc2_.explosionTexture,_loc7_,§=#n§.§"#j§);
         var _loc10_:TextureMaterial = §each for get§(_loc2_.trailTexture.data,_loc7_);
         var _loc11_:TextureMaterial = §@#R§.getMaterial(_loc2_.hitMarkTexture.data);
         var _loc12_:Number = 500;
         var _loc13_:§'V§ = new §'V§(_loc5_,_loc6_,_loc4_,_loc3_,_loc8_,_loc10_,_loc9_,_loc11_,_loc12_);
         var _loc14_:§false set false§ = §false set false§(object.adapt(§false set false§));
         _loc13_.§super default§ = _loc14_.§switch for return§("shot");
         _loc13_.§^]§ = _loc14_.§switch for return§("hit");
         param1.putParams(§'V§,_loc13_);
      }
      
      [Obfuscation(rename="false")]
      public function objectUnloaded(param1:ClientObject) : void
      {
         var _loc2_:§'V§ = §'V§(param1.getParams(§'V§));
         §@#R§.releaseMaterial(_loc2_.§dynamic implements§);
         §@#R§.releaseMaterial(_loc2_.§[#L§.material);
         §@#R§.releaseMaterial(_loc2_.§get catch dynamic§.material);
         §@#R§.releaseMaterial(_loc2_.§5#W§);
      }
      
      public function §continue for each§(param1:ClientObject) : §=#n§
      {
         var _loc2_:§'V§ = §'V§(param1.getParams(§'V§));
         return new §=#n§(_loc2_,battleService);
      }
   }
}

