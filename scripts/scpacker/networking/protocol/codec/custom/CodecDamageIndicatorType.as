package scpacker.networking.protocol.codec.custom
{
   import Renamed194.DamageType;
   import Renamed5811.ICodec;
   import flash.utils.ByteArray;
   
   public class CodecDamageIndicatorType implements ICodec
   {
      public function CodecDamageIndicatorType()
      {
         super();
      }
      
      public function decode(param1:ByteArray) : Object
      {
         var _loc2_:DamageType = null;
         var _loc3_:int = param1.readInt();
         switch(_loc3_)
         {
            case 0:
               _loc2_ = DamageType.NORMAL;
               break;
            case 1:
               _loc2_ = DamageType.CRITICAL;
               break;
            case 2:
               _loc2_ = DamageType.FATAL;
               break;
            case 3:
               _loc2_ = DamageType.HEAL;
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

