package §class for§
{
   import alternativa.tanks.utils.EncryptedInt;
   import alternativa.tanks.utils.EncryptedIntImpl;
   import alternativa.tanks.utils.EncryptedNumber;
   import alternativa.tanks.utils.EncryptedNumberImpl;
   
   public class §3!z§
   {
      private var §<"w§:EncryptedInt;
      
      private var weakeningCoeff:EncryptedNumber;
      
      public function §3!z§(param1:int, param2:Number)
      {
         super();
         this.§<"w§ = new EncryptedIntImpl(param1);
         this.weakeningCoeff = new EncryptedNumberImpl(param2);
      }
      
      public function §-G§() : int
      {
         return this.§<"w§.getInt();
      }
      
      public function §implements var get§() : Number
      {
         return this.weakeningCoeff.getNumber();
      }
   }
}

