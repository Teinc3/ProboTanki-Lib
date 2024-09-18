package §case include§
{
   import §4"%§.§80§;
   import §6!u§.§false set false§;
   import §<#&§.§%!q§;
   import §<#&§.§7B§;
   import §<#&§.§?#W§;
   import alternativa.engine3d.materials.TextureMaterial;
   import alternativa.object.ClientObject;
   import alternativa.tanks.battle.BattleService;
   import alternativa.tanks.engine3d.EffectsMaterialRegistry;
   import alternativa.tanks.engine3d.§throw const switch§;
   import alternativa.tanks.engine3d.§try set break§;
   import alternativa.tanks.utils.GraphicsUtils;
   import flash.display.BitmapData;
   import flash.filters.BitmapFilter;
   import platform.client.fp10.core.resource.types.MultiframeImageResource;
   
   public class §const package in§ extends §?#W§ implements §%!q§, §!!U§
   {
      [Inject]
      public static var §@#R§:EffectsMaterialRegistry;
      
      [Inject]
      public static var battleService:BattleService;
      
      public function §const package in§()
      {
         super();
      }
      
      private static function §>#W§(param1:BitmapData, param2:BitmapFilter = null) : TextureMaterial
      {
         var _loc3_:BitmapData = param2 != null ? GraphicsUtils.createFilteredImage(param1,param2) : param1;
         var _loc4_:TextureMaterial;
         (_loc4_ = §@#R§.getMaterial(_loc3_)).repeat = true;
         return _loc4_;
      }
      
      private static function §in implements§(param1:Vector.<§try set break§>) : Vector.<§try set break§>
      {
         var _loc2_:Vector.<§try set break§> = new Vector.<§try set break§>();
         var _loc3_:int = int(param1.length - 1);
         while(_loc3_ >= 0)
         {
            _loc2_.push(param1[_loc3_]);
            _loc3_--;
         }
         return _loc2_;
      }
      
      [Obfuscation(rename="false")]
      public function objectLoadedPost(param1:ClientObject) : void
      {
         var _loc2_:§7B§ = getInitParam();
         var _loc3_:§80§ = §80§(object.adapt(§80§));
         var _loc4_:§&!$§ = new §&!$§();
         var _loc5_:MultiframeImageResource = _loc2_.healingBall;
         var _loc6_:TextureMaterial = §>#W§(_loc2_.healingBall.data);
         var _loc7_:TextureMaterial = §>#W§(_loc2_.healingBall.data,_loc3_.createFilter("hss"));
         var _loc8_:TextureMaterial = §>#W§(_loc2_.healingRay.data,_loc3_.createFilter("hs"));
         var _loc9_:TextureMaterial = §>#W§(_loc2_.damagingBall.data,_loc3_.createFilter("dss"));
         var _loc10_:TextureMaterial = §>#W§(_loc2_.damagingRay.data,_loc3_.createFilter("ds"));
         var _loc11_:Vector.<§try set break§> = GraphicsUtils.getUVFramesFromTexture(_loc6_.texture,_loc5_.frameWidth,_loc5_.frameHeight,_loc5_.numFrames);
         var _loc12_:Vector.<§try set break§> = §in implements§(_loc11_);
         _loc4_.§try package final§ = new §throw const switch§(_loc6_,_loc11_,_loc5_.fps);
         _loc4_.idleSound = _loc2_.idleSound.sound;
         _loc4_.§9"r§ = new §throw const switch§(_loc7_,_loc11_,_loc5_.fps);
         _loc4_.§2!d§ = new §throw const switch§(_loc7_,_loc12_,_loc5_.fps);
         _loc4_.§override var set§ = _loc8_;
         _loc4_.§!#=§ = _loc2_.healingSound.sound;
         _loc4_.§false return§ = new §throw const switch§(_loc9_,_loc12_,_loc5_.fps);
         _loc4_.§5"$§ = new §throw const switch§(_loc9_,_loc11_,_loc5_.fps);
         _loc4_.§68§ = _loc10_;
         _loc4_.§false const package§ = _loc2_.damagingSound.sound;
         var _loc13_:§false set false§ = §false set false§(object.adapt(§false set false§));
         _loc4_.§function package use§ = _loc13_.§switch for return§("start");
         _loc4_.§continue package false§ = _loc13_.§switch for return§("loop");
         _loc4_.§import catch else§ = _loc13_.§switch for return§("friendStart");
         _loc4_.§function catch null§ = _loc13_.§switch for return§("friendLoop");
         _loc4_.§return true§ = _loc13_.§switch for return§("enemyStart");
         _loc4_.§9"m§ = _loc13_.§switch for return§("enemyLoop");
         _loc4_.§8#t§ = _loc13_.§switch for return§("friendBeam");
         _loc4_.§each for override§ = _loc13_.§switch for return§("enemyBeam");
         param1.putParams(§&!$§,_loc4_);
      }
      
      [Obfuscation(rename="false")]
      public function objectUnloaded(param1:ClientObject) : void
      {
         var _loc2_:§&!$§ = §&!$§(param1.getParams(§&!$§));
         §@#R§.releaseMaterial(_loc2_.§try package final§.material);
         §@#R§.releaseMaterial(_loc2_.§9"r§.material);
         §@#R§.releaseMaterial(_loc2_.§override var set§);
         §@#R§.releaseMaterial(_loc2_.§false return§.material);
         §@#R§.releaseMaterial(_loc2_.§68§);
      }
      
      public function §else const const§(param1:ClientObject) : §finally set if§
      {
         return new §each for function§(battleService,§&!$§(param1.getParams(§&!$§)));
      }
   }
}

