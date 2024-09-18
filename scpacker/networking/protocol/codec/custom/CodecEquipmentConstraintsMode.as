package scpacker.networking.protocol.codec.custom
{
   import §1!R§.§throw package static§;
   import §[" §.ICodec;
   import flash.utils.ByteArray;
   
   public class CodecEquipmentConstraintsMode implements ICodec
   {
      public function CodecEquipmentConstraintsMode()
      {
         super();
      }
      
      public function decode(param1:ByteArray) : Object
      {
         var _loc2_:§throw package static§ = null;
         var _loc3_:int = param1.readInt();
         switch(_loc3_)
         {
            case 0:
               _loc2_ = §throw package static§.NONE;
               break;
            case 1:
               _loc2_ = §throw package static§.HORNET_RAILGUN;
               break;
            case 2:
               _loc2_ = §throw package static§.WASP_RAILGUN;
               break;
            case 3:
               _loc2_ = §throw package static§.HORNET_WASP_RAILGUN;
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

