package §`"Q§
{
   import §7"j§.§finally const package§;
   import alternativa.tanks.battle.BattleService;
   import alternativa.tanks.battle.objects.tank.Tank;
   import flash.utils.Dictionary;
   
   public class §0"c§
   {
      [Inject]
      public static var battleService:BattleService;
      
      private var effects:Dictionary;
      
      public function §0"c§()
      {
         this.effects = new Dictionary();
         super();
      }
      
      public function §each set set§(param1:Tank, param2:§finally const package§) : void
      {
         this.effects[param1] = param2;
         battleService.§3l§().§7"0§(param2);
      }
      
      public function §use var super§(param1:Tank) : void
      {
         var _loc2_:§finally const package§ = this.effects[param1];
         if(_loc2_ != null)
         {
            _loc2_.kill();
            delete this.effects[param1];
         }
      }
   }
}

