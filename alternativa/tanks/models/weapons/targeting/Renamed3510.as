package alternativa.tanks.models.weapons.targeting
{
   import Renamed3505.Renamed3506;
   import Renamed258.Renamed3507;
   import alternativa.object.ClientObject;
   import alternativa.tanks.models.weapon.Renamed3046;
   import alternativa.tanks.models.weapons.targeting.priority.Renamed3508;
   import Renamed439.Renamed3509;
   
   public class Renamed3119 extends Renamed3071
   {
      public function Renamed3119(param1:ClientObject, param2:Renamed3046, param3:Number)
      {
         var _loc4_:Renamed3508 = new Renamed3508(new Renamed3506(param2));
         super(new Renamed3509(param1,param3,_loc4_),new Renamed3507(param1,param3),_loc4_);
      }
   }
}

