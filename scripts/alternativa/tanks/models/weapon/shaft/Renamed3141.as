package alternativa.tanks.models.weapon.shaft
{
   public class Renamed3140
   {
      public static const RECHARGE:Renamed3140 = new Renamed3140("RECHARGE");
      
      public static const DRAIN:Renamed3140 = new Renamed3140("DRAIN");
      
      private var value:String;
      
      public function Renamed3140(param1:String)
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

