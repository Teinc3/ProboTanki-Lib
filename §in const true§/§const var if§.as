package §in const true§
{
   import §7"j§.§=&§;
   import §7"j§.§do set case§;
   import §7"j§.§extends super§;
   import §7"j§.§implements for break§;
   import §7"j§.§while var if§;
   import alternativa.engine3d.core.Object3D;
   import alternativa.math.Vector3;
   import alternativa.tanks.battle.§+$%§;
   import alternativa.tanks.battle.BattleService;
   
   public class §const var if§
   {
      public static const §^!$§:int = 120;
      
      private static const §'?§:int = 50;
      
      private var battleService:BattleService;
      
      private var sfxData:§implements package in§;
      
      public function §const var if§(param1:BattleService, param2:§implements package in§)
      {
         super();
         this.battleService = param1;
         this.sfxData = param2;
      }
      
      public function § #'§(param1:Object3D, param2:Vector3) : void
      {
         this.§package var super§(param2,param1);
         this.§""n§(param2,param1);
         this.§`#y§(param1);
      }
      
      private function §package var super§(param1:Vector3, param2:Object3D) : void
      {
         var _loc3_:§=&§ = §=&§(this.battleService.§class while§().getObject(§=&§));
         _loc3_.init(param1,param2,this.sfxData.§%1§,§'?§,§^!$§,§^!$§);
         this.battleService.§7"0§(_loc3_);
      }
      
      private function §""n§(param1:Vector3, param2:Object3D) : void
      {
         var _loc3_:§while var if§ = §while var if§(this.battleService.§class while§().getObject(§while var if§));
         var _loc4_:§extends super§ = §extends super§(this.battleService.§class while§().getObject(§extends super§));
         _loc4_.init(param2,param1);
         _loc3_.init(_loc4_,this.sfxData.§9#9§);
         this.battleService.§7"0§(_loc3_);
      }
      
      private function §`#y§(param1:Object3D) : void
      {
         var _loc2_:Number = NaN;
         var _loc3_:§implements for break§ = null;
         if(this.sfxData.shotSound != null)
         {
            _loc2_ = 0.8;
            _loc3_ = §implements for break§.create(this.sfxData.shotSound,_loc2_);
            §+$%§.§@!c§.reset(param1.x,param1.y,param1.z);
            this.battleService.§"#D§(§do set case§.create(§+$%§.§@!c§,_loc3_));
         }
      }
   }
}

