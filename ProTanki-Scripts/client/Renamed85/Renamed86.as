package Renamed85
{
   import alternativa.tanks.utils.EncryptedInt;
   import alternativa.tanks.utils.EncryptedIntImpl;
   import alternativa.tanks.utils.EncryptedNumber;
   import alternativa.tanks.utils.EncryptedNumberImpl;
   
   public class Renamed86
   {
      public var Renamed3054:EncryptedNumber;
      
      public var Renamed3052:EncryptedNumber;
      
      public var Renamed10195:EncryptedInt;
      
      public var Renamed10197:EncryptedInt;
      
      public var Renamed3050:EncryptedInt;
      
      public function Renamed86(param1:int = 0, param2:Number = 0, param3:Number = 0, param4:int = 0, param5:int = 0)
      {
         super();
         this.Renamed3050 = new EncryptedIntImpl(param1);
         this.Renamed3054 = new EncryptedNumberImpl(param2);
         this.Renamed3052 = new EncryptedNumberImpl(param3);
         this.Renamed10195 = new EncryptedIntImpl(param4);
         this.Renamed10197 = new EncryptedIntImpl(param5);
      }
      
      public function Renamed10351() : int
      {
         return this.Renamed10195.getInt();
      }
      
      public function Renamed10352() : int
      {
         return this.Renamed10197.getInt();
      }
      
      public function Renamed3053() : Number
      {
         return this.Renamed3054.getNumber();
      }
      
      public function Renamed3051() : Number
      {
         return this.Renamed3052.getNumber();
      }
   }
}

