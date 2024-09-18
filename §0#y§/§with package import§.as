package §0#y§
{
   import §7"j§.§ q§;
   import §7"j§.§;!9§;
   import §7"j§.§do set case§;
   import §7"j§.§extends super§;
   import §7"j§.§final var super§;
   import §7"j§.§implements for break§;
   import §7"j§.§while var if§;
   import alternativa.engine3d.core.Object3D;
   import alternativa.math.Vector3;
   import alternativa.tanks.battle.BattleService;
   import alternativa.tanks.battle.objects.tank.§1"o§;
   import alternativa.tanks.battle.objects.tank.tankskin.§false catch set§;
   import alternativa.tanks.models.weapon.§ !8§;
   import alternativa.tanks.models.weapon.shotgun.§static package null§;
   import §extends for const§.§import use§;
   import flash.media.Sound;
   import platform.client.fp10.core.type.AutoClosable;
   
   public class §with package import§ implements AutoClosable, § q§
   {
      [Inject]
      public static var battleService:BattleService;
      
      private static const §8!r§:Number = 1;
      
      private static const §+#=§:int = 500;
      
      private static const §<!0§:int = 1000;
      
      private var §^"z§:§if catch use§;
      
      private var § #=§:§;!9§;
      
      public function §with package import§(param1:§if catch use§)
      {
         super();
         this.§^"z§ = param1;
      }
      
      public function § #'§(param1:§static package null§, param2:§ !8§, param3:§1"o§, param4:Vector3) : void
      {
         this.§package var super§(param1,param2,param3,param4);
         this.§`#y§(param2);
         this.§use const use§(param3);
      }
      
      private function §`#y§(param1:§ !8§) : void
      {
         var _loc2_:§implements for break§ = §implements for break§.create(this.§^"z§.shotSound,§8!r§);
         battleService.§"#D§(§do set case§.create(param1.§6u§,_loc2_));
      }
      
      private function §package var super§(param1:§static package null§, param2:§ !8§, param3:§1"o§, param4:Vector3) : void
      {
         var _loc5_:§case const class§ = §case const class§(battleService.§class while§().getObject(§case const class§));
         _loc5_.init(param1,param2,param3,param4,this.§^"z§);
         battleService.§7"0§(_loc5_);
      }
      
      public function §8!K§(param1:Object3D, param2:int) : void
      {
         var _loc3_:Sound = this.§^"z§.reloadSound;
         this.§#!j§(_loc3_,param2,§+#=§,param1);
      }
      
      public function §implements var do§(param1:Object3D, param2:int) : void
      {
         var _loc3_:Sound = this.§^"z§.magazineReloadSound;
         this.§#!j§(_loc3_,param2,§<!0§,param1);
      }
      
      public function §while set use§() : void
      {
         if(this.§ #=§ != null)
         {
            this.§ #=§.kill();
         }
      }
      
      private function §#!j§(param1:Sound, param2:int, param3:int, param4:Object3D) : void
      {
         var _loc5_:§implements for break§ = §implements for break§.create(param1,§8!r§);
         var _loc6_:§import use§ = battleService.§class while§();
         this.§ #=§ = §;!9§(_loc6_.getObject(§;!9§));
         var _loc7_:int = param2 - param1.length + param3;
         var _loc8_:int = 0;
         if(_loc7_ < 0)
         {
            _loc8_ = -_loc7_;
            _loc7_ = 0;
         }
         this.§ #=§.init(_loc5_,param4,_loc7_,1,_loc8_,this);
         battleService.§"#D§(this.§ #=§);
      }
      
      private function §use const use§(param1:§1"o§) : void
      {
         var _loc2_:§false catch set§ = param1.§in package default§();
         var _loc3_:Object3D = _loc2_.§2"F§();
         var _loc4_:Vector3 = param1.§else catch true§();
         var _loc5_:§while var if§ = §while var if§(battleService.§class while§().getObject(§while var if§));
         var _loc6_:§extends super§ = §extends super§(battleService.§class while§().getObject(§extends super§));
         _loc6_.init(_loc3_,_loc4_);
         _loc5_.init(_loc6_,this.§^"z§.§super default§);
         battleService.§7"0§(_loc5_);
      }
      
      [Obfuscation(rename="false")]
      public function close() : void
      {
         this.§^"z§ = null;
         if(this.§ #=§ != null)
         {
            this.§ #=§.kill();
         }
      }
      
      public function §dynamic var each§(param1:§final var super§) : void
      {
         if(this.§ #=§ == param1)
         {
            this.§ #=§ = null;
         }
      }
   }
}

