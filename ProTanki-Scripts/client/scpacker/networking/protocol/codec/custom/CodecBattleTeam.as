package scpacker.networking.protocol.codec.custom
{
   import Renamed136.Renamed663;
   import Renamed5811.ICodec;
   import flash.utils.ByteArray;
   
   public class CodecBattleTeam implements ICodec
   {
      public function CodecBattleTeam()
      {
         super();
      }
      
      public function decode(param1:ByteArray) : Object
      {
         var _loc2_:Renamed663 = null;
         var _loc3_:int = param1.readInt();
         switch(_loc3_)
         {
            case 0:
               _loc2_ = Renamed663.RED;
               break;
            case 1:
               _loc2_ = Renamed663.BLUE;
               break;
            case 2:
               _loc2_ = Renamed663.NONE;
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

