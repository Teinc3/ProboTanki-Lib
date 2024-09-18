package scpacker.networking.protocol.codec.primitive
{
   import §[" §.ICodec;
   import flash.utils.ByteArray;
   
   public class IntCodec implements ICodec
   {
      public function IntCodec()
      {
         super();
      }
      
      public function encode(param1:ByteArray, param2:Object) : int
      {
         param1.writeInt(int(param2));
         return 4;
      }
      
      public function decode(param1:ByteArray) : Object
      {
         return param1.readInt();
      }
   }
}

