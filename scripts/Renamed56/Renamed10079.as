package Renamed56
{
   import alternativa.tanks.utils.EncryptedInt;
   import alternativa.tanks.utils.EncryptedIntImpl;
   import alternativa.tanks.utils.EncryptedNumber;
   import alternativa.tanks.utils.EncryptedNumberImpl;
   
   public class Renamed10079
   {
      private var Renamed10080:EncryptedInt;
      
      private var weakeningCoeff:EncryptedNumber;
      
      public function Renamed10079(param1:int, param2:Number)
      {
         super();
         this.Renamed10080 = new EncryptedIntImpl(param1);
         this.weakeningCoeff = new EncryptedNumberImpl(param2);
      }
      
      public function Renamed10081() : int
      {
         return this.Renamed10080.getInt();
      }
      
      public function Renamed10082() : Number
      {
         return this.weakeningCoeff.getNumber();
      }
   }
}

