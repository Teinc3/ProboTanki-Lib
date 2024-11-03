package scpacker.networking.protocol.codec.custom
{
   import Renamed5811.Renamed9342;
   import Renamed5811.ICodec;
   import alternativa.osgi.OSGi;
   import alternativa.osgi.service.clientlog.IClientLog;
   import flash.utils.ByteArray;
   import projects.tanks.client.chat.types.UserStatus;
   import projects.tanks.client.users.services.chatmoderator.ChatModeratorLevel;
   import scpacker.networking.protocol.CodecRegisterer;
   
   public class CodecUserStatus extends Renamed9342 implements ICodec
   {
      public static var log:IClientLog = IClientLog(OSGi.getInstance().getService(IClientLog));
      
      private var Renamed10627:ICodec;
      
      private var Renamed10760:ICodec;
      
      private var Renamed10761:ICodec;
      
      private var Renamed10745:ICodec;
      
      private var Renamed10607:ICodec;
      
      public function CodecUserStatus(param1:CodecRegisterer)
      {
         super();
         this.Renamed10627 = param1.getCodec("scpacker.networking.protocol.codec.custom.CodecChatModeratorLevel");
         this.Renamed10760 = param1.getCodec("scpacker.networking.protocol.codec.primitive.StringCodec");
         this.Renamed10761 = param1.getCodec("scpacker.networking.protocol.codec.primitive.IntCodec");
         this.Renamed10745 = param1.getCodec("scpacker.networking.protocol.codec.primitive.StringCodec");
         this.Renamed10607 = param1.getCodec("scpacker.networking.protocol.codec.primitive.StringCodec");
      }
      
      public function decode(param1:ByteArray) : Object
      {
         if(Renamed9343(param1))
         {
            return null;
         }
         var _loc2_:UserStatus = new UserStatus();
         _loc2_.chatModeratorLevel = this.Renamed10627.decode(param1) as ChatModeratorLevel;
         _loc2_.ip = this.Renamed10760.decode(param1) as String;
         _loc2_.rankIndex = this.Renamed10761.decode(param1) as int;
         _loc2_.userId = _loc2_.uid = this.Renamed10745.decode(param1) as String;
         return _loc2_;
      }
      
      public function encode(param1:ByteArray, param2:Object) : int
      {
         if(param2 == null)
         {
            throw new Error("Object is null. Use @ProtocolOptional annotation.");
         }
         var _loc3_:UserStatus = UserStatus(param2);
         this.Renamed10627.encode(param1,_loc3_.chatModeratorLevel);
         this.Renamed10760.encode(param1,_loc3_.ip);
         this.Renamed10761.encode(param1,_loc3_.rankIndex);
         this.Renamed10745.encode(param1,_loc3_.uid);
         this.Renamed10607.encode(param1,_loc3_.userId);
         return 4;
      }
   }
}

