package scpacker.networking.protocol.codec.custom
{
   import §[" §.ICodec;
   import alternativa.osgi.OSGi;
   import alternativa.osgi.service.clientlog.IClientLog;
   import flash.utils.ByteArray;
   import projects.tanks.client.tanksservices.model.notifier.battle.BattleNotifierData;
   import projects.tanks.client.tanksservices.types.battle.BattleInfoData;
   import scpacker.networking.protocol.§?"s§;
   
   public class CodecBattleNotifierData implements ICodec
   {
      public static var log:IClientLog = IClientLog(OSGi.getInstance().getService(IClientLog));
      
      private var §use for if§:ICodec;
      
      private var §'#X§:ICodec;
      
      public function CodecBattleNotifierData(param1:§?"s§)
      {
         super();
         this.§use for if§ = param1.getCodec("scpacker.networking.protocol.codec.custom.CodecBattleInfoData");
         this.§'#X§ = param1.getCodec("scpacker.networking.protocol.codec.primitive.StringCodec");
      }
      
      public function decode(param1:ByteArray) : Object
      {
         var _loc2_:BattleNotifierData = new BattleNotifierData();
         _loc2_.battleData = this.§use for if§.decode(param1) as BattleInfoData;
         _loc2_.userId = this.§'#X§.decode(param1) as String;
         return _loc2_;
      }
      
      public function encode(param1:ByteArray, param2:Object) : int
      {
         if(param2 == null)
         {
            throw new Error("Object is null. Use @ProtocolOptional annotation.");
         }
         var _loc3_:BattleNotifierData = BattleNotifierData(param2);
         this.§use for if§.encode(param1,_loc3_.battleData);
         this.§'#X§.encode(param1,_loc3_.userId);
         return 4;
      }
   }
}

