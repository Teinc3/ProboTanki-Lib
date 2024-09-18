package Renamed72
{
   import alternativa.tanks.battle.objects.tank.Renamed925;
   import alternativa.tanks.battle.objects.tank.Renamed990;
   import Renamed384.Renamed8354;
   
   public class Renamed9495 implements Renamed990
   {
      private var effects:Renamed8354;
      
      private var Renamed3110:Renamed925;
      
      public function Renamed9495(param1:Renamed8354)
      {
         super();
         this.effects = param1;
      }
      
      public function init(param1:Renamed925) : void
      {
         this.Renamed3110 = param1;
      }
      
      public function destroy() : void
      {
         this.effects.Renamed3062();
      }
      
      public function activate() : void
      {
      }
      
      public function deactivate() : void
      {
         this.effects.Renamed3062();
      }
      
      public function enable() : void
      {
      }
      
      public function disable(param1:Boolean) : void
      {
         this.effects.Renamed3062();
      }
      
      public function reset() : void
      {
      }
      
      public function getStatus() : Number
      {
         return 0;
      }
      
      public function startFire() : void
      {
         this.effects.Renamed8366(this.Renamed3110.Renamed696(),this.Renamed3110.Renamed1071(),this.Renamed3110.Renamed1020());
      }
      
      public function Renamed4862() : void
      {
         this.effects.Renamed3062();
      }
   }
}

