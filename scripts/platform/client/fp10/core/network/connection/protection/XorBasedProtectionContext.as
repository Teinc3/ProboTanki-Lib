package platform.client.fp10.core.network.connection.protection
{
   import alternativa.types.Long;
   import flash.utils.ByteArray;
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   import platform.client.fp10.core.network.connection.IProtectionContext;
   
   public class XorBasedProtectionContext implements IProtectionContext
   {
      private var serverSequence:Vector.<int>;
      
      private var serverSelector:int = 0;
      
      private var clientSequence:Vector.<int>;
      
      private var clientSelector:int = 0;
      
      private var initialSeed:int;
      
      public function XorBasedProtectionContext(param1:ByteArray, param2:Long)
      {
         this.serverSequence = new Vector.<int>(8,true);
         this.clientSequence = new Vector.<int>(8,true);
         super();
         this.initialSeed = 0;
         var _loc3_:int = 0;
         while(_loc3_ < 32)
         {
            this.initialSeed ^= param1[_loc3_];
            _loc3_++;
         }
         this.initialSeed ^= param2.high >> 24 & 0xFF;
         this.initialSeed ^= param2.high >> 16 & 0xFF;
         this.initialSeed ^= param2.high >> 8 & 0xFF;
         this.initialSeed ^= param2.high >> 0 & 0xFF;
         this.initialSeed ^= param2.low >> 24 & 0xFF;
         this.initialSeed ^= param2.low >> 16 & 0xFF;
         this.initialSeed ^= param2.low >> 8 & 0xFF;
         this.initialSeed ^= param2.low >> 0 & 0xFF;
         this.initialSeed = this.initialSeed >= 128 ? int(this.initialSeed - 256) : int(this.initialSeed);
         this.reset();
      }
      
      public function reset() : void
      {
         var _loc1_:int = 0;
         while(_loc1_ < 8)
         {
            this.serverSequence[_loc1_] = this.initialSeed ^ _loc1_ << 3;
            this.clientSequence[_loc1_] = this.initialSeed ^ _loc1_ << 3 ^ 0x57;
            _loc1_++;
         }
         this.serverSelector = 0;
         this.clientSelector = 0;
      }
      
      public function wrap(param1:IDataOutput, param2:ByteArray) : void
      {
         var _loc3_:int = 0;
         while(param2.bytesAvailable > 0)
         {
            _loc3_ = param2.readByte();
            param1.writeByte(_loc3_ ^ this.clientSequence[this.clientSelector]);
            this.clientSequence[this.clientSelector] = _loc3_;
            this.clientSelector ^= _loc3_ & 7;
         }
      }
      
      public function unwrap(param1:ByteArray, param2:IDataInput) : void
      {
         while(param2.bytesAvailable > 0)
         {
            this.serverSequence[this.serverSelector] = param2.readByte() ^ this.serverSequence[this.serverSelector];
            param1.writeByte(this.serverSequence[this.serverSelector]);
            this.serverSelector ^= this.serverSequence[this.serverSelector] & 7;
         }
      }
   }
}

