package Renamed409
{
   import alternativa.tanks.battle.Renamed754;
   import alternativa.tanks.battle.Renamed768;
   import alternativa.tanks.battle.Renamed832;
   
   public class Renamed779 extends Renamed832 implements Renamed754
   {
      private var Renamed8637:Renamed768;
      
      private var add:Boolean;
      
      public function Renamed779(param1:Renamed768, param2:Boolean)
      {
         super();
         this.Renamed8637 = param1;
         this.add = param2;
      }
      
      public function execute() : void
      {
         if(this.add)
         {
            Renamed619().Renamed815(this.Renamed8637);
         }
         else
         {
            Renamed619().Renamed816(this.Renamed8637);
         }
      }
   }
}

