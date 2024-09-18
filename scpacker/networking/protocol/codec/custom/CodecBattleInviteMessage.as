package scpacker.networking.protocol.codec.custom
{
   import Renamed5811.ICodec;
   import alternativa.osgi.OSGi;
   import alternativa.osgi.service.clientlog.IClientLog;
   import flash.utils.ByteArray;
   import projects.tanks.client.battleservice.Renamed1587;
   import projects.tanks.client.panel.model.battleinvite.BattleInviteMessage;
   import scpacker.networking.protocol.Renamed536;
   
   public class CodecBattleInviteMessage implements ICodec
   {
      public static var log:IClientLog = IClientLog(OSGi.getInstance().getService(IClientLog));
      
      private var Renamed10578:ICodec;
      
      private var Renamed10579:ICodec;
      
      private var Renamed10567:ICodec;
      
      private var Renamed10580:ICodec;
      
      private var Renamed10568:ICodec;
      
      private var Renamed10569:ICodec;
      
      private var Renamed10581:ICodec;
      
      private var Renamed10558:ICodec;
      
      private var Renamed10571:ICodec;
      
      private var Renamed10572:ICodec;
      
      private var Renamed10582:ICodec;
      
      public function CodecBattleInviteMessage(param1:Renamed536)
      {
         super();
         this.Renamed10578 = param1.getCodec("scpacker.networking.protocol.codec.primitive.BooleanCodec");
         this.Renamed10579 = param1.getCodec("scpacker.networking.protocol.codec.primitive.BooleanCodec");
         this.Renamed10567 = param1.getCodec("scpacker.networking.protocol.codec.primitive.StringCodec");
         this.Renamed10580 = param1.getCodec("scpacker.networking.protocol.codec.primitive.StringCodec");
         this.Renamed10568 = param1.getCodec("scpacker.networking.protocol.codec.primitive.StringCodec");
         this.Renamed10569 = param1.getCodec("scpacker.networking.protocol.codec.custom.CodecBattleMode");
         this.Renamed10581 = param1.getCodec("scpacker.networking.protocol.codec.primitive.BooleanCodec");
         this.Renamed10558 = param1.getCodec("scpacker.networking.protocol.codec.primitive.BooleanCodec");
         this.Renamed10571 = param1.getCodec("scpacker.networking.protocol.codec.primitive.BooleanCodec");
         this.Renamed10572 = param1.getCodec("scpacker.networking.protocol.codec.primitive.IntCodec");
         this.Renamed10582 = param1.getCodec("scpacker.networking.protocol.codec.primitive.StringCodec");
      }
      
      public function decode(param1:ByteArray) : Object
      {
         var _loc2_:BattleInviteMessage = new BattleInviteMessage();
         _loc2_.availableRank = this.Renamed10578.decode(param1) as Boolean;
         _loc2_.availableSlot = this.Renamed10579.decode(param1) as Boolean;
         _loc2_.battleId = this.Renamed10567.decode(param1) as String;
         _loc2_.mapName = this.Renamed10568.decode(param1) as String;
         _loc2_.mode = this.Renamed10569.decode(param1) as Renamed1587;
         _loc2_.noSuppliesBattle = this.Renamed10581.decode(param1) as Boolean;
         _loc2_.privateBattle = this.Renamed10558.decode(param1) as Boolean;
         _loc2_.remote = false;
         _loc2_.serverNumber = 1;
         return _loc2_;
      }
      
      public function encode(param1:ByteArray, param2:Object) : int
      {
         if(param2 == null)
         {
            throw new Error("Object is null. Use @ProtocolOptional annotation.");
         }
         var _loc3_:BattleInviteMessage = BattleInviteMessage(param2);
         this.Renamed10578.encode(param1,_loc3_.availableRank);
         this.Renamed10579.encode(param1,_loc3_.availableSlot);
         this.Renamed10567.encode(param1,_loc3_.battleId);
         this.Renamed10568.encode(param1,_loc3_.mapName);
         this.Renamed10569.encode(param1,_loc3_.mode);
         this.Renamed10581.encode(param1,_loc3_.noSuppliesBattle);
         this.Renamed10558.encode(param1,_loc3_.privateBattle);
         this.Renamed10571.encode(param1,_loc3_.remote);
         this.Renamed10572.encode(param1,_loc3_.serverNumber);
         return 4;
      }
   }
}

