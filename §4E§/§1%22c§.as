package §4E§
{
   import §14§.§7"]§;
   import §7"j§.§<"z§;
   import §7"j§.§=&§;
   import §7"j§.§do set case§;
   import §7"j§.§extends super§;
   import §7"j§.§implements for break§;
   import §7"j§.set;
   import §7"j§.§while var if§;
   import alternativa.engine3d.core.Object3D;
   import alternativa.math.Vector3;
   import alternativa.tanks.battle.BattleService;
   import alternativa.tanks.models.weapon.smoky.§<"=§;
   import alternativa.tanks.models.weapon.smoky.§if catch super§;
   import §extends for const§.§import use§;
   import flash.display.BlendMode;
   
   public class §1"c§ implements §<"=§
   {
      [Inject]
      public static var battleService:BattleService;
      
      private var §&S§:§7"]§;
      
      private var §dynamic package set§:§import use§;
      
      private var sfxData:§0!<§;
      
      public function §1"c§(param1:§7"]§, param2:§import use§, param3:§0!<§)
      {
         super();
         this.§&S§ = param1;
         this.§dynamic package set§ = param2;
         this.sfxData = param3;
      }
      
      public function § #'§(param1:Vector3, param2:Object3D) : void
      {
         this.§-"b§(param2);
         this.§8F§(param1,param2);
         this.§get var package§(param1,param2);
      }
      
      private function §-"b§(param1:Object3D) : void
      {
         var _loc2_:§implements for break§ = §implements for break§.create(this.sfxData.shotSound,§if catch super§.§!"o§);
         this.§&S§.§each set set§(§do set case§.create(new Vector3(param1.x,param1.y,param1.z),_loc2_));
      }
      
      private function §8F§(param1:Vector3, param2:Object3D) : void
      {
         var _loc3_:§=&§ = §=&§(this.§dynamic package set§.getObject(§=&§));
         _loc3_.init(param1,param2,this.sfxData.§%1§,§if catch super§.§"#>§,§if catch super§.§if catch static§,§if catch super§.§in static§);
         battleService.§3l§().§7"0§(_loc3_);
      }
      
      private function §get var package§(param1:Vector3, param2:Object3D) : void
      {
         var _loc3_:§while var if§ = §while var if§(this.§dynamic package set§.getObject(§while var if§));
         var _loc4_:§extends super§ = §extends super§(this.§dynamic package set§.getObject(§extends super§));
         _loc4_.init(param2,param1);
         _loc3_.init(_loc4_,this.sfxData.§super default§);
         battleService.§3l§().§7"0§(_loc3_);
      }
      
      public function §throw catch use§(param1:Vector3) : void
      {
         this.§8"a§(param1);
         this.§8!J§(param1);
         this.§package set else§(param1);
      }
      
      private function §package set else§(param1:Vector3) : void
      {
         var _loc2_:§while var if§ = §while var if§(this.§dynamic package set§.getObject(§while var if§));
         var _loc3_:set = set(this.§dynamic package set§.getObject(set));
         _loc3_.init(param1,§if catch super§.§!%§);
         _loc2_.init(_loc3_,this.sfxData.§^]§);
         battleService.§3l§().§7"0§(_loc2_);
      }
      
      private function §8"a§(param1:Vector3) : void
      {
         var _loc2_:§implements for break§ = §implements for break§.create(this.sfxData.explosionSound,1);
         this.§&S§.§each set set§(§do set case§.create(param1,_loc2_,§if catch super§.§6j§));
      }
      
      private function §8!J§(param1:Vector3) : void
      {
         var _loc2_:set = set(this.§dynamic package set§.getObject(set));
         _loc2_.init(param1,§if catch super§.§!%§);
         var _loc3_:§<"z§ = §<"z§(this.§dynamic package set§.getObject(§<"z§));
         _loc3_.init(this.sfxData.explosionSize,this.sfxData.explosionSize,this.sfxData.§get catch dynamic§,0,_loc2_);
         battleService.§3l§().§7"0§(_loc3_);
      }
      
      public function §!"F§(param1:Vector3, param2:Vector3) : void
      {
         battleService.§3l§().addDecal(param2,param1,§if catch super§.§case package switch§,this.sfxData.§4!8§);
      }
      
      public function §get for get§(param1:Vector3) : void
      {
         var _loc2_:set = set(this.§dynamic package set§.getObject(set));
         _loc2_.init(param1,§if catch super§.§!%§ + 50);
         var _loc3_:§<"z§ = §<"z§(this.§dynamic package set§.getObject(§<"z§));
         _loc3_.§switch const use§(this.sfxData.criticalHitSize,this.sfxData.criticalHitSize,this.sfxData.§break const with§,0,_loc2_,0.5,0.5,null,70,BlendMode.NORMAL,2);
         battleService.§3l§().§7"0§(_loc3_);
      }
   }
}

