package alternativa.tanks.models.weapon.shotgun
{
   import alternativa.object.ClientObject;
   import Renamed58.Renamed59;
   import Renamed74.Renamed3460;
   
   public class Renamed3438 extends Renamed3460
   {
      public function Renamed3438(param1:ClientObject)
      {
         super(param1);
      }
      
      public function Renamed3461() : Renamed3426
      {
         var _loc1_:Renamed59 = Renamed59(Renamed3048().turret.getParams(Renamed59));
         return _loc1_.Renamed3462(Renamed3048().turret);
      }
   }
}

