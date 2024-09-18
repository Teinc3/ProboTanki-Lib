package scpacker.networking.protocol.codec.custom
{
   import Renamed232.Renamed1582;
   import Renamed1614.Renamed1615;
   import Renamed5811.ICodec;
   import alternativa.osgi.OSGi;
   import alternativa.osgi.service.clientlog.IClientLog;
   import Renamed312.Renamed1585;
   import flash.utils.ByteArray;
   import projects.tanks.client.battleservice.Renamed1579;
   import projects.tanks.client.battleservice.Renamed1586;
   import projects.tanks.client.battleservice.Renamed1587;
   import scpacker.networking.protocol.CodecRegisterer;
   
   public class CodecBattleCreateParameters implements ICodec
   {
      public static var log:IClientLog = IClientLog(OSGi.getInstance().getService(IClientLog));
      
      private var Renamed10548:ICodec;
      
      private var Renamed10549:ICodec;
      
      private var Renamed10550:ICodec;
      
      private var Renamed10551:ICodec;
      
      private var Renamed10552:ICodec;
      
      private var Renamed10553:ICodec;
      
      private var Renamed10554:ICodec;
      
      private var Renamed10555:ICodec;
      
      private var Renamed10556:ICodec;
      
      private var Renamed10015:ICodec;
      
      private var Renamed10557:ICodec;
      
      private var Renamed10558:ICodec;
      
      private var Renamed10559:ICodec;
      
      private var Renamed10560:ICodec;
      
      private var Renamed10561:ICodec;
      
      private var Renamed10562:ICodec;
      
      private var Renamed10563:ICodec;
      
      private var Renamed10564:ICodec;
      
      private var Renamed10565:ICodec;
      
      private var Renamed10566:ICodec;
      
      public function CodecBattleCreateParameters(param1:CodecRegisterer)
      {
         super();
         this.Renamed10548 = param1.getCodec("scpacker.networking.protocol.codec.primitive.BooleanCodec");
         this.Renamed10550 = param1.getCodec("scpacker.networking.protocol.codec.custom.CodecBattleMode");
         this.Renamed10551 = param1.getCodec("scpacker.networking.protocol.codec.primitive.BooleanCodec");
         this.Renamed10552 = param1.getCodec("scpacker.networking.protocol.codec.custom.CodecEquipmentConstraintsMode");
         this.Renamed10553 = param1.getCodec("scpacker.networking.protocol.codec.primitive.BooleanCodec");
         this.Renamed10554 = param1.getCodec("scpacker.networking.protocol.codec.custom.CodecBattleLimits");
         this.Renamed10555 = param1.getCodec("scpacker.networking.protocol.codec.primitive.StringCodec");
         this.Renamed10556 = param1.getCodec("scpacker.networking.protocol.codec.primitive.IntCodec");
         this.Renamed10015 = param1.getCodec("scpacker.networking.protocol.codec.primitive.StringCodec");
         this.Renamed10557 = param1.getCodec("scpacker.networking.protocol.codec.primitive.BooleanCodec");
         this.Renamed10558 = param1.getCodec("scpacker.networking.protocol.codec.primitive.BooleanCodec");
         this.Renamed10559 = param1.getCodec("scpacker.networking.protocol.codec.primitive.BooleanCodec");
         this.Renamed10560 = param1.getCodec("scpacker.networking.protocol.codec.custom.CodecRange");
         this.Renamed10561 = param1.getCodec("scpacker.networking.protocol.codec.primitive.BooleanCodec");
         this.Renamed10562 = param1.getCodec("scpacker.networking.protocol.codec.custom.CodecMapTheme");
         this.Renamed10563 = param1.getCodec("scpacker.networking.protocol.codec.primitive.BooleanCodec");
         this.Renamed10564 = param1.getCodec("scpacker.networking.protocol.codec.primitive.BooleanCodec");
         this.Renamed10565 = param1.getCodec("scpacker.networking.protocol.codec.primitive.BooleanCodec");
         this.Renamed10566 = param1.getCodec("scpacker.networking.protocol.codec.primitive.BooleanCodec");
      }
      
      public function decode(param1:ByteArray) : Object
      {
         var _loc2_:Renamed1579 = new Renamed1579();
         _loc2_.autoBalance = this.Renamed10548.decode(param1) as Boolean;
         _loc2_.battleMode = this.Renamed10550.decode(param1) as Renamed1587;
         _loc2_.equipmentConstraintsMode = this.Renamed10552.decode(param1) as Renamed1582;
         _loc2_.friendlyFire = this.Renamed10553.decode(param1) as Boolean;
         _loc2_.Renamed1601 = this.Renamed10554.decode(param1) as Renamed1585;
         _loc2_.mapId = this.Renamed10555.decode(param1) as String;
         _loc2_.maxPeopleCount = this.Renamed10556.decode(param1) as int;
         _loc2_.name = this.Renamed10015.decode(param1) as String;
         _loc2_.parkourMode = this.Renamed10557.decode(param1) as Boolean;
         _loc2_.privateBattle = this.Renamed10558.decode(param1) as Boolean;
         _loc2_.proBattle = this.Renamed10559.decode(param1) as Boolean;
         _loc2_.rankRange = this.Renamed10560.decode(param1) as Renamed1586;
         _loc2_.reArmorEnabled = this.Renamed10561.decode(param1) as Boolean;
         _loc2_.theme = this.Renamed10562.decode(param1) as Renamed1615;
         _loc2_.withoutBonuses = this.Renamed10563.decode(param1) as Boolean;
         _loc2_.withoutCrystals = this.Renamed10564.decode(param1) as Boolean;
         _loc2_.withoutSupplies = this.Renamed10565.decode(param1) as Boolean;
         return _loc2_;
      }
      
      public function encode(param1:ByteArray, param2:Object) : int
      {
         if(param2 == null)
         {
            throw new Error("Object is null. Use @ProtocolOptional annotation.");
         }
         var _loc3_:int = 0;
         var _loc4_:Renamed1579 = Renamed1579(param2);
         _loc3_ += this.Renamed10548.encode(param1,_loc4_.autoBalance);
         _loc3_ += this.Renamed10550.encode(param1,_loc4_.battleMode);
         _loc3_ += this.Renamed10552.encode(param1,_loc4_.equipmentConstraintsMode);
         _loc3_ += this.Renamed10553.encode(param1,_loc4_.friendlyFire);
         _loc3_ += this.Renamed10554.encode(param1,_loc4_.Renamed1601);
         _loc3_ += this.Renamed10555.encode(param1,_loc4_.mapId);
         _loc3_ += this.Renamed10556.encode(param1,_loc4_.maxPeopleCount);
         _loc3_ += this.Renamed10015.encode(param1,_loc4_.name);
         _loc3_ += this.Renamed10557.encode(param1,_loc4_.parkourMode);
         _loc3_ += this.Renamed10558.encode(param1,_loc4_.privateBattle);
         _loc3_ += this.Renamed10559.encode(param1,_loc4_.proBattle);
         _loc3_ += this.Renamed10560.encode(param1,_loc4_.rankRange);
         _loc3_ += this.Renamed10561.encode(param1,_loc4_.reArmorEnabled);
         _loc3_ += this.Renamed10562.encode(param1,_loc4_.theme);
         _loc3_ += this.Renamed10563.encode(param1,_loc4_.withoutBonuses);
         _loc3_ += this.Renamed10564.encode(param1,_loc4_.withoutCrystals);
         _loc3_ += this.Renamed10565.encode(param1,_loc4_.withoutSupplies);
         return _loc3_ + this.Renamed10566.encode(param1,_loc4_.Renamed1602);
      }
   }
}

