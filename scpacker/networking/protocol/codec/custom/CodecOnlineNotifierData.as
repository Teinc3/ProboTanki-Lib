package scpacker.networking.protocol.codec.custom
{
   import §[" §.ICodec;
   import alternativa.osgi.OSGi;
   import alternativa.osgi.service.clientlog.IClientLog;
   import flash.utils.ByteArray;
   import projects.tanks.client.tanksservices.model.notifier.online.OnlineNotifierData;
   import scpacker.networking.protocol.§?"s§;
   
   public class CodecOnlineNotifierData implements ICodec
   {
      public static var log:IClientLog = IClientLog(OSGi.getInstance().getService(IClientLog));
      
      private var §finally var throw§:ICodec;
      
      private var §>!Y§:ICodec;
      
      private var §'#X§:ICodec;
      
      public function CodecOnlineNotifierData(param1:§?"s§)
      {
         super();
         this.§finally var throw§ = param1.getCodec("scpacker.networking.protocol.codec.primitive.BooleanCodec");
         this.§>!Y§ = param1.getCodec("scpacker.networking.protocol.codec.primitive.IntCodec");
         this.§'#X§ = param1.getCodec("scpacker.networking.protocol.codec.primitive.StringCodec");
      }
      
      public function decode(param1:ByteArray) : Object
      {
         var _loc2_:OnlineNotifierData = new OnlineNotifierData();
         _loc2_.online = this.§finally var throw§.decode(param1) as Boolean;
         _loc2_.serverNumber = this.§>!Y§.decode(param1) as int;
         _loc2_.userId = this.§'#X§.decode(param1) as String;
         return _loc2_;
      }
      
      public function encode(param1:ByteArray, param2:Object) : int
      {
         if(param2 == null)
         {
            throw new Error("Object is null. Use @ProtocolOptional annotation.");
         }
         var _loc3_:OnlineNotifierData = OnlineNotifierData(param2);
         this.§finally var throw§.encode(param1,_loc3_.online);
         this.§>!Y§.encode(param1,_loc3_.serverNumber);
         this.§'#X§.encode(param1,_loc3_.userId);
         return 4;
      }
   }
}

