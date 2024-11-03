package scpacker.networking.protocol.codec.primitive
{
   import Renamed5811.ICodec;
   import alternativa.types.Long;
   import flash.utils.ByteArray;
   
   public class LongCodec implements ICodec
   {
      public function LongCodec()
      {
         super();
      }
      
      public function encode(param1:ByteArray, param2:Object) : int
      {
         param1.writeInt(Long(param2).high);
         param1.writeInt(Long(param2).low);
         return 8;
      }
      
      public function decode(param1:ByteArray) : Object
      {
         return Long.getLong(param1.readInt(),param1.readInt());
      }
   }
}

