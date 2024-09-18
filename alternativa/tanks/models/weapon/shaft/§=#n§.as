package alternativa.tanks.models.weapon.shaft
{
   import §7"j§.§;!9§;
   import §7"j§.§<"z§;
   import §7"j§.§do set case§;
   import §7"j§.§extends super§;
   import §7"j§.§implements for break§;
   import §7"j§.set;
   import §7"j§.§while var if§;
   import §`a§.§#+§;
   import §`a§.§2#?§;
   import §`a§.§default for final§;
   import alternativa.engine3d.core.Object3D;
   import alternativa.math.Vector3;
   import alternativa.tanks.battle.BattleService;
   import §extends for const§.§import use§;
   import flash.media.SoundChannel;
   
   public class §=#n§
   {
      public static const §catch for do§:Number = 200;
      
      public static const §"#j§:Number = 200;
      
      private static const §!%§:Number = 110;
      
      private static const §!"o§:Number = 0.4;
      
      private static const §-#G§:Number = 0.8;
      
      private static const §-"Y§:Number = 0.35;
      
      private static const §default const use§:int = 1000;
      
      private static const §5"J§:Vector3 = new Vector3();
      
      private static const §+%§:int = 300;
      
      private var sfxData:§'V§;
      
      private var battleService:BattleService;
      
      private var §catch switch§:SoundChannel;
      
      private var §return for for§:§;!9§;
      
      public function §=#n§(param1:§'V§, param2:BattleService)
      {
         super();
         this.sfxData = param1;
         this.battleService = param2;
      }
      
      public function §native package include§(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.§catch switch§ == null)
            {
               this.§catch switch§ = this.battleService.§&S§.§finally package get§(this.sfxData.targetingSound,0,9999);
            }
         }
         else if(this.§catch switch§ != null)
         {
            this.battleService.§&S§.§set const var§(this.§catch switch§);
            this.§catch switch§ = null;
         }
      }
      
      public function §if set default§(param1:Object3D) : void
      {
         var _loc2_:§implements for break§ = null;
         if(this.§return for for§ == null)
         {
            this.§return for for§ = §;!9§(this.battleService.§class while§().getObject(§;!9§));
            _loc2_ = §implements for break§.create(this.sfxData.zoomModeSound,§-"Y§);
            this.§return for for§.init(_loc2_,param1,0,9999);
            this.battleService.§"#D§(this.§return for for§);
         }
      }
      
      public function §catch for package§() : void
      {
         if(this.§return for for§ != null)
         {
            this.§return for for§.kill();
            this.§return for for§ = null;
         }
      }
      
      public function §break set implements§() : void
      {
         if(this.§return for for§ != null)
         {
            this.§return for for§.§'f§(§default const use§);
         }
      }
      
      public function §-"b§(param1:Vector3) : void
      {
         var _loc2_:§implements for break§ = §implements for break§.create(this.sfxData.shotSound,§!"o§);
         var _loc3_:§do set case§ = §do set case§.create(param1,_loc2_);
         this.battleService.§"#D§(_loc3_);
      }
      
      public function §8F§(param1:Vector3, param2:Object3D) : void
      {
         var _loc3_:§import use§ = this.battleService.§class while§();
         var _loc4_:§extends super§ = §extends super§(_loc3_.getObject(§extends super§));
         _loc4_.init(param2,param1,10);
         var _loc5_:§<"z§ = §<"z§(_loc3_.getObject(§<"z§));
         _loc5_.init(§catch for do§,§catch for do§,this.sfxData.§[#L§,0,_loc4_);
         this.battleService.§7"0§(_loc5_);
         this.§do true§(param1,param2);
      }
      
      public function §do true§(param1:Vector3, param2:Object3D) : void
      {
         var _loc3_:§while var if§ = §while var if§(this.battleService.§class while§().getObject(§while var if§));
         var _loc4_:§extends super§ = §extends super§(this.battleService.§class while§().getObject(§extends super§));
         _loc4_.init(param2,param1);
         _loc3_.init(_loc4_,this.sfxData.§super default§);
         this.battleService.§7"0§(_loc3_);
      }
      
      public function §else catch false§(param1:Vector3, param2:Vector.<Vector3>, param3:Vector3, param4:Vector3, param5:Vector3) : void
      {
         var _loc6_:Vector3 = null;
         if(param1 != null)
         {
            this.§6"y§(param1,param3,param4,param5,false);
         }
         if(param2 != null)
         {
            for each(_loc6_ in param2)
            {
               if(_loc6_ != null)
               {
                  this.§6"y§(_loc6_,param3,param4,param5,true);
               }
            }
         }
      }
      
      private function §6"y§(param1:Vector3, param2:Vector3, param3:Vector3, param4:Vector3, param5:Boolean) : void
      {
         var _loc6_:Number = NaN;
         var _loc7_:Number = this.sfxData.§5!Y§;
         §5"J§.diff(param1,param2);
         if(§5"J§.dot(param3) > 0)
         {
            _loc6_ = §5"J§.length();
            if(_loc6_ > _loc7_)
            {
               _loc6_ = _loc7_;
            }
            this.§ "E§(§default for final§,param1,param4,_loc6_,_loc6_ / _loc7_);
            if(param5)
            {
               this.§ "E§(§#+§,param1,param4,_loc6_,0.5);
            }
         }
         this.§8!J§(param1);
         this.§8"a§(param1);
      }
      
      private function §8!J§(param1:Vector3) : void
      {
         var _loc2_:set = set(this.battleService.§class while§().getObject(set));
         _loc2_.init(param1,§!%§);
         var _loc3_:§<"z§ = §<"z§(this.battleService.§class while§().getObject(§<"z§));
         _loc3_.init(§"#j§,2.5 * §"#j§,this.sfxData.§get catch dynamic§,0,_loc2_);
         this.battleService.§7"0§(_loc3_);
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
      
      private function §8"a§(param1:Vector3) : void
      {
         var _loc2_:§implements for break§ = §implements for break§.create(this.sfxData.explosionSound,§-#G§);
         var _loc3_:§do set case§ = §do set case§(this.battleService.§class while§().getObject(§do set case§));
         _loc3_.init(param1,_loc2_,100);
         this.battleService.§"#D§(_loc3_);
      }
      
      private function § "E§(param1:Class, param2:Vector3, param3:Vector3, param4:Number, param5:Number) : void
      {
         var _loc6_:§2#?§ = §2#?§(this.battleService.§class while§().getObject(param1));
         _loc6_.init(param2,param3,param4,param5,this.sfxData.§dynamic implements§,§+%§);
         this.battleService.§7"0§(_loc6_);
      }
      
      public function destroy() : void
      {
         if(this.§catch switch§ != null)
         {
            this.battleService.§&S§.§set const var§(this.§catch switch§);
            this.§catch switch§ = null;
         }
         this.§catch for package§();
      }
      
      public function §-!c§(param1:Vector3, param2:Vector3) : void
      {
         if(param2 != null)
         {
            this.battleService.§3l§().addDecal(param2,param1,50,this.sfxData.§5#W§);
         }
      }
   }
}

