package Renamed29
{
   import Renamed136.Renamed663;
   import alternativa.physics.Body;
   import alternativa.tanks.battle.Renamed659;
   import alternativa.tanks.battle.objects.tank.Tank;
   import alternativa.tanks.models.weapon.shared.Renamed614;
   
   public class Renamed5432 implements Renamed614, Renamed659
   {
      private static const Renamed7385:Number = 0.0001;
      
      private var Renamed5429:Renamed663;
      
      public function Renamed5432()
      {
         super();
      }
      
      public function Renamed833(param1:Renamed663) : void
      {
         this.Renamed5429 = param1;
      }
      
      public function Renamed3385(param1:Body) : Number
      {
         var _loc2_:int = 0;
         var _loc3_:Tank = param1.tank;
         if(_loc3_.Renamed1017(this.Renamed5429))
         {
            _loc2_ = 0;
            if(_loc3_.Renamed1090() > Renamed7385)
            {
               _loc2_ = 5;
            }
            else if(_loc3_.Renamed1090() < -Renamed7385)
            {
               _loc2_ = 4;
            }
            return _loc3_.tankData.health > _loc3_.Renamed1016() - Renamed7385 ? Number(1) : Number(3 + _loc2_);
         }
         return 2;
      }
      
      public function Renamed661(param1:Body) : void
      {
      }
   }
}

