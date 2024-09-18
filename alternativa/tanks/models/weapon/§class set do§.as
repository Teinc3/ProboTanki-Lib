package alternativa.tanks.models.weapon
{
   import alternativa.tanks.utils.EncryptedNumber;
   import alternativa.tanks.utils.EncryptedNumberImpl;
   
   public class §class set do§
   {
      private var coneAngle:EncryptedNumber;
      
      private var range:EncryptedNumber;
      
      public function §class set do§(param1:Number, param2:Number)
      {
         super();
         this.coneAngle = new EncryptedNumberImpl(param1);
         this.range = new EncryptedNumberImpl(param2);
      }
      
      public function §&!W§() : Number
      {
         return this.coneAngle.getNumber();
      }
      
      public function §super for§() : Number
      {
         return this.range.getNumber();
      }
   }
}

