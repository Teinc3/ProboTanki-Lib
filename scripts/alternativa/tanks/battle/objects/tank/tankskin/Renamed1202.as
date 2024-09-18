package alternativa.tanks.battle.objects.tank.tankskin
{
   import alternativa.tanks.battle.events.Renamed511;
   import alternativa.tanks.battle.objects.tank.skintexturesregistry.TankSkinTextureRegistry;
   
   public class Renamed513 implements Renamed511
   {
      private var registry:TankSkinTextureRegistry;
      
      public function Renamed513(param1:TankSkinTextureRegistry)
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

