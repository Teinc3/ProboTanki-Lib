package scpacker.networking.protocol.codec.custom
{
   import §[" §.ICodec;
   import flash.utils.ByteArray;
   import projects.tanks.client.achievements.model.achievements.§null package extends§;
   
   public class CodecAchievement implements ICodec
   {
      public function CodecAchievement()
      {
         super();
      }
      
      public function decode(param1:ByteArray) : Object
      {
         var _loc2_:§null package extends§ = null;
         var _loc3_:int = param1.readInt();
         switch(_loc3_)
         {
            case 0:
               _loc2_ = §null package extends§.FIRST_RANK_UP;
               break;
            case 1:
               _loc2_ = §null package extends§.FIRST_PURCHASE;
               break;
            case 2:
               _loc2_ = §null package extends§.SET_EMAIL;
               break;
            case 3:
               _loc2_ = §null package extends§.FIGHT_FIRST_BATTLE;
               break;
            case 4:
               _loc2_ = §null package extends§.FIRST_DONATE;
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

