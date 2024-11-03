package Renamed301
{
   import alternativa.object.ClientObject;
   import alternativa.tanks.battle.Renamed668;
   import Renamed444.Renamed4716;
   import Renamed444.Renamed7489;
   
   public class Renamed4621 extends Renamed7489 implements Renamed4716, Renamed3043
   {
      public function Renamed4621()
      {
         super();
      }
      
      public function initObject(param1:ClientObject, param2:Number, param3:Number, param4:Number) : void
      {
         var _loc5_:Renamed7484;
         (_loc5_ = new Renamed7484()).Renamed7485 = isNaN(param2) ? 0 : Renamed668.Renamed674(param2);
         _loc5_.Renamed7487 = isNaN(param4) ? 1 : Renamed668.Renamed674(param4);
         _loc5_.Renamed7486 = isNaN(param3) ? 0 : param3;
         _loc5_.Renamed7488 = _loc5_.Renamed7487 - _loc5_.Renamed7485;
         if(_loc5_.Renamed7486 > 100)
         {
            _loc5_.Renamed7486 = 100;
         }
         param1.putParams(Renamed4621,_loc5_);
      }
      
      public function Renamed3059(param1:ClientObject) : Renamed3044
      {
         var _loc2_:Renamed7484 = Renamed7484(param1.getParams(Renamed4621));
         return new Renamed3044(_loc2_.Renamed7485,_loc2_.Renamed7487,_loc2_.Renamed7486);
      }
   }
}

