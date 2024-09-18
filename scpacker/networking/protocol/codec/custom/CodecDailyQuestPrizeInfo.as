package scpacker.networking.protocol.codec.custom
{
   import §[" §.ICodec;
   import alternativa.osgi.OSGi;
   import alternativa.osgi.service.clientlog.IClientLog;
   import flash.utils.ByteArray;
   import projects.tanks.client.panel.model.dailyquest.§native const in§;
   import scpacker.networking.protocol.§?"s§;
   
   public class CodecDailyQuestPrizeInfo implements ICodec
   {
      public static var log:IClientLog = IClientLog(OSGi.getInstance().getService(IClientLog));
      
      private var §8;§:ICodec;
      
      private var §+#!§:ICodec;
      
      public function CodecDailyQuestPrizeInfo(param1:§?"s§)
      {
         super();
         this.§8;§ = param1.getCodec("scpacker.networking.protocol.codec.primitive.IntCodec");
         this.§+#!§ = param1.getCodec("scpacker.networking.protocol.codec.primitive.StringCodec");
      }
      
      public function decode(param1:ByteArray) : Object
      {
         var _loc2_:§native const in§ = new §native const in§();
         _loc2_.count = this.§8;§.decode(param1) as int;
         _loc2_.name = this.§+#!§.decode(param1) as String;
         return _loc2_;
      }
      
      public function encode(param1:ByteArray, param2:Object) : int
      {
         if(param2 == null)
         {
            throw new Error("Object is null. Use @ProtocolOptional annotation.");
         }
         var _loc3_:§native const in§ = §native const in§(param2);
         this.§8;§.encode(param1,_loc3_.count);
         this.§+#!§.encode(param1,_loc3_.name);
         return 4;
      }
   }
}

