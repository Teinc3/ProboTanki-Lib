package scpacker.networking.protocol.codec.custom
{
   import Renamed5811.ICodec;
   import flash.utils.ByteArray;
   import projects.tanks.client.battleselect.model.item.Renamed1620;
   
   public class CodecBattleSuspicionLevel implements ICodec
   {
      public function CodecBattleSuspicionLevel()
      {
         super();
      }
      
      public function decode(param1:ByteArray) : Object
      {
         var _loc2_:Renamed1620 = null;
         var _loc3_:int = param1.readInt();
         switch(_loc3_)
         {
            case 0:
               _loc2_ = Renamed1620.NONE;
               break;
            case 1:
               _loc2_ = Renamed1620.LOW;
               break;
            case 2:
               _loc2_ = Renamed1620.HIGH;
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

