package Renamed4084
{
   import alternativa.protocol.ICodec;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.ProtocolBuffer;
   import platform.client.core.general.socialnetwork.types.Gender;
   
   public class Renamed4085 implements ICodec
   {
      public function Renamed4085()
      {
         super();
      }
      
      public function init(param1:IProtocol) : void
      {
      }
      
      public function decode(param1:ProtocolBuffer) : Object
      {
         var _loc2_:Gender = null;
         var _loc3_:int = int(param1.reader.readInt());
         switch(_loc3_)
         {
            case 0:
               _loc2_ = Gender.MALE;
               break;
            case 1:
               _loc2_ = Gender.FEMALE;
               break;
            case 2:
               _loc2_ = Gender.NONE;
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

