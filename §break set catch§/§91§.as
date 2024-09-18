package §break set catch§
{
   import §-#^§.§,e§;
   import §-#^§.§3!"§;
   import §-#^§.§false catch true§;
   import §6!u§.§false set false§;
   import alternativa.object.ClientObject;
   import alternativa.tanks.battle.§+$%§;
   import alternativa.tanks.battle.BattleService;
   import alternativa.tanks.engine3d.EffectsMaterialRegistry;
   import alternativa.tanks.engine3d.§throw const switch§;
   import alternativa.tanks.utils.GraphicsUtils;
   import §if set import§.§3"3§;
   import platform.client.fp10.core.resource.types.MultiframeImageResource;
   import §switch var return§.§null package throw§;
   
   public class §91§ extends §3!"§ implements §,e§, §finally const if§
   {
      [Inject]
      public static var battleService:BattleService;
      
      [Inject]
      public static var §@#R§:EffectsMaterialRegistry;
      
      public function §91§()
      {
         super();
      }
      
      [Obfuscation(rename="false")]
      public function objectLoaded(param1:ClientObject) : void
      {
         var _loc2_:§false catch true§ = getInitParam();
         var _loc3_:§null package throw§ = new §null package throw§();
         _loc3_.§18§ = this.§4!u§(_loc2_.particleTextureResource);
         _loc3_.§if var package§ = this.§+"u§(_loc2_.planeTextureResource);
         _loc3_.particleSpeed = §+$%§.§use final§(_loc2_.particleSpeed);
         _loc3_.§catch var super§ = _loc2_.shotSoundResource.sound;
         var _loc4_:§false set false§ = §false set false§(object.adapt(§false set false§));
         _loc3_.§function package use§ = _loc4_.§switch for return§("start");
         _loc3_.§continue package false§ = _loc4_.§switch for return§("loop");
         _loc3_.§+#c§ = _loc4_.§switch for return§("startFire");
         _loc3_.§break package implements§ = _loc4_.§switch for return§("loopFire");
         param1.putParams(§null package throw§,_loc3_);
      }
      
      private function §4!u§(param1:MultiframeImageResource) : §throw const switch§
      {
         var _loc2_:§throw const switch§ = GraphicsUtils.getTextureAnimationFromResource(§@#R§,param1);
         _loc2_.material.resolution = §implements package get§.§?!-§ / param1.frameWidth;
         return _loc2_;
      }
      
      private function §+"u§(param1:MultiframeImageResource) : §throw const switch§
      {
         var _loc2_:§throw const switch§ = GraphicsUtils.getTextureAnimationFromResource(§@#R§,param1);
         _loc2_.material.resolution = §implements package get§.§in static§ / param1.frameWidth;
         return _loc2_;
      }
      
      [Obfuscation(rename="false")]
      public function objectUnloaded(param1:ClientObject) : void
      {
         var _loc2_:§null package throw§ = §null package throw§(param1.getParams(§null package throw§));
         §@#R§.releaseMaterial(_loc2_.§18§.material);
         §@#R§.releaseMaterial(_loc2_.§if var package§.material);
      }
      
      public function §import set false§(param1:Number, param2:Number, param3:ClientObject) : §3"3§
      {
         var _loc4_:§null package throw§ = §null package throw§(param3.getParams(§null package throw§));
         return new §+"R§(battleService.§class while§(),param1,param2,_loc4_);
      }
   }
}

