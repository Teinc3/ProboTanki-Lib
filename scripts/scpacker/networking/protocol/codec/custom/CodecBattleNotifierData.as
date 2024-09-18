package scpacker.networking.protocol.codec.custom
{
   import Renamed5811.ICodec;
   import alternativa.osgi.OSGi;
   import alternativa.osgi.service.clientlog.IClientLog;
   import flash.utils.ByteArray;
   import projects.tanks.client.tanksservices.model.notifier.battle.BattleNotifierData;
   import projects.tanks.client.tanksservices.types.battle.BattleInfoData;
   import scpacker.networking.protocol.CodecRegisterer;
   
   public class CodecBattleNotifierData implements ICodec
   {
      public static var log:IClientLog = IClientLog(OSGi.getInstance().getService(IClientLog));
      
      private var Renamed10606:ICodec;
      
      private var Renamed10607:ICodec;
      
      public function CodecBattleNotifierData(param1:CodecRegisterer)
      {
         super();
         this.Renamed10606 = param1.getCodec("scpacker.networking.protocol.codec.custom.CodecBattleInfoData");
         this.Renamed10607 = param1.getCodec("scpacker.networking.protocol.codec.primitive.StringCodec");
      }
      
      public function decode(param1:ByteArray) : Object
      {
         var _loc2_:BattleNotifierData = new BattleNotifierData();
         _loc2_.battleData = this.Renamed10606.decode(param1) as BattleInfoData;
         _loc2_.userId = this.Renamed10607.decode(param1) as String;
         return _loc2_;
      }
      
      public function encode(param1:ByteArray, param2:Object) : int
      {
         if(param2 == null)
         {
            throw new Error("Object is null. Use @ProtocolOptional annotation.");
         }
         var _loc3_:BattleNotifierData = BattleNotifierData(param2);
         this.Renamed10606.encode(param1,_loc3_.battleData);
         this.Renamed10607.encode(param1,_loc3_.userId);
         return 4;
      }
   }
}

