package Renamed259
{
   import Renamed1.Renamed3193;
   import Renamed4622.Renamed5642;
   import Renamed4622.Renamed5632;
   import Renamed4622.Renamed5636;
   import Renamed4622.Renamed4623;
   
   public class Renamed4600 extends Renamed5642 implements Renamed4623, Renamed3255
   {
      private static const Renamed6806:Array = [new Renamed5636(1,2,"0x000000",0,0)];
      
      public function Renamed4600()
      {
         super();
      }
      
      private static function Renamed6807(param1:Renamed5636, param2:Renamed5636) : Number
      {
         return param1.time - param2.time;
      }
      
      public function Renamed3262(param1:String) : Renamed3193
      {
         var _loc2_:Renamed5632 = null;
         var _loc3_:Vector.<Renamed5632> = getInitParam().effects;
         if(_loc3_ != null)
         {
            for each(_loc2_ in _loc3_)
            {
               if(_loc2_ != null && _loc2_.name == param1)
               {
                  _loc2_.Renamed5637.sort(Renamed6807);
                  return new Renamed3193(_loc2_.Renamed5637);
               }
            }
         }
         return new Renamed3193(Vector.<Renamed5636>(Renamed6806));
      }
   }
}

