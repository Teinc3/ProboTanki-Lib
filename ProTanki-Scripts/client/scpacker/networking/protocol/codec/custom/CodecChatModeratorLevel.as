package scpacker.networking.protocol.codec.custom
{
   import Renamed5811.ICodec;
   import flash.utils.ByteArray;
   import projects.tanks.client.users.services.chatmoderator.ChatModeratorLevel;
   
   public class CodecChatModeratorLevel implements ICodec
   {
      public function CodecChatModeratorLevel()
      {
         super();
      }
      
      public function decode(param1:ByteArray) : Object
      {
         var _loc2_:ChatModeratorLevel = null;
         var _loc3_:int = param1.readInt();
         switch(_loc3_)
         {
            case 0:
               _loc2_ = ChatModeratorLevel.NONE;
               break;
            case 1:
               _loc2_ = ChatModeratorLevel.COMMUNITY_MANAGER;
               break;
            case 2:
               _loc2_ = ChatModeratorLevel.ADMINISTRATOR;
               break;
            case 3:
               _loc2_ = ChatModeratorLevel.MODERATOR;
               break;
            case 4:
               _loc2_ = ChatModeratorLevel.CANDIDATE;
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

