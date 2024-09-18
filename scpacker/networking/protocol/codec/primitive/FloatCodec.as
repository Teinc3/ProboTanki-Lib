package scpacker.networking.protocol.codec.primitive
{
   import §[" §.ICodec;
   import flash.utils.ByteArray;
   
   public class FloatCodec implements ICodec
   {
      public function FloatCodec()
      {
         super();
      }
      
      public function encode(param1:ByteArray, param2:Object) : int
      {
         param1.writeFloat(Number(param2));
         return 4;
      }
      
      public function decode(param1:ByteArray) : Object
      {
         return param1.readFloat();
      }
   }
}

