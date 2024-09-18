package scpacker.networking.protocol.codec.custom
{
   import Renamed5811.ICodec;
   import alternativa.osgi.OSGi;
   import alternativa.osgi.service.clientlog.IClientLog;
   import flash.utils.ByteArray;
   import projects.tanks.client.battleservice.model.statistics.Renamed2737;
   import projects.tanks.client.users.services.chatmoderator.ChatModeratorLevel;
   import scpacker.networking.protocol.Renamed536;
   
   public class CodecUserInfo implements ICodec
   {
      public static var log:IClientLog = IClientLog(OSGi.getInstance().getService(IClientLog));
      
      private var Renamed10627:ICodec;
      
      private var Renamed10744:ICodec;
      
      private var Renamed10573:ICodec;
      
      private var Renamed10708:ICodec;
      
      private var Renamed10574:ICodec;
      
      private var Renamed10745:ICodec;
      
      private var Renamed10576:ICodec;
      
      public function CodecUserInfo(param1:Renamed536)
      {
         super();
         this.Renamed10627 = param1.getCodec("scpacker.networking.protocol.codec.custom.CodecChatModeratorLevel");
         this.Renamed10744 = param1.getCodec("scpacker.networking.protocol.codec.primitive.IntCodec");
         this.Renamed10573 = param1.getCodec("scpacker.networking.protocol.codec.primitive.IntCodec");
         this.Renamed10708 = param1.getCodec("scpacker.networking.protocol.codec.primitive.ByteCodec");
         this.Renamed10574 = param1.getCodec("scpacker.networking.protocol.codec.primitive.IntCodec");
         this.Renamed10745 = param1.getCodec("scpacker.networking.protocol.codec.primitive.StringCodec");
      }
      
      public function decode(param1:ByteArray) : Object
      {
         var _loc2_:Renamed2737 = new Renamed2737();
         _loc2_.chatModeratorLevel = this.Renamed10627.decode(param1) as ChatModeratorLevel;
         _loc2_.deaths = this.Renamed10744.decode(param1) as int;
         _loc2_.kills = this.Renamed10573.decode(param1) as int;
         _loc2_.rank = this.Renamed10708.decode(param1) as int;
         _loc2_.score = this.Renamed10574.decode(param1) as int;
         _loc2_.uid = this.Renamed10745.decode(param1) as String;
         _loc2_.user = _loc2_.uid;
         return _loc2_;
      }
      
      public function encode(param1:ByteArray, param2:Object) : int
      {
         if(param2 == null)
         {
            throw new Error("Object is null. Use @ProtocolOptional annotation.");
         }
         var _loc3_:Renamed2737 = Renamed2737(param2);
         this.Renamed10627.encode(param1,_loc3_.chatModeratorLevel);
         this.Renamed10744.encode(param1,_loc3_.deaths);
         this.Renamed10573.encode(param1,_loc3_.kills);
         this.Renamed10708.encode(param1,_loc3_.rank);
         this.Renamed10574.encode(param1,_loc3_.score);
         this.Renamed10745.encode(param1,_loc3_.uid);
         return 4;
      }
   }
}

