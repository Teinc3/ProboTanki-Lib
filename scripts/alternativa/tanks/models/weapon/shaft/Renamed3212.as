package alternativa.tanks.models.weapon.shaft
{
   public class Renamed3212
   {
      public static const TRIGGER_PULL:Renamed3212 = new Renamed3212("TRIGGER_PULL");
      
      public static const TRIGGER_RELEASE:Renamed3212 = new Renamed3212("TRIGGER_RELEASE");
      
      public static const STOP:Renamed3212 = new Renamed3212("STOP");
      
      public static const READY_TO_SHOOT:Renamed3212 = new Renamed3212("READY_TO_SHOOT");
      
      public static const SWITCH:Renamed3212 = new Renamed3212("SWITCH");
      
      public static const EXIT:Renamed3212 = new Renamed3212("EXIT");
      
      private var value:String;
      
      public function Renamed3212(param1:String)
      {
         super();
         this.value = param1;
      }
      
      [Obfuscation(rename="false")]
      public function toString() : String
      {
         return this.value;
      }
   }
}

