package ProtectionContexts
{
   import flash.utils.ByteArray;
   
   public class XorProtectionContext implements IProtectionContext
   {
      private static var ProtectionSize:int = 8;
      
      private var encryptionVector:Vector.<int>;
      
      private var decryptionVector:Vector.<int>;
      
      private var encryptionIndex:int = 0;
      
      private var decryptionIndex:int = 0;
      
      private var xorKey:int;
      
      public function XorProtectionContext(keyVector:Vector.<int>)
      {
         this.encryptionVector = new Vector.<int>(ProtectionSize,true);
         this.decryptionVector = new Vector.<int>(ProtectionSize,true);
         super();
         var keyElement:int = 0;
         while(keyElement < keyVector.length)
         {
            this.xorKey ^= keyVector[keyElement];
            keyElement++;
         }
         var vectorIndex:int = 0;
         while(vectorIndex < ProtectionSize)
         {
            this.decryptionVector[vectorIndex] = this.xorKey ^ vectorIndex << 3;
            this.encryptionVector[vectorIndex] = this.xorKey ^ vectorIndex << 3 ^ 0x57;
            vectorIndex++;
         }
      }
      
      public function encrypt(data:ByteArray) : void
      {
         var byteValue:int = 0;
         var dataIndex:int = 0;
         while(dataIndex < data.length)
         {
            byteValue = int(data[dataIndex]);
            data[dataIndex] = byteValue ^ this.encryptionVector[this.encryptionIndex];
            this.encryptionVector[this.encryptionIndex] = byteValue;
            this.encryptionIndex ^= byteValue & 7;
            dataIndex++;
         }
      }
      
      public function decrypt(data:ByteArray) : void
      {
         var byteValue:int = 0;
         var dataIndex:int = 0;
         while(dataIndex < data.length)
         {
            byteValue = int(data[dataIndex]);
            this.decryptionVector[this.decryptionIndex] = byteValue ^ this.decryptionVector[this.decryptionIndex];
            data[dataIndex] = this.decryptionVector[this.decryptionIndex];
            this.decryptionIndex ^= this.decryptionVector[this.decryptionIndex] & 7;
            dataIndex++;
         }
      }
   }
}

