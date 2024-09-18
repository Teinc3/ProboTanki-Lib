package scpacker.networking.protocol.codec.custom
{
   import Renamed5811.ICodec;
   import flash.utils.ByteArray;
   import Renamed82.Renamed8544;
   
   public class CodecIsisState implements ICodec
   {
      public function CodecIsisState()
      {
         super();
      }
      
      public function decode(param1:ByteArray) : Object
      {
         var _loc2_:Renamed8544 = null;
         var _loc3_:int = param1.readInt();
         switch(_loc3_)
         {
            case 0:
               _loc2_ = Renamed8544.OFF;
               break;
            case 1:
               _loc2_ = Renamed8544.IDLE;
               break;
            case 2:
               _loc2_ = Renamed8544.HEALING;
               break;
            case 3:
               _loc2_ = Renamed8544.DAMAGING;
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

