package scpacker.networking.protocol.codec.custom
{
   import Renamed5811.ICodec;
   import alternativa.osgi.OSGi;
   import alternativa.osgi.service.clientlog.IClientLog;
   import flash.utils.ByteArray;
   import projects.tanks.client.chat.models.chat.chat.ChatCC;
   import projects.tanks.client.users.services.chatmoderator.ChatModeratorLevel;
   import scpacker.networking.protocol.CodecRegisterer;
   
   public class CodecChatCC implements ICodec
   {
      public static var log:IClientLog = IClientLog(OSGi.getInstance().getService(IClientLog));
      
      private var Renamed10623:ICodec;
      
      private var Renamed10624:ICodec;
      
      private var Renamed10625:ICodec;
      
      private var Renamed10626:ICodec;
      
      private var Renamed10627:ICodec;
      
      private var Renamed10628:ICodec;
      
      private var Renamed10629:ICodec;
      
      private var Renamed10630:ICodec;
      
      private var Renamed10631:ICodec;
      
      private var Renamed10632:ICodec;
      
      private var Renamed10633:ICodec;
      
      private var Renamed10634:ICodec;
      
      public function CodecChatCC(param1:CodecRegisterer)
      {
         super();
         this.Renamed10623 = param1.getCodec("scpacker.networking.protocol.codec.primitive.BooleanCodec");
         this.Renamed10624 = param1.getCodec("scpacker.networking.protocol.codec.primitive.BooleanCodec");
         this.Renamed10625 = param1.getCodec("scpacker.networking.protocol.codec.primitive.IntCodec");
         this.Renamed10626 = param1.getCodec("scpacker.networking.protocol.codec.primitive.BooleanCodec");
         this.Renamed10627 = param1.getCodec("scpacker.networking.protocol.codec.custom.CodecChatModeratorLevel");
         this.Renamed10628 = param1.getCodec("scpacker.networking.protocol.codec.primitive.StringCodec");
         this.Renamed10629 = param1.getCodec("scpacker.networking.protocol.codec.complex.VectorCodecString");
         this.Renamed10630 = param1.getCodec("scpacker.networking.protocol.codec.primitive.IntCodec");
         this.Renamed10631 = param1.getCodec("scpacker.networking.protocol.codec.primitive.IntCodec");
         this.Renamed10632 = param1.getCodec("scpacker.networking.protocol.codec.primitive.StringCodec");
         this.Renamed10633 = param1.getCodec("scpacker.networking.protocol.codec.primitive.BooleanCodec");
         this.Renamed10634 = param1.getCodec("scpacker.networking.protocol.codec.primitive.BooleanCodec");
      }
      
      public function decode(param1:ByteArray) : Object
      {
         var _loc2_:ChatCC = new ChatCC();
         _loc2_.admin = this.Renamed10623.decode(param1) as Boolean;
         _loc2_.antifloodEnabled = this.Renamed10624.decode(param1) as Boolean;
         _loc2_.bufferSize = this.Renamed10625.decode(param1) as int;
         _loc2_.chatEnabled = this.Renamed10626.decode(param1) as Boolean;
         _loc2_.chatModeratorLevel = this.Renamed10627.decode(param1) as ChatModeratorLevel;
         _loc2_.linksWhiteList = this.Renamed10629.decode(param1) as Vector.<String>;
         _loc2_.minChar = this.Renamed10630.decode(param1) as int;
         _loc2_.minWord = this.Renamed10631.decode(param1) as int;
         _loc2_.selfName = this.Renamed10632.decode(param1) as String;
         _loc2_.showLinks = this.Renamed10633.decode(param1) as Boolean;
         _loc2_.typingSpeedAntifloodEnabled = this.Renamed10634.decode(param1) as Boolean;
         return _loc2_;
      }
      
      public function encode(param1:ByteArray, param2:Object) : int
      {
         if(param2 == null)
         {
            throw new Error("Object is null. Use @ProtocolOptional annotation.");
         }
         var _loc3_:ChatCC = ChatCC(param2);
         this.Renamed10623.encode(param1,_loc3_.admin);
         this.Renamed10624.encode(param1,_loc3_.antifloodEnabled);
         this.Renamed10625.encode(param1,_loc3_.bufferSize);
         this.Renamed10626.encode(param1,_loc3_.chatEnabled);
         this.Renamed10627.encode(param1,_loc3_.chatModeratorLevel);
         this.Renamed10629.encode(param1,_loc3_.linksWhiteList);
         this.Renamed10630.encode(param1,_loc3_.minChar);
         this.Renamed10631.encode(param1,_loc3_.minWord);
         this.Renamed10632.encode(param1,_loc3_.selfName);
         this.Renamed10633.encode(param1,_loc3_.showLinks);
         this.Renamed10634.encode(param1,_loc3_.typingSpeedAntifloodEnabled);
         return 4;
      }
   }
}

