package §var const dynamic§
{
   import alternativa.tanks.battle.§+$%§;
   import alternativa.tanks.models.weapon.machinegun.§dynamic package false§;
   import alternativa.types.Long;
   import §if try§.§return package if§;
   
   public class §continue for default§ extends §return package if§
   {
      private var §@#G§:§dynamic package false§;
      
      public var modelId:int;
      
      public function §continue for default§()
      {
         super();
         this.modelId = 74;
         this.§@#G§ = §dynamic package false§(modelRegistry.getModel(Long.getLong(1635158664,1411719504)));
      }
      
      public function invoke(param1:Object) : void
      {
         switch(param1.getPacketId())
         {
            case §var set if§.§7"1§:
               this.startFire(param1);
               break;
            case §var set if§.§override catch const§:
               this.§else package else§(param1);
               break;
            case §var set if§.§#"q§:
               this.§>!p§(param1);
         }
      }
      
      private function startFire(param1:Object) : void
      {
         this.§@#G§.onStart(§9#A§.§if for with§(param1.shooter));
      }
      
      private function §else package else§(param1:Object) : void
      {
         this.§@#G§.§`#S§(§9#A§.§if for with§(param1.shooter));
      }
      
      private function §>!p§(param1:Object) : void
      {
         this.§@#G§.§use catch catch§(§9#A§.§if for with§(param1.shooter),§+$%§.§?#T§(param1.direction),param1.targets);
      }
   }
}

