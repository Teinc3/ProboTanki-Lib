package alternativa.tanks.models.tank
{
   import alternativa.tanks.battle.Renamed832;
   import alternativa.tanks.battle.objects.tank.Renamed990;
   
   public class Renamed2711 extends Renamed832 implements Renamed2712
   {
      private var weapon:Renamed990;
      
      public function Renamed2711(param1:Renamed990)
      {
         super();
         this.weapon = param1;
      }
      
      public function Renamed2713(param1:int, param2:Boolean) : void
      {
         this.weapon.disable(false);
      }
      
      public function Renamed2714(param1:int) : void
      {
         this.weapon.enable();
      }
      
      public function Renamed2715() : void
      {
         this.weapon.activate();
      }
      
      public function Renamed2716() : void
      {
         this.weapon.deactivate();
      }
   }
}

