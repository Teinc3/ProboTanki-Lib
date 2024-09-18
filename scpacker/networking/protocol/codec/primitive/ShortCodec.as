package scpacker.networking.protocol.codec.primitive
{
   import §[" §.ICodec;
   import flash.utils.ByteArray;
   
   public class ShortCodec implements ICodec
   {
      public function ShortCodec()
      {
         super();
      }
      
      public function encode(param1:ByteArray, param2:Object) : int
      {
         param1.writeShort(int(param2));
         return 2;
      }
      
      public function decode(param1:ByteArray) : Object
      {
         return param1.readShort();
      }
   }
}

