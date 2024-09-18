package Renamed1580
{
   import Renamed4739.Renamed5256;
   import Renamed4739.Renamed4740;
   
   public class Renamed4753 extends Renamed5256 implements Renamed4740, Renamed1581
   {
      public function Renamed4753()
      {
         super();
      }
      
      public function getClanName() : String
      {
         return getInitParam() != null ? getInitParam().clanName : null;
      }
      
      public function getClanLink() : String
      {
         return getInitParam() != null ? getInitParam().clanLink : null;
      }
   }
}

