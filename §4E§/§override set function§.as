package §4E§
{
   import §6!u§.§false set false§;
   import alternativa.engine3d.materials.TextureMaterial;
   import alternativa.object.ClientObject;
   import alternativa.tanks.battle.BattleService;
   import alternativa.tanks.engine3d.EffectsMaterialRegistry;
   import alternativa.tanks.engine3d.§throw const switch§;
   import alternativa.tanks.models.weapon.smoky.§<"=§;
   import alternativa.tanks.models.weapon.smoky.§if catch super§;
   import alternativa.tanks.utils.GraphicsUtils;
   import §const set catch§.§7!!§;
   import §const set catch§.§function for false§;
   import §const set catch§.§try implements§;
   import platform.client.fp10.core.resource.types.ImageResource;
   import platform.client.fp10.core.resource.types.MultiframeImageResource;
   
   public class §override set function§ extends §function for false§ implements §try implements§, §use var break§
   {
      [Inject]
      public static var §@#R§:EffectsMaterialRegistry;
      
      [Inject]
      public static var battleService:BattleService;
      
      public function §override set function§()
      {
         super();
      }
      
      private static function §finally const case§(param1:ImageResource) : TextureMaterial
      {
         var _loc2_:TextureMaterial = §@#R§.getMaterial(param1.data);
         _loc2_.resolution = §if catch super§.§if catch static§ / param1.data.height;
         return _loc2_;
      }
      
      private static function §3!O§(param1:MultiframeImageResource, param2:int) : §throw const switch§
      {
         var _loc3_:§throw const switch§ = GraphicsUtils.getTextureAnimationFromResource(§@#R§,param1);
         _loc3_.material.resolution = param2 / param1.frameWidth;
         return _loc3_;
      }
      
      [Obfuscation(rename="false")]
      public function objectLoaded(param1:ClientObject) : void
      {
         var _loc2_:§7!!§ = getInitParam();
         var _loc3_:§0!<§ = new §0!<§();
         _loc3_.§%1§ = §finally const case§(_loc2_.shotTexture);
         _loc3_.§get catch dynamic§ = §3!O§(_loc2_.explosionTexture,_loc2_.explosionSize);
         _loc3_.§4!8§ = §@#R§.getMaterial(_loc2_.explosionMarkTexture.data);
         _loc3_.§break const with§ = §3!O§(_loc2_.criticalHitTexture,_loc2_.criticalHitSize);
         _loc3_.criticalHitSize = _loc2_.criticalHitSize;
         _loc3_.shotSound = _loc2_.shotSound.sound;
         _loc3_.explosionSound = _loc2_.explosionSound.sound;
         _loc3_.explosionSize = _loc2_.explosionSize;
         var _loc4_:§false set false§ = §false set false§(object.adapt(§false set false§));
         _loc3_.§super default§ = _loc4_.§switch for return§("shot");
         _loc3_.§^]§ = _loc4_.§switch for return§("hit");
         param1.putParams(§0!<§,_loc3_);
      }
      
      [Obfuscation(rename="false")]
      public function objectUnloaded(param1:ClientObject) : void
      {
         var _loc2_:§0!<§ = §0!<§(param1.getParams(§0!<§));
         §@#R§.releaseMaterial(_loc2_.§%1§);
         §@#R§.releaseMaterial(_loc2_.§get catch dynamic§.material);
         §@#R§.releaseMaterial(_loc2_.§4!8§);
         §@#R§.releaseMaterial(_loc2_.§break const with§.material);
      }
      
      public function §continue for each§(param1:ClientObject) : §<"=§
      {
         var _loc2_:§0!<§ = §0!<§(param1.getParams(§0!<§));
         return new §1"c§(battleService.§'x§().§'M§(),battleService.§class while§(),_loc2_);
      }
   }
}

