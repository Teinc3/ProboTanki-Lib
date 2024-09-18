package Renamed409
{
   import alternativa.tanks.battle.Renamed752;
   import alternativa.tanks.battle.Renamed754;
   import alternativa.tanks.battle.Renamed832;
   
   public class Renamed778 extends Renamed832 implements Renamed754
   {
      private var controller:Renamed752;
      
      public function Renamed778(param1:Renamed752)
      {
         super();
         this.controller = param1;
      }
      
      public function execute() : void
      {
         Renamed619().Renamed827(this.controller);
      }
   }
}

