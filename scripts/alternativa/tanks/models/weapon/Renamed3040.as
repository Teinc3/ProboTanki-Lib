package alternativa.tanks.models.weapon
{
   import alternativa.tanks.utils.EncryptedNumber;
   import alternativa.tanks.utils.EncryptedNumberImpl;
   
   public class Renamed3040
   {
      private var coneAngle:EncryptedNumber;
      
      private var range:EncryptedNumber;
      
      public function Renamed3040(param1:Number, param2:Number)
      {
         super();
         this.coneAngle = new EncryptedNumberImpl(param1);
         this.range = new EncryptedNumberImpl(param2);
      }
      
      public function Renamed3041() : Number
      {
         return this.coneAngle.getNumber();
      }
      
      public function Renamed3042() : Number
      {
         return this.range.getNumber();
      }
   }
}

