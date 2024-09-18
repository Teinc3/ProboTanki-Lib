package §0#I§
{
   import alternativa.tanks.battle.§;!t§;
   import alternativa.tanks.battle.BattleService;
   
   public class §&!K§ implements §;!t§
   {
      [Inject]
      public static var battleService:BattleService;
      
      private var callback:§break for catch§;
      
      private var §try catch dynamic§:int;
      
      private var flagId:int;
      
      public function §&!K§(param1:int, param2:§break for catch§, param3:int)
      {
         super();
         this.flagId = param1;
         this.callback = param2;
         this.§try catch dynamic§ = param3;
      }
      
      public function §var package implements§(param1:int, param2:int) : void
      {
         if(param1 >= this.§try catch dynamic§)
         {
            battleService.§'x§().§%"7§(this);
            this.callback.§override package super§(this.flagId);
         }
      }
   }
}

