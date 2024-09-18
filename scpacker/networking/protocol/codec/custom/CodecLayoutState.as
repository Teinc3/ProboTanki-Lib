package scpacker.networking.protocol.codec.custom
{
   import §[" §.ICodec;
   import flash.utils.ByteArray;
   import projects.tanks.client.commons.models.layout.LayoutState;
   
   public class CodecLayoutState implements ICodec
   {
      public function CodecLayoutState()
      {
         super();
      }
      
      public function decode(param1:ByteArray) : Object
      {
         var _loc2_:LayoutState = null;
         var _loc3_:int = param1.readInt();
         switch(_loc3_)
         {
            case 0:
               _loc2_ = LayoutState.BATTLE_SELECT;
               break;
            case 1:
               _loc2_ = LayoutState.GARAGE;
               break;
            case 2:
               _loc2_ = LayoutState.PAYMENT;
               break;
            case 3:
               _loc2_ = LayoutState.BATTLE;
               break;
            case 4:
               _loc2_ = LayoutState.RELOAD_SPACE;
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

