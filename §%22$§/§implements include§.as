package §"$§
{
   import §7"j§.§'#h§;
   import §7"j§.§do set case§;
   import §7"j§.§implements for break§;
   import alternativa.math.Vector3;
   import alternativa.object.ClientObject;
   import alternativa.osgi.OSGi;
   import alternativa.physics.Body;
   import alternativa.tanks.battle.BattleService;
   import alternativa.tanks.battle.objects.tank.Tank;
   import alternativa.tanks.battle.objects.tank.§continue var case§;
   import alternativa.types.Long;
   import §dynamic set final§.§;#,§;
   import §dynamic set final§.§in set extends§;
   import flash.media.Sound;
   import platform.client.fp10.core.registry.ResourceRegistry;
   import platform.client.fp10.core.resource.types.SoundResource;
   
   public class §implements include§ extends §in set extends§ implements §;#,§, §import set class§
   {
      [Inject]
      public static var battleService:BattleService;
      
      private var listener:§do set switch§;
      
      private var §include static§:int;
      
      public function §implements include§()
      {
         super();
      }
      
      [Obfuscation(rename="false")]
      public function objectLoaded() : void
      {
         if(this.listener == null)
         {
            this.listener = new §do set switch§(null);
         }
         ++this.§include static§;
      }
      
      [Obfuscation(rename="false")]
      public function objectUnloaded() : void
      {
         --this.§include static§;
         if(this.§include static§ == 0)
         {
            this.listener.close();
            this.listener = null;
         }
      }
      
      public function §+>§(param1:Tank, param2:int) : void
      {
         var _loc3_:Tank = param1;
         if(_loc3_.state == §continue var case§.DEAD)
         {
            this.§extends for finally§(param1.§if for with§(),param2);
         }
         else
         {
            this.§in set while§(_loc3_,param2);
         }
      }
      
      private function §extends for finally§(param1:ClientObject, param2:int) : void
      {
         var _loc3_:§[#D§ = new §[#D§(param1,param2);
         param1.putParams(§[#D§,_loc3_);
      }
      
      private function §in set while§(param1:Tank, param2:int) : void
      {
         var _loc3_:§'#h§ = new §'#h§();
         _loc3_.§&N§(param1,param2);
         this.§`#y§(param1);
      }
      
      private function §`#y§(param1:Tank) : void
      {
         var _loc2_:Sound = null;
         var _loc3_:§implements for break§ = null;
         var _loc4_:Body = null;
         var _loc5_:Vector3 = null;
         var _loc6_:§do set case§ = null;
         var _loc7_:Sound = SoundResource(ResourceRegistry(OSGi.getInstance().getService(ResourceRegistry)).getResource(Long.getLong(0,158174))).sound;
         if(_loc7_ != null)
         {
            _loc2_ = _loc7_;
            _loc3_ = §implements for break§.create(_loc2_);
            _loc4_ = param1.§0"t§();
            _loc5_ = _loc4_.state.position.clone();
            _loc6_ = §do set case§.create(_loc5_,_loc3_,0,0);
            battleService.§"#D§(_loc6_);
         }
      }
   }
}

