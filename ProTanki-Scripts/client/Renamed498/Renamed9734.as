package Renamed4643
{
   import Renamed1.Renamed609;
   import alternativa.tanks.battle.BattleService;
   import alternativa.tanks.battle.objects.tank.Tank;
   import flash.utils.Dictionary;
   
   public class Renamed4644
   {
      [Inject]
      public static var battleService:BattleService;
      
      private var effects:Dictionary;
      
      public function Renamed4644()
      {
         this.effects = new Dictionary();
         super();
      }
      
      public function Renamed1121(param1:Tank, param2:Renamed609) : void
      {
         this.effects[param1] = param2;
         battleService.Renamed621().Renamed636(param2);
      }
      
      public function Renamed1070(param1:Tank) : void
      {
         var _loc2_:Renamed609 = this.effects[param1];
         if(_loc2_ != null)
         {
            _loc2_.kill();
            delete this.effects[param1];
         }
      }
   }
}

