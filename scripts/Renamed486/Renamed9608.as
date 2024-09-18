package Renamed486
{
   import alternativa.tanks.battle.Renamed754;
   import alternativa.tanks.battle.Renamed804;
   
   public class Renamed9608 implements Renamed754
   {
      private var Renamed5461:Renamed798;
      
      private var trigger:Renamed804;
      
      public function Renamed9608(param1:Renamed798, param2:Renamed804)
      {
         super();
         this.Renamed5461 = param1;
         this.trigger = param2;
      }
      
      public function execute() : void
      {
         this.Renamed5461.add(this.trigger);
      }
   }
}

