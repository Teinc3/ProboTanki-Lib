package scpacker.networking.protocol.codec.primitive
{
   import §[" §.ICodec;
   import flash.utils.ByteArray;
   
   public class DoubleCodec implements ICodec
   {
      public function DoubleCodec()
      {
         super();
      }
      
      public function encode(param1:ByteArray, param2:Object) : int
      {
         param1.writeDouble(Number(param2));
         return 8;
      }
      
      public function decode(param1:ByteArray) : Object
      {
         return param1.readDouble();
      }
   }
}

