package scpacker.networking.protocol.codec.custom
{
   import §[" §.ICodec;
   import flash.utils.ByteArray;
   import §set break§.§try var finally§;
   
   public class CodecIsisState implements ICodec
   {
      public function CodecIsisState()
      {
         super();
      }
      
      public function decode(param1:ByteArray) : Object
      {
         var _loc2_:§try var finally§ = null;
         var _loc3_:int = param1.readInt();
         switch(_loc3_)
         {
            case 0:
               _loc2_ = §try var finally§.OFF;
               break;
            case 1:
               _loc2_ = §try var finally§.IDLE;
               break;
            case 2:
               _loc2_ = §try var finally§.HEALING;
               break;
            case 3:
               _loc2_ = §try var finally§.DAMAGING;
         }
         return _loc2_;
      }
      
      public function encode(param1:ByteArray, param2:Object) : int
      {
         if(param2 == null)
         {
            throw new Error("Object is null. Use @ProtocolOptional annotation.");
         }
         var _loc3_:int = int(param2.value);
         param1.writeInt(_loc3_);
         return 4;
      }
   }
}

