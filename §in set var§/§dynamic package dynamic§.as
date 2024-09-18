package §in set var§
{
   import §6!u§.§false set false§;
   import §8#@§.§0""§;
   import §8#@§.§final const continue§;
   import §8#@§.§if for static§;
   import alternativa.object.ClientObject;
   import alternativa.tanks.battle.BattleService;
   import alternativa.tanks.engine3d.EffectsMaterialRegistry;
   import alternativa.tanks.engine3d.§throw const switch§;
   import alternativa.tanks.utils.GraphicsUtils;
   import §finally package else§.§;!q§;
   import §if set import§.§3"3§;
   import platform.client.fp10.core.resource.types.MultiframeImageResource;
   import §switch var return§.§null package throw§;
   
   public class §dynamic package dynamic§ extends §if for static§ implements §0""§, §"#@§
   {
      [Inject]
      public static var §@#R§:EffectsMaterialRegistry;
      
      [Inject]
      public static var battleService:BattleService;
      
      public function §dynamic package dynamic§()
      {
         super();
      }
      
      private static function §4!u§(param1:MultiframeImageResource) : §throw const switch§
      {
         var _loc2_:§throw const switch§ = GraphicsUtils.getTextureAnimationFromResource(§@#R§,param1);
         _loc2_.material.resolution = §`#,§.§?!-§ / param1.frameWidth;
         return _loc2_;
      }
      
      private static function §+"u§(param1:MultiframeImageResource) : §throw const switch§
      {
         var _loc2_:§throw const switch§ = GraphicsUtils.getTextureAnimationFromResource(§@#R§,param1);
         _loc2_.material.resolution = §`#,§.§in static§ / param1.frameWidth;
         return _loc2_;
      }
      
      public function initColorTransform(param1:ClientObject, param2:Vector.<§;!q§>) : void
      {
         var _loc3_:§null package throw§ = §null package throw§(param1.getParams(§null package throw§));
         _loc3_.§return throw§ = param2;
      }
      
      [Obfuscation(rename="false")]
      public function objectLoaded(param1:ClientObject) : void
      {
         var _loc2_:§final const continue§ = getInitParam();
         var _loc3_:§null package throw§ = new §null package throw§();
         _loc3_.§18§ = §4!u§(_loc2_.fireTexture);
         _loc3_.§if var package§ = §+"u§(_loc2_.muzzlePlaneTexture);
         _loc3_.§catch var super§ = _loc2_.flameSound.sound;
         _loc3_.particleSpeed = §`#,§.§class catch dynamic§;
         var _loc4_:§false set false§ = §false set false§(object.adapt(§false set false§));
         _loc3_.§function package use§ = _loc4_.§switch for return§("start");
         _loc3_.§continue package false§ = _loc4_.§switch for return§("loop");
         _loc3_.§+#c§ = _loc4_.§switch for return§("startFire");
         _loc3_.§break package implements§ = _loc4_.§switch for return§("loopFire");
         param1.putParams(§null package throw§,_loc3_);
      }
      
      [Obfuscation(rename="false")]
      public function objectUnloaded(param1:ClientObject) : void
      {
         var _loc2_:§null package throw§ = §null package throw§(param1.getParams(§null package throw§));
         §@#R§.releaseMaterial(_loc2_.§18§.material);
         §@#R§.releaseMaterial(_loc2_.§if var package§.material);
      }
      
      public function §!"2§(param1:Number, param2:Number, param3:ClientObject) : §3"3§
      {
         var _loc4_:§null package throw§ = §null package throw§(param3.getParams(§null package throw§));
         return new §!#B§(battleService.§class while§(),param1,param2,_loc4_);
      }
   }
}

