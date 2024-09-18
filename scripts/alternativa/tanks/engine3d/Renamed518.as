package alternativa.tanks.engine3d
{
   import alternativa.tanks.battle.events.Renamed511;
   
   public class Renamed518 implements Renamed511
   {
      private var registry:Renamed1681;
      
      public function Renamed518(param1:Renamed1681)
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

