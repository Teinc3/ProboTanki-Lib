package Renamed462
{
   import Renamed3253.Renamed3254;
   import Renamed259.Renamed3255;
   import Renamed482.Renamed4634;
   import Renamed482.Renamed9199;
   import alternativa.object.ClientObject;
   
   public class Renamed4721 extends Renamed9199 implements Renamed4634, Renamed3122
   {
      public function Renamed4721()
      {
         super();
      }
      
      [Obfuscation(rename="false")]
      public function objectLoadedPost(param1:ClientObject) : void
      {
         var _loc2_:Renamed3255 = Renamed3255(object.adapt(Renamed3255));
         var _loc3_:Renamed3075 = new Renamed3075(getInitParam(),_loc2_,Renamed3254(object.adapt(Renamed3254)));
         param1.putParams(Renamed3075,_loc3_);
      }
      
      public function objectUnloaded(param1:ClientObject) : void
      {
         Renamed3075(param1.getParams(Renamed3075)).close();
      }
      
      public function Renamed3126(param1:ClientObject) : Renamed3075
      {
         return Renamed3075(param1.getParams(Renamed3075));
      }
   }
}

