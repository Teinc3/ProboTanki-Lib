package scpacker.networking.protocol.codec.custom
{
   import §[" §.§#""§;
   import §[" §.ICodec;
   import alternativa.osgi.OSGi;
   import alternativa.osgi.service.clientlog.IClientLog;
   import flash.utils.ByteArray;
   import projects.tanks.client.chat.types.UserStatus;
   import projects.tanks.client.users.services.chatmoderator.ChatModeratorLevel;
   import scpacker.networking.protocol.§?"s§;
   
   public class CodecUserStatus extends §#""§ implements ICodec
   {
      public static var log:IClientLog = IClientLog(OSGi.getInstance().getService(IClientLog));
      
      private var §break var import§:ICodec;
      
      private var §for set throw§:ICodec;
      
      private var §?!8§:ICodec;
      
      private var §"#$§:ICodec;
      
      private var §'#X§:ICodec;
      
      public function CodecUserStatus(param1:§?"s§)
      {
         super();
         this.§break var import§ = param1.getCodec("scpacker.networking.protocol.codec.custom.CodecChatModeratorLevel");
         this.§for set throw§ = param1.getCodec("scpacker.networking.protocol.codec.primitive.StringCodec");
         this.§?!8§ = param1.getCodec("scpacker.networking.protocol.codec.primitive.IntCodec");
         this.§"#$§ = param1.getCodec("scpacker.networking.protocol.codec.primitive.StringCodec");
         this.§'#X§ = param1.getCodec("scpacker.networking.protocol.codec.primitive.StringCodec");
      }
      
      public function decode(param1:ByteArray) : Object
      {
         if(§each catch else§(param1))
         {
            return null;
         }
         var _loc2_:UserStatus = new UserStatus();
         _loc2_.chatModeratorLevel = this.§break var import§.decode(param1) as ChatModeratorLevel;
         _loc2_.ip = this.§for set throw§.decode(param1) as String;
         _loc2_.rankIndex = this.§?!8§.decode(param1) as int;
         _loc2_.userId = _loc2_.uid = this.§"#$§.decode(param1) as String;
         return _loc2_;
      }
      
      public function encode(param1:ByteArray, param2:Object) : int
      {
         if(param2 == null)
         {
            throw new Error("Object is null. Use @ProtocolOptional annotation.");
         }
         var _loc3_:UserStatus = UserStatus(param2);
         this.§break var import§.encode(param1,_loc3_.chatModeratorLevel);
         this.§for set throw§.encode(param1,_loc3_.ip);
         this.§?!8§.encode(param1,_loc3_.rankIndex);
         this.§"#$§.encode(param1,_loc3_.uid);
         this.§'#X§.encode(param1,_loc3_.userId);
         return 4;
      }
   }
}

