package alternativa.tanks.models.weapons.targeting
{
   import Renamed3505.Renamed3511;
   import Renamed258.Renamed3512;
   import alternativa.object.ClientObject;
   import alternativa.tanks.models.weapons.targeting.priority.Renamed3508;
   import Renamed439.Renamed3509;
   
   public class Renamed3151 extends Renamed3071
   {
      private var Renamed2948:Number = 10000000000;
      
      public function Renamed3151(param1:ClientObject, param2:String, param3:Number)
      {
         var _loc4_:Renamed3508 = new Renamed3508(new Renamed3511(param2),param3);
         super(new Renamed3509(param1,this.Renamed2948,_loc4_),new Renamed3512(param1,this.Renamed2948),_loc4_);
      }
   }
}

