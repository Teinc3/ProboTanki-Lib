package Renamed17
{
   import alternativa.tanks.battle.Renamed768;
   import alternativa.tanks.battle.BattleService;
   
   public class Renamed4558 implements Renamed768
   {
      [Inject]
      public static var battleService:BattleService;
      
      private var callback:Renamed4557;
      
      private var Renamed5426:int;
      
      public function Renamed4558(param1:Renamed4557, param2:int)
      {
         super();
         this.callback = param1;
         this.Renamed5426 = param2;
      }
      
      public function Renamed769(param1:int, param2:int) : void
      {
         if(param1 >= this.Renamed5426)
         {
            battleService.Renamed619().Renamed816(this);
            this.callback.Renamed5396();
         }
      }
   }
}

