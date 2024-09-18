package scpacker.networking.protocol.codec.custom
{
   import Renamed5811.ICodec;
   import flash.utils.ByteArray;
   import platform.client.models.commons.types.ValidationStatus;
   
   public class CodecValidationStatus implements ICodec
   {
      public function CodecValidationStatus()
      {
         super();
      }
      
      public function decode(param1:ByteArray) : Object
      {
         var _loc2_:ValidationStatus = null;
         var _loc3_:int = param1.readInt();
         switch(_loc3_)
         {
            case 0:
               _loc2_ = ValidationStatus.TOO_SHORT;
               break;
            case 1:
               _loc2_ = ValidationStatus.TOO_LONG;
               break;
            case 2:
               _loc2_ = ValidationStatus.NOT_UNIQUE;
               break;
            case 3:
               _loc2_ = ValidationStatus.NOT_MATCH_PATTERN;
               break;
            case 4:
               _loc2_ = ValidationStatus.FORBIDDEN;
               break;
            case 5:
               _loc2_ = ValidationStatus.CORRECT;
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

