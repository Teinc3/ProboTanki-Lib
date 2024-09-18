package scpacker.networking.protocol.codec.custom
{
   import Renamed5811.ICodec;
   import alternativa.osgi.OSGi;
   import alternativa.osgi.service.clientlog.IClientLog;
   import flash.utils.ByteArray;
   import projects.tanks.client.battleservice.Renamed1586;
   import projects.tanks.client.battleservice.Renamed1587;
   import projects.tanks.client.tanksservices.types.battle.BattleInfoData;
   import scpacker.networking.protocol.CodecRegisterer;
   
   public class CodecBattleInfoData implements ICodec
   {
      public static var log:IClientLog = IClientLog(OSGi.getInstance().getService(IClientLog));
      
      private var Renamed10567:ICodec;
      
      private var Renamed10568:ICodec;
      
      private var Renamed10569:ICodec;
      
      private var Renamed10558:ICodec;
      
      private var Renamed10559:ICodec;
      
      private var Renamed10570:ICodec;
      
      private var Renamed10571:ICodec;
      
      private var Renamed10572:ICodec;
      
      public function CodecBattleInfoData(param1:CodecRegisterer)
      {
         super();
         this.Renamed10567 = param1.getCodec("scpacker.networking.protocol.codec.primitive.StringCodec");
         this.Renamed10568 = param1.getCodec("scpacker.networking.protocol.codec.primitive.StringCodec");
         this.Renamed10569 = param1.getCodec("scpacker.networking.protocol.codec.custom.CodecBattleMode");
         this.Renamed10558 = param1.getCodec("scpacker.networking.protocol.codec.primitive.BooleanCodec");
         this.Renamed10559 = param1.getCodec("scpacker.networking.protocol.codec.primitive.BooleanCodec");
         this.Renamed10570 = param1.getCodec("scpacker.networking.protocol.codec.custom.CodecRange");
         this.Renamed10571 = param1.getCodec("scpacker.networking.protocol.codec.primitive.BooleanCodec");
         this.Renamed10572 = param1.getCodec("scpacker.networking.protocol.codec.primitive.IntCodec");
      }
      
      public function decode(param1:ByteArray) : Object
      {
         var _loc2_:BattleInfoData = new BattleInfoData();
         _loc2_.battleId = this.Renamed10567.decode(param1) as String;
         _loc2_.mapName = this.Renamed10568.decode(param1) as String;
         _loc2_.mode = this.Renamed10569.decode(param1) as Renamed1587;
         _loc2_.privateBattle = this.Renamed10558.decode(param1) as Boolean;
         _loc2_.proBattle = this.Renamed10559.decode(param1) as Boolean;
         _loc2_.range = this.Renamed10570.decode(param1) as Renamed1586;
         _loc2_.serverNumber = this.Renamed10572.decode(param1) as int;
         return _loc2_;
      }
      
      public function encode(param1:ByteArray, param2:Object) : int
      {
         if(param2 == null)
         {
            throw new Error("Object is null. Use @ProtocolOptional annotation.");
         }
         var _loc3_:BattleInfoData = BattleInfoData(param2);
         this.Renamed10567.encode(param1,_loc3_.battleId);
         this.Renamed10568.encode(param1,_loc3_.mapName);
         this.Renamed10569.encode(param1,_loc3_.mode);
         this.Renamed10558.encode(param1,_loc3_.privateBattle);
         this.Renamed10559.encode(param1,_loc3_.proBattle);
         this.Renamed10570.encode(param1,_loc3_.range);
         this.Renamed10572.encode(param1,_loc3_.serverNumber);
         return 4;
      }
   }
}

