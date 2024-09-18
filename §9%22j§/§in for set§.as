package §9"j§
{
   import alternativa.tanks.models.weapon.shaft.§>"i§;
   import alternativa.types.Long;
   import §if try§.§return package if§;
   import §return set use§.§^!P§;
   
   public class §in for set§ extends §return package if§
   {
      private var §9#l§:§>"i§;
      
      private var §break const package§:§^!P§;
      
      public var modelId:int;
      
      public function §in for set§()
      {
         super();
         this.modelId = 50;
         this.§9#l§ = §>"i§(modelRegistry.getModel(Long.getLong(170467452,-1685189911)));
         this.§break const package§ = §^!P§(modelRegistry.getModel(Long.getLong(1691794381,-1794202080)));
      }
      
      public function invoke(param1:Object) : void
      {
         switch(param1.getPacketId())
         {
            case §6t§.§throw set function§:
               this.§1!f§(param1);
               break;
            case §6t§.§0"1§:
               this.§default var throw§(param1);
               break;
            case §6t§.§%#8§:
               this.fire(param1);
               break;
            case §6t§.§each const else§:
               this.§for package use§(param1);
               break;
            case §6t§.§1H§:
               this.§dynamic package extends§(param1);
               break;
            case §6t§.§`!$§:
               this.§?#v§(param1);
         }
      }
      
      private function §1!f§(param1:Object) : void
      {
         this.§9#l§.§1!f§(§9#A§.§if for with§(param1.shooter));
      }
      
      private function §default var throw§(param1:Object) : void
      {
         this.§break const package§.§default var throw§(§9#A§.§if for with§(param1.shooterId),§9#A§.§if for with§(param1.targetTank),param1.localSpotPosition);
      }
      
      private function fire(param1:Object) : void
      {
         this.§9#l§.fire(§9#A§.§if for with§(param1.shooter),param1.staticHitPoint,param1.targets,param1.targetHitPoints,param1.impactForce);
      }
      
      private function §for package use§(param1:Object) : void
      {
         this.§break const package§.§for package use§(§9#A§.§if for with§(param1.shooterId));
      }
      
      private function §dynamic package extends§(param1:Object) : void
      {
         this.§9#l§.§static set const§(§9#A§.§if for with§(param1.shooter));
      }
      
      private function §?#v§(param1:Object) : void
      {
         this.§break const package§.§?#v§(§9#A§.§if for with§(param1.shooterId),param1.projectionOnVerticalAxis);
      }
   }
}

