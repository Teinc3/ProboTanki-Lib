package alternativa.tanks.battle.objects.tank.tankskin
{
   import alternativa.tanks.battle.events.§throw package continue§;
   import alternativa.tanks.battle.objects.tank.skintexturesregistry.TankSkinTextureRegistry;
   
   public class §<"t§ implements §throw package continue§
   {
      private var registry:TankSkinTextureRegistry;
      
      public function §<"t§(param1:TankSkinTextureRegistry)
      {
         super();
         this.registry = param1;
      }
      
      public function handleBattleEvent(param1:Object) : void
      {
         this.registry.clear();
      }
   }
}

