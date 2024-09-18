package scpacker.networking.protocol.codec.custom
{
   import Renamed5811.ICodec;
   import alternativa.osgi.OSGi;
   import alternativa.osgi.service.clientlog.IClientLog;
   import flash.utils.ByteArray;
   import projects.tanks.client.chat.types.ChatMessage;
   import projects.tanks.client.chat.types.UserStatus;
   import scpacker.networking.protocol.CodecRegisterer;
   
   public class CodecChatMessage implements ICodec
   {
      public static var log:IClientLog = IClientLog(OSGi.getInstance().getService(IClientLog));
      
      private var Renamed10635:ICodec;
      
      private var sourceStatusCodec:ICodec;
      
      private var Renamed10637:ICodec;
      
      private var targetStatusCodec:ICodec;
      
      private var textCodec:ICodec;
      
      private var warningCodec:ICodec;
      
      public function CodecChatMessage(param1:CodecRegisterer)
      {
         super();
         this.sourceStatusCodec = param1.getCodec("scpacker.networking.protocol.codec.custom.CodecUserStatus");
         this.Renamed10637 = param1.getCodec("scpacker.networking.protocol.codec.primitive.BooleanCodec");
         this.targetStatusCodec = param1.getCodec("scpacker.networking.protocol.codec.custom.CodecUserStatus");
         this.textCodec = param1.getCodec("scpacker.networking.protocol.codec.primitive.StringCodec");
         this.warningCodec = param1.getCodec("scpacker.networking.protocol.codec.primitive.BooleanCodec");
      }
      
      public function decode(param1:ByteArray) : Object
      {
         var _loc2_:ChatMessage = new ChatMessage();
         _loc2_.sourceUserStatus = this.sourceStatusCodec.decode(param1) as UserStatus;
         _loc2_.system = this.Renamed10637.decode(param1) as Boolean;
         _loc2_.targetUserStatus = this.targetStatusCodec.decode(param1) as UserStatus;
         _loc2_.text = this.textCodec.decode(param1) as String;
         _loc2_.warning = this.warningCodec.decode(param1) as Boolean;
         return _loc2_;
      }
      
      public function encode(param1:ByteArray, param2:Object) : int
      {
         if(param2 == null)
         {
            throw new Error("Object is null. Use @ProtocolOptional annotation.");
         }
         var _loc3_:ChatMessage = ChatMessage(param2);
         this.sourceStatusCodec.encode(param1,_loc3_.sourceUserStatus);
         this.Renamed10637.encode(param1,_loc3_.system);
         this.targetStatusCodec.encode(param1,_loc3_.targetUserStatus);
         this.textCodec.encode(param1,_loc3_.text);
         this.warningCodec.encode(param1,_loc3_.warning);
         return 4;
      }
   }
}

