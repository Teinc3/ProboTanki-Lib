package Renamed147
{
   import alternativa.protocol.ICodec;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.ProtocolBuffer;
   import platform.client.models.commons.types.ValidationStatus;
   
   public class CodecValidationStatus implements ICodec
   {
      public function CodecValidationStatus()
      {
         super();
      }
      
      public function init(param1:IProtocol) : void
      {
      }
      
      public function decode(param1:ProtocolBuffer) : Object
      {
         var _loc2_:ValidationStatus = null;
         var _loc3_:int = int(param1.reader.readInt());
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
      
      public function encode(param1:ProtocolBuffer, param2:Object) : void
      {
         if(param2 == null)
         {
            throw new Error("Object is null. Use @ProtocolOptional annotation.");
         }
         var _loc3_:int = int(param2.value);
         param1.writer.writeInt(_loc3_);
      }
   }
}

