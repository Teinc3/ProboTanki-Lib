package Renamed58
{
   import Renamed25.Renamed26;
   import alternativa.object.ClientObject;
   import alternativa.tanks.models.weapon.Renamed3046;
   import alternativa.tanks.models.weapon.shotgun.Renamed3418;
   import alternativa.tanks.models.weapon.shotgun.Renamed3426;
   import Renamed339.Renamed7930;
   import Renamed339.Renamed7931;
   
   public class Renamed60 extends Renamed7931 implements Renamed7930, Renamed59
   {
      public function Renamed60()
      {
         super();
      }
      
      public function Renamed3443(param1:ClientObject) : Renamed3418
      {
         var _loc2_:Renamed3046 = new Renamed3046(param1);
         return new Renamed3418(this.Renamed3462(_loc2_.Renamed3048().turret),_loc2_);
      }
      
      public function Renamed3462(param1:ClientObject) : Renamed3426
      {
         var _loc2_:Renamed3426 = Renamed3426(param1.getParams(Renamed3426));
         if(_loc2_ == null)
         {
            _loc2_ = new Renamed3426(Renamed26(param1.getParams(Renamed26)));
            param1.putParams(Renamed3426,_loc2_);
         }
         return _loc2_;
      }
   }
}

