package Renamed29
{
   import Renamed136.Renamed663;
   import alternativa.physics.Body;
   import alternativa.tanks.battle.Renamed660;
   import alternativa.tanks.battle.objects.tank.Tank;
   import alternativa.tanks.models.weapon.shared.Renamed615;
   
   public class Renamed7379 implements Renamed615, Renamed660
   {
      private var Renamed5429:Renamed663;
      
      public function Renamed7379()
      {
         super();
      }
      
      public function Renamed833(param1:Renamed663) : void
      {
         this.Renamed5429 = param1;
      }
      
      public function Renamed3416(param1:Body) : Number
      {
         var _loc2_:Tank = param1.tank;
         if(_loc2_.tankData.health <= 0)
         {
            return 0;
         }
         if(_loc2_.Renamed1017(this.Renamed5429))
         {
            return 0;
         }
         return 1;
      }
      
      public function Renamed3417(param1:Body) : Boolean
      {
         var _loc2_:Tank = param1.tank;
         return _loc2_.Renamed1017(this.Renamed5429);
      }
   }
}

