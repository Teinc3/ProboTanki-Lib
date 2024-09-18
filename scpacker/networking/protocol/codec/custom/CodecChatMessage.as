package scpacker.networking.protocol.codec.custom
{
   import §[" §.ICodec;
   import alternativa.osgi.OSGi;
   import alternativa.osgi.service.clientlog.IClientLog;
   import flash.utils.ByteArray;
   import projects.tanks.client.chat.types.ChatMessage;
   import projects.tanks.client.chat.types.UserStatus;
   import scpacker.networking.protocol.§?"s§;
   
   public class CodecChatMessage implements ICodec
   {
      public static var log:IClientLog = IClientLog(OSGi.getInstance().getService(IClientLog));
      
      private var §import for override§:ICodec;
      
      private var §;#2§:ICodec;
      
      private var §#"u§:ICodec;
      
      private var §6!9§:ICodec;
      
      private var §dynamic catch use§:ICodec;
      
      private var §set package switch§:ICodec;
      
      public function CodecChatMessage(param1:§?"s§)
      {
         super();
         this.§;#2§ = param1.getCodec("scpacker.networking.protocol.codec.custom.CodecUserStatus");
         this.§#"u§ = param1.getCodec("scpacker.networking.protocol.codec.primitive.BooleanCodec");
         this.§6!9§ = param1.getCodec("scpacker.networking.protocol.codec.custom.CodecUserStatus");
         this.§dynamic catch use§ = param1.getCodec("scpacker.networking.protocol.codec.primitive.StringCodec");
         this.§set package switch§ = param1.getCodec("scpacker.networking.protocol.codec.primitive.BooleanCodec");
      }
      
      public function decode(param1:ByteArray) : Object
      {
         var _loc2_:ChatMessage = new ChatMessage();
         _loc2_.sourceUserStatus = this.§;#2§.decode(param1) as UserStatus;
         _loc2_.system = this.§#"u§.decode(param1) as Boolean;
         _loc2_.targetUserStatus = this.§6!9§.decode(param1) as UserStatus;
         _loc2_.text = this.§dynamic catch use§.decode(param1) as String;
         _loc2_.warning = this.§set package switch§.decode(param1) as Boolean;
         return _loc2_;
      }
      
      public function encode(param1:ByteArray, param2:Object) : int
      {
         if(param2 == null)
         {
            throw new Error("Object is null. Use @ProtocolOptional annotation.");
         }
         var _loc3_:ChatMessage = ChatMessage(param2);
         this.§;#2§.encode(param1,_loc3_.sourceUserStatus);
         this.§#"u§.encode(param1,_loc3_.system);
         this.§6!9§.encode(param1,_loc3_.targetUserStatus);
         this.§dynamic catch use§.encode(param1,_loc3_.text);
         this.§set package switch§.encode(param1,_loc3_.warning);
         return 4;
      }
   }
}

