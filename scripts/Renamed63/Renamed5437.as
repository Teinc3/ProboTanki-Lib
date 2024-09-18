package Renamed63
{
   import Renamed136.Renamed663;
   import alternativa.physics.Body;
   import alternativa.tanks.battle.Renamed659;
   import alternativa.tanks.battle.Renamed660;
   import alternativa.tanks.battle.objects.tank.Tank;
   
   public class Renamed5437 extends Renamed7400 implements Renamed617, Renamed660, Renamed659
   {
      private static const Renamed10207:int = 3;
      
      private var teamType:Renamed663;
      
      private var Renamed5430:Body;
      
      public function Renamed5437()
      {
         super();
      }
      
      public function Renamed833(param1:Renamed663) : void
      {
         this.teamType = param1;
      }
      
      public function Renamed661(param1:Body) : void
      {
         this.Renamed5430 = param1;
      }
      
      public function Renamed3385(param1:Body, param2:int, param3:Number, param4:Number, param5:Number, param6:Number) : Number
      {
         var _loc7_:Number = NaN;
         var _loc8_:Tank = param1.tank;
         if(!_loc8_.Renamed1017(this.teamType))
         {
            _loc7_ = Renamed10192(_loc8_,param2,param3,param4,param5,param6);
            if(param1 == this.Renamed5430)
            {
               _loc7_ += Renamed10207;
            }
            return _loc7_;
         }
         return 0;
      }
   }
}

