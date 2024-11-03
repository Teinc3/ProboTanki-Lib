package Renamed224
{
   import alternativa.tanks.battle.Renamed768;
   import alternativa.tanks.battle.BattleService;
   
   public class Renamed4577 implements Renamed768
   {
      [Inject]
      public static var battleService:BattleService;
      
      private var callback:Renamed4580;
      
      private var Renamed5426:int;
      
      private var flagId:int;
      
      public function Renamed4577(param1:int, param2:Renamed4580, param3:int)
      {
         super();
         this.flagId = param1;
         this.callback = param2;
         this.Renamed5426 = param3;
      }
      
      public function Renamed769(param1:int, param2:int) : void
      {
         if(param1 >= this.Renamed5426)
         {
            battleService.Renamed619().Renamed816(this);
            this.callback.Renamed5396(this.flagId);
         }
      }
   }
}

