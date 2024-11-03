package alternativa.tanks.models.weapon.shaft
{
   public class Renamed3334
   {
      public static const IDLE:Renamed3334 = new Renamed3334(1);
      
      public static const READY_TO_SHOOT:Renamed3334 = new Renamed3334(2);
      
      public static const Renamed3358:Renamed3334 = new Renamed3334(3);
      
      public static const Renamed3359:Renamed3334 = new Renamed3334(4);
      
      private var value:int;
      
      public function Renamed3334(param1:int)
      {
         super();
         this.value = param1;
      }
      
      [Obfuscation(rename="false")]
      public function toString() : String
      {
         return this.value.toString();
      }
   }
}

