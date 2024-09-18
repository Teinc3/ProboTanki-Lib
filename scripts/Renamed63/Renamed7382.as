package Renamed63
{
   import Renamed136.Renamed663;
   import alternativa.physics.Body;
   import alternativa.tanks.battle.Renamed660;
   import alternativa.tanks.battle.objects.tank.Tank;
   
   public class Renamed7382 extends Renamed7400 implements Renamed617, Renamed660
   {
      private var teamType:Renamed663;
      
      public function Renamed7382()
      {
         super();
      }
      
      public function Renamed833(param1:Renamed663) : void
      {
         this.teamType = param1;
      }
      
      public function Renamed3385(param1:Body, param2:int, param3:Number, param4:Number, param5:Number, param6:Number) : Number
      {
         var _loc7_:Tank = param1.tank;
         if(!_loc7_.Renamed1017(this.teamType))
         {
            return Renamed10192(_loc7_,param2,param3,param4,param5,param6);
         }
         return 0;
      }
   }
}

