package Renamed487
{
   import Renamed199.Renamed3823;
   import Renamed4645.Renamed5337;
   import Renamed4645.Renamed9611;
   import Renamed4645.Renamed4646;
   
   public class Renamed4636 extends Renamed9611 implements Renamed4646, Renamed4637
   {
      public function Renamed4636()
      {
         super();
      }
      
      public function Renamed5370() : Renamed5336
      {
         var _loc1_:Renamed5337 = getInitParam();
         return new Renamed5336(new Renamed3823(uint(_loc1_.lightColor),_loc1_.intensity),_loc1_.attenuationBegin,_loc1_.attenuationEnd);
      }
   }
}

