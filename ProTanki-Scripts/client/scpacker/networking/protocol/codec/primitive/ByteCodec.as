package scpacker.networking.protocol.codec.primitive
{
   import Renamed5811.ICodec;
   import flash.utils.ByteArray;
   
   public class ByteCodec implements ICodec
   {
      public function ByteCodec()
      {
         super();
      }
      
      public function encode(param1:ByteArray, param2:Object) : int
      {
         param1.writeByte(int(param2));
         return 1;
      }
      
      public function decode(param1:ByteArray) : Object
      {
         return param1.readByte();
      }
   }
}

