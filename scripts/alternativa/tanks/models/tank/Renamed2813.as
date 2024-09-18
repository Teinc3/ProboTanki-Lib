package alternativa.tanks.models.tank
{
   import Renamed602.3DPositionVector;
   import alternativa.math.Vector3;
   import alternativa.tanks.battle.BattleService;
   import alternativa.tanks.services.battlereadiness.BattleReadinessService;
   
   public class Renamed2813
   {
      [Inject]
      public static var battleService:BattleService;
      
      [Inject]
      public static var Renamed2422:BattleReadinessService;
      
      private var Renamed2801:Boolean = true;
      
      public function Renamed2813(param1:Boolean)
      {
         super();
         this.Renamed2801 = param1;
      }
      
      public function Renamed2910(param1:3DPositionVector, param2:3DPositionVector) : void
      {
         var _loc3_:Vector3 = new Vector3(param1.x,param1.y,param1.z);
         var _loc4_:Vector3 = new Vector3(-Math.sin(param2.z),Math.cos(param2.z),0);
         if(this.Renamed2801)
         {
            this.Renamed2801 = false;
            battleService.Renamed639();
            battleService.Renamed640();
            battleService.Renamed642(_loc3_,_loc4_);
            Renamed2422.Renamed2507();
         }
         else
         {
            battleService.Renamed644(_loc3_,_loc4_);
         }
      }
   }
}

