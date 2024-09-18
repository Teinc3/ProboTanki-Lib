package §false const case§
{
   import §7"j§.§=&§;
   import §7"j§.§do set case§;
   import §7"j§.§extends super§;
   import §7"j§.§implements for break§;
   import §7"j§.§while var if§;
   import alternativa.engine3d.core.Object3D;
   import alternativa.math.Vector3;
   import alternativa.tanks.battle.BattleService;
   
   public class §catch const null§
   {
      public static const §catch for do§:Number = 150;
      
      private static const §var const static§:int = 100;
      
      private var battleService:BattleService;
      
      private var sfxData:§0!L§;
      
      public function §catch const null§(param1:BattleService, param2:§0!L§)
      {
         super();
         this.battleService = param1;
         this.sfxData = param2;
      }
      
      public function § #'§(param1:Object3D, param2:Vector3, param3:Vector3) : void
      {
         var _loc4_:Number = NaN;
         var _loc5_:§implements for break§ = null;
         var _loc6_:§do set case§ = null;
         var _loc7_:§=&§ = §=&§(this.battleService.§class while§().getObject(§=&§));
         _loc7_.init(param2,param1,this.sfxData.§%1§,§var const static§,§catch for do§,§catch for do§);
         this.battleService.§7"0§(_loc7_);
         if(this.sfxData.shotSound != null)
         {
            _loc4_ = 0.8;
            _loc5_ = §implements for break§.create(this.sfxData.shotSound,_loc4_);
            _loc6_ = §do set case§.create(param3,_loc5_);
            this.battleService.§"#D§(_loc6_);
         }
      }
      
      public function §class set each§(param1:Object3D, param2:Vector3) : void
      {
         var _loc3_:§while var if§ = §while var if§(this.battleService.§class while§().getObject(§while var if§));
         var _loc4_:§extends super§ = §extends super§(this.battleService.§class while§().getObject(§extends super§));
         _loc4_.init(param1,param2);
         _loc3_.init(_loc4_,this.sfxData.§super default§);
         this.battleService.§7"0§(_loc3_);
      }
   }
}

