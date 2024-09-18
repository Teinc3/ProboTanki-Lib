package scpacker.networking.protocol.codec.custom
{
   import Renamed232.Renamed1582;
   import Renamed5811.ICodec;
   import alternativa.osgi.OSGi;
   import alternativa.osgi.service.clientlog.IClientLog;
   import Renamed312.Renamed1585;
   import flash.utils.ByteArray;
   import projects.tanks.client.battleservice.Renamed1587;
   import projects.tanks.client.battleservice.model.statistics.Renamed4220;
   import scpacker.networking.protocol.CodecRegisterer;
   
   public class CodecStatisticsModelCC implements ICodec
   {
      public static var log:IClientLog = IClientLog(OSGi.getInstance().getService(IClientLog));
      
      private var Renamed10550:ICodec;
      
      private var Renamed10552:ICodec;
      
      private var Renamed10719:ICodec;
      
      private var Renamed10554:ICodec;
      
      private var Renamed10568:ICodec;
      
      private var Renamed10720:ICodec;
      
      private var Renamed10556:ICodec;
      
      private var Renamed10721:ICodec;
      
      private var Renamed10722:ICodec;
      
      private var Renamed10557:ICodec;
      
      private var Renamed10723:ICodec;
      
      private var Renamed10724:ICodec;
      
      private var Renamed10725:ICodec;
      
      private var Renamed10726:ICodec;
      
      private var Renamed10727:ICodec;
      
      public function CodecStatisticsModelCC(param1:CodecRegisterer)
      {
         super();
         this.Renamed10550 = param1.getCodec("scpacker.networking.protocol.codec.custom.CodecBattleMode");
         this.Renamed10552 = param1.getCodec("scpacker.networking.protocol.codec.custom.CodecEquipmentConstraintsMode");
         this.Renamed10719 = param1.getCodec("scpacker.networking.protocol.codec.primitive.IntCodec");
         this.Renamed10554 = param1.getCodec("scpacker.networking.protocol.codec.custom.CodecBattleLimits");
         this.Renamed10568 = param1.getCodec("scpacker.networking.protocol.codec.primitive.StringCodec");
         this.Renamed10720 = param1.getCodec("scpacker.networking.protocol.codec.primitive.BooleanCodec");
         this.Renamed10556 = param1.getCodec("scpacker.networking.protocol.codec.primitive.IntCodec");
         this.Renamed10721 = param1.getCodec("scpacker.networking.protocol.codec.primitive.StringCodec");
         this.Renamed10722 = param1.getCodec("scpacker.networking.protocol.codec.primitive.IntCodec");
         this.Renamed10557 = param1.getCodec("scpacker.networking.protocol.codec.primitive.BooleanCodec");
         this.Renamed10723 = param1.getCodec("scpacker.networking.protocol.codec.primitive.IntCodec");
         this.Renamed10724 = param1.getCodec("scpacker.networking.protocol.codec.primitive.BooleanCodec");
         this.Renamed10725 = param1.getCodec("scpacker.networking.protocol.codec.complex.VectorCodecString");
         this.Renamed10726 = param1.getCodec("scpacker.networking.protocol.codec.primitive.IntCodec");
         this.Renamed10727 = param1.getCodec("scpacker.networking.protocol.codec.primitive.BooleanCodec");
      }
      
      public function decode(param1:ByteArray) : Object
      {
         var _loc2_:Renamed4220 = new Renamed4220();
         _loc2_.battleMode = this.Renamed10550.decode(param1) as Renamed1587;
         _loc2_.equipmentConstraintsMode = this.Renamed10552.decode(param1) as Renamed1582;
         _loc2_.fund = this.Renamed10719.decode(param1) as int;
         _loc2_.Renamed1601 = this.Renamed10554.decode(param1) as Renamed1585;
         _loc2_.mapName = this.Renamed10568.decode(param1) as String;
         _loc2_.maxPeopleCount = this.Renamed10556.decode(param1) as int;
         _loc2_.parkourMode = this.Renamed10557.decode(param1) as Boolean;
         _loc2_.Renamed4232 = this.Renamed10723.decode(param1) as int;
         _loc2_.spectator = this.Renamed10724.decode(param1) as Boolean;
         _loc2_.Renamed4233 = this.Renamed10725.decode(param1) as Vector.<String>;
         _loc2_.Renamed4234 = this.Renamed10726.decode(param1) as int;
         return _loc2_;
      }
      
      public function encode(param1:ByteArray, param2:Object) : int
      {
         if(param2 == null)
         {
            throw new Error("Object is null. Use @ProtocolOptional annotation.");
         }
         var _loc3_:Renamed4220 = Renamed4220(param2);
         this.Renamed10552.encode(param1,_loc3_.equipmentConstraintsMode);
         this.Renamed10719.encode(param1,_loc3_.fund);
         this.Renamed10554.encode(param1,_loc3_.Renamed1601);
         this.Renamed10568.encode(param1,_loc3_.mapName);
         this.Renamed10720.encode(param1,_loc3_.Renamed4229);
         this.Renamed10556.encode(param1,_loc3_.maxPeopleCount);
         this.Renamed10721.encode(param1,_loc3_.Renamed4230);
         this.Renamed10722.encode(param1,_loc3_.Renamed4231);
         this.Renamed10557.encode(param1,_loc3_.parkourMode);
         this.Renamed10723.encode(param1,_loc3_.Renamed4232);
         this.Renamed10724.encode(param1,_loc3_.spectator);
         this.Renamed10725.encode(param1,_loc3_.Renamed4233);
         this.Renamed10726.encode(param1,_loc3_.Renamed4234);
         this.Renamed10727.encode(param1,_loc3_.Renamed4235);
         return 4;
      }
   }
}

