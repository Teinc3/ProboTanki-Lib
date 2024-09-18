package scpacker.networking.protocol.codec.custom
{
   import §[" §.ICodec;
   import alternativa.osgi.OSGi;
   import alternativa.osgi.service.clientlog.IClientLog;
   import flash.utils.ByteArray;
   import projects.tanks.client.tanksservices.model.notifier.rank.RankNotifierData;
   import scpacker.networking.protocol.§?"s§;
   
   public class CodecRankNotifierData implements ICodec
   {
      public static var log:IClientLog = IClientLog(OSGi.getInstance().getService(IClientLog));
      
      private var §,!k§:ICodec;
      
      private var §'#X§:ICodec;
      
      public function CodecRankNotifierData(param1:§?"s§)
      {
         super();
         this.§,!k§ = param1.getCodec("scpacker.networking.protocol.codec.primitive.IntCodec");
         this.§'#X§ = param1.getCodec("scpacker.networking.protocol.codec.primitive.StringCodec");
      }
      
      public function decode(param1:ByteArray) : Object
      {
         var _loc2_:RankNotifierData = new RankNotifierData();
         _loc2_.rank = this.§,!k§.decode(param1) as int;
         _loc2_.userId = this.§'#X§.decode(param1) as String;
         return _loc2_;
      }
      
      public function encode(param1:ByteArray, param2:Object) : int
      {
         if(param2 == null)
         {
            throw new Error("Object is null. Use @ProtocolOptional annotation.");
         }
         var _loc3_:RankNotifierData = RankNotifierData(param2);
         this.§,!k§.encode(param1,_loc3_.rank);
         this.§'#X§.encode(param1,_loc3_.userId);
         return 4;
      }
   }
}

