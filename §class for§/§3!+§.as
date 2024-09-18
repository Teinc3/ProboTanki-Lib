package §class for§
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
   import platform.client.fp10.core.resource.types.ImageResource;
   import platform.client.fp10.core.resource.types.MultiframeImageResource;
   import §use catch get§.§extends const in§;
   import §use catch get§.§false each§;
   import §use catch get§.§false set default§;
   
   public class §3!+§ extends §false set default§ implements §extends const in§, §`#3§
   {
      [Inject]
      public static var §@#R§:EffectsMaterialRegistry;
      
      [Inject]
      public static var battleService:BattleService;
      
      private static const §continue set use§:§'#`§ = new §'#`§();
      
      public function §3!+§()
      {
         super();
      }
      
      private static function getTextureAnimation(param1:MultiframeImageResource, param2:Number, param3:BitmapFilter) : §throw const switch§
      {
         var _loc4_:§throw const switch§ = GraphicsUtils.getFilteredTextureAnimationFromResource(§@#R§,param1,param3);
         _loc4_.material.resolution = param2 / param1.frameWidth;
         return _loc4_;
      }
      
      private static function §each for get§(param1:BitmapData, param2:BitmapFilter) : TextureMaterial
      {
         var _loc3_:BitmapData = GraphicsUtils.createFilteredImage(param1,param2);
         var _loc4_:TextureMaterial;
         (_loc4_ = §@#R§.getMaterial(_loc3_)).repeat = true;
         return _loc4_;
      }
      
      private static function §4"6§(param1:String) : BitmapFilter
      {
         var _loc2_:§80§ = §80§(object.adapt(§80§));
         return _loc2_.createFilter(param1);
      }
      
      [Obfuscation(rename="false")]
      public function objectLoadedPost(param1:ClientObject) : void
      {
         var _loc2_:§false each§ = getInitParam();
         var _loc3_:§return continue§ = new §return continue§();
         var _loc4_:BitmapFilter = §4"6§("trail");
         _loc3_.§dynamic implements§ = §each for get§(_loc2_.trailImage.data,_loc4_);
         _loc3_.§-$!§ = §each for get§(_loc2_.smokeImage.data,_loc4_);
         _loc3_.§5#W§ = §@#R§.getMaterial(_loc2_.hitMarkTexture.data);
         _loc3_.§2!P§ = this.§0!u§(_loc2_.chargingPart1,_loc2_.chargingPart2,_loc2_.chargingPart3,§4"6§("charge"));
         _loc3_.§2#F§ = getTextureAnimation(_loc2_.ringsTexture,§^!4§.§>!T§,_loc4_);
         _loc3_.§package const package§ = getTextureAnimation(_loc2_.sphereTexture,§^!4§.§implements package with§,_loc4_);
         _loc3_.§native const super§ = getTextureAnimation(_loc2_.powTexture,§^!4§.§override var override§,_loc4_);
         _loc3_.sound = _loc2_.shotSound.sound;
         var _loc5_:§false set false§ = §false set false§(object.adapt(§false set false§));
         _loc3_.§+#I§ = _loc5_.§switch for return§("charge");
         _loc3_.§super default§ = _loc5_.§switch for return§("shot");
         _loc3_.§^]§ = _loc5_.§switch for return§("hit");
         _loc3_.§final var true§ = _loc5_.§switch for return§("rail");
         param1.putParams(§return continue§,_loc3_);
      }
      
      private function §0!u§(param1:ImageResource, param2:ImageResource, param3:ImageResource, param4:BitmapFilter) : §throw const switch§
      {
         var _loc5_:BitmapData = GraphicsUtils.createFilteredImage(§continue set use§.getTexture(param1,param2,param3),param4);
         var _loc6_:int = _loc5_.height;
         var _loc7_:§throw const switch§ = GraphicsUtils.getTextureAnimation(§@#R§,_loc5_,_loc6_,_loc6_);
         _loc7_.material.resolution = §^!4§.§do try§ / _loc6_;
         return _loc7_;
      }
      
      [Obfuscation(rename="false")]
      public function objectUnloaded(param1:ClientObject) : void
      {
         var _loc2_:§return continue§ = §return continue§(param1.getParams(§return continue§));
         §@#R§.releaseMaterial(_loc2_.§dynamic implements§);
         §@#R§.releaseMaterial(_loc2_.§-$!§);
         §@#R§.releaseMaterial(_loc2_.§2!P§.material);
         §@#R§.releaseMaterial(_loc2_.§5#W§);
         §@#R§.releaseMaterial(_loc2_.§2#F§.material);
         §@#R§.releaseMaterial(_loc2_.§package const package§.material);
         §@#R§.releaseMaterial(_loc2_.§native const super§.material);
      }
      
      public function §continue for each§(param1:ClientObject) : §7#c§
      {
         return new §^!4§(§return continue§(param1.getParams(§return continue§)),battleService);
      }
   }
}

