package scpacker.networking.protocol.codec.custom
{
   import §,#a§.§each package default§;
   import §[" §.ICodec;
   import flash.utils.ByteArray;
   
   public class CodecControlPointState implements ICodec
   {
      public function CodecControlPointState()
      {
         super();
      }
      
      public function decode(param1:ByteArray) : Object
      {
         var _loc2_:§each package default§ = null;
         var _loc3_:int = param1.readInt();
         switch(_loc3_)
         {
            case 0:
               _loc2_ = §each package default§.RED;
               break;
            case 1:
               _loc2_ = §each package default§.BLUE;
               break;
            case 2:
               _loc2_ = §each package default§.NEUTRAL;
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

