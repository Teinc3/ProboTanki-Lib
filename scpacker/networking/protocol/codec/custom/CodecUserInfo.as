package scpacker.networking.protocol.codec.custom
{
   import §[" §.ICodec;
   import alternativa.osgi.OSGi;
   import alternativa.osgi.service.clientlog.IClientLog;
   import flash.utils.ByteArray;
   import projects.tanks.client.battleservice.model.statistics.§in for for§;
   import projects.tanks.client.users.services.chatmoderator.ChatModeratorLevel;
   import scpacker.networking.protocol.§?"s§;
   
   public class CodecUserInfo implements ICodec
   {
      public static var log:IClientLog = IClientLog(OSGi.getInstance().getService(IClientLog));
      
      private var §break var import§:ICodec;
      
      private var §static var use§:ICodec;
      
      private var §0[§:ICodec;
      
      private var §,!k§:ICodec;
      
      private var §each package do§:ICodec;
      
      private var §"#$§:ICodec;
      
      private var §try set use§:ICodec;
      
      public function CodecUserInfo(param1:§?"s§)
      {
         super();
         this.§break var import§ = param1.getCodec("scpacker.networking.protocol.codec.custom.CodecChatModeratorLevel");
         this.§static var use§ = param1.getCodec("scpacker.networking.protocol.codec.primitive.IntCodec");
         this.§0[§ = param1.getCodec("scpacker.networking.protocol.codec.primitive.IntCodec");
         this.§,!k§ = param1.getCodec("scpacker.networking.protocol.codec.primitive.ByteCodec");
         this.§each package do§ = param1.getCodec("scpacker.networking.protocol.codec.primitive.IntCodec");
         this.§"#$§ = param1.getCodec("scpacker.networking.protocol.codec.primitive.StringCodec");
      }
      
      public function decode(param1:ByteArray) : Object
      {
         var _loc2_:§in for for§ = new §in for for§();
         _loc2_.chatModeratorLevel = this.§break var import§.decode(param1) as ChatModeratorLevel;
         _loc2_.deaths = this.§static var use§.decode(param1) as int;
         _loc2_.kills = this.§0[§.decode(param1) as int;
         _loc2_.rank = this.§,!k§.decode(param1) as int;
         _loc2_.score = this.§each package do§.decode(param1) as int;
         _loc2_.uid = this.§"#$§.decode(param1) as String;
         _loc2_.user = _loc2_.uid;
         return _loc2_;
      }
      
      public function encode(param1:ByteArray, param2:Object) : int
      {
         if(param2 == null)
         {
            throw new Error("Object is null. Use @ProtocolOptional annotation.");
         }
         var _loc3_:§in for for§ = §in for for§(param2);
         this.§break var import§.encode(param1,_loc3_.chatModeratorLevel);
         this.§static var use§.encode(param1,_loc3_.deaths);
         this.§0[§.encode(param1,_loc3_.kills);
         this.§,!k§.encode(param1,_loc3_.rank);
         this.§each package do§.encode(param1,_loc3_.score);
         this.§"#$§.encode(param1,_loc3_.uid);
         return 4;
      }
   }
}

