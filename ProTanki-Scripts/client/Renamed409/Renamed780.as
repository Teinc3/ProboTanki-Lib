package Renamed409
{
   import alternativa.tanks.battle.Renamed754;
   import alternativa.tanks.battle.Renamed832;
   import alternativa.tanks.battle.Renamed790;
   
   public class Renamed780 extends Renamed832 implements Renamed754
   {
      private var controller:Renamed790;
      
      private var add:Boolean;
      
      public function Renamed780(param1:Renamed790, param2:Boolean)
      {
         super();
         this.controller = param1;
         this.add = param2;
      }
      
      public function execute() : void
      {
         if(this.add)
         {
            Renamed619().Renamed811(this.controller);
         }
         else
         {
            Renamed619().Renamed826(this.controller);
         }
      }
   }
}

