package alternativa.tanks.models.weapon
{
   import alternativa.tanks.utils.EncryptedNumber;
   import alternativa.tanks.utils.EncryptedNumberImpl;
   
   public class Renamed3065
   {
      private var impactForce:EncryptedNumber;
      
      private var Renamed3066:EncryptedNumber;
      
      public function Renamed3065(param1:Number, param2:Number)
      {
         super();
         this.impactForce = new EncryptedNumberImpl(param1);
         this.Renamed3066 = new EncryptedNumberImpl(param2);
      }
      
      public function Renamed3067() : Number
      {
         return this.impactForce.getNumber();
      }
      
      public function Renamed3068() : Number
      {
         return this.Renamed3066.getNumber();
      }
   }
}

