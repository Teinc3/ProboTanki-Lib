package §+Q§
{
   import §7"j§.§<"z§;
   import §7"j§.§do set case§;
   import §7"j§.§extends super§;
   import §7"j§.§implements for break§;
   import §7"j§.set;
   import §7"j§.§while var if§;
   import alternativa.engine3d.core.Object3D;
   import alternativa.math.Matrix4;
   import alternativa.math.Vector3;
   import alternativa.tanks.battle.BattleService;
   import §extends for const§.§import use§;
   
   public class §<§ implements §7#'§
   {
      private static const §8!r§:Number = 0.7;
      
      private static const §import package§:Number = 0.7;
      
      private static const §!%§:Number = 110;
      
      private static const §case package switch§:Number = 250;
      
      private static const §with const false§:Matrix4 = new Matrix4();
      
      private static const §6u§:Vector3 = new Vector3();
      
      private var battleService:BattleService;
      
      private var sfxData:§set const return§;
      
      public function §<§(param1:BattleService, param2:§set const return§)
      {
         super();
         this.battleService = param1;
         this.sfxData = param2;
      }
      
      public function § #'§(param1:Vector3, param2:Object3D) : void
      {
         var _loc3_:§="k§ = §="k§(this.battleService.§class while§().getObject(§="k§));
         _loc3_.init(param2,param1,this.sfxData.§%1§);
         this.battleService.§7"0§(_loc3_);
         §with const false§.setMatrix(param2.x,param2.y,param2.z,param2.rotationX,param2.rotationY,param2.rotationZ);
         §with const false§.transformVector(param1,§6u§);
         var _loc4_:§implements for break§ = §implements for break§.create(this.sfxData.shotSound,§8!r§);
         this.battleService.§"#D§(§do set case§.create(§6u§,_loc4_));
         this.§use const use§(param1,param2);
      }
      
      public function §use const use§(param1:Vector3, param2:Object3D) : void
      {
         var _loc3_:§while var if§ = §while var if§(this.battleService.§class while§().getObject(§while var if§));
         var _loc4_:§extends super§ = §extends super§(this.battleService.§class while§().getObject(§extends super§));
         _loc4_.init(param2,param1);
         _loc3_.init(_loc4_,this.sfxData.§super default§);
         this.battleService.§7"0§(_loc3_);
      }
      
      public function §throw catch use§(param1:Vector3) : void
      {
         this.§8!J§(param1);
         this.§8"a§(param1);
         this.§package set else§(param1);
      }
      
      private function §package set else§(param1:Vector3) : void
      {
         var _loc2_:§while var if§ = §while var if§(this.battleService.§class while§().getObject(§while var if§));
         var _loc3_:set = set(this.battleService.§class while§().getObject(set));
         _loc3_.init(param1,§!%§);
         _loc2_.init(_loc3_,this.sfxData.§^]§);
         this.battleService.§7"0§(_loc2_);
      }
      
      public function §!"F§(param1:Vector3, param2:Vector3) : void
      {
         this.battleService.§3l§().addDecal(param2,param1,§case package switch§,this.sfxData.§4!8§);
      }
      
      private function §8!J§(param1:Vector3) : void
      {
         var _loc2_:§import use§ = this.battleService.§class while§();
         var _loc3_:set = set(_loc2_.getObject(set));
         _loc3_.init(param1,§!%§);
         var _loc4_:§<"z§ = §<"z§(_loc2_.getObject(§<"z§));
         _loc4_.init(this.sfxData.explosionSize,this.sfxData.explosionSize,this.sfxData.§get catch dynamic§,Math.random() * 2 * Math.PI,_loc3_);
         this.battleService.§7"0§(_loc4_);
      }
      
      private function §8"a§(param1:Vector3) : void
      {
         var _loc2_:§implements for break§ = §implements for break§.create(this.sfxData.explosionSound,§import package§);
         this.battleService.§"#D§(§do set case§.create(param1,_loc2_));
      }
   }
}

