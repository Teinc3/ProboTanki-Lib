package scpacker.networking.protocol.codec.custom
{
   import §+#J§.§4#R§;
   import §[" §.ICodec;
   import alternativa.osgi.OSGi;
   import alternativa.osgi.service.clientlog.IClientLog;
   import flash.utils.ByteArray;
   import projects.tanks.client.battleservice.model.statistics.§in for for§;
   import scpacker.networking.protocol.§?"s§;
   
   public class CodecStatisticsTeamCC implements ICodec
   {
      public static var log:IClientLog = IClientLog(OSGi.getInstance().getService(IClientLog));
      
      private var §%#i§:ICodec;
      
      private var § !j§:ICodec;
      
      private var §override const continue§:ICodec;
      
      private var §if for import§:ICodec;
      
      public function CodecStatisticsTeamCC(param1:§?"s§)
      {
         super();
         this.§%#i§ = param1.getCodec("scpacker.networking.protocol.codec.primitive.IntCodec");
         this.§ !j§ = param1.getCodec("scpacker.networking.protocol.codec.primitive.IntCodec");
         this.§override const continue§ = param1.getCodec("scpacker.networking.protocol.codec.custom.VectorCodecUserInfo");
         this.§if for import§ = param1.getCodec("scpacker.networking.protocol.codec.custom.VectorCodecUserInfo");
      }
      
      public function decode(param1:ByteArray) : Object
      {
         var _loc2_:§4#R§ = new §4#R§();
         _loc2_.§break var for§ = this.§%#i§.decode(param1) as int;
         _loc2_.§override const const§ = this.§ !j§.decode(param1) as int;
         _loc2_.§-f§ = this.§override const continue§.decode(param1) as Vector.<§in for for§>;
         _loc2_.§null for null§ = this.§if for import§.decode(param1) as Vector.<§in for for§>;
         return _loc2_;
      }
      
      public function encode(param1:ByteArray, param2:Object) : int
      {
         if(param2 == null)
         {
            throw new Error("Object is null. Use @ProtocolOptional annotation.");
         }
         var _loc3_:§4#R§ = §4#R§(param2);
         this.§%#i§.encode(param1,_loc3_.§break var for§);
         this.§ !j§.encode(param1,_loc3_.§override const const§);
         this.§override const continue§.encode(param1,_loc3_.§-f§);
         this.§if for import§.encode(param1,_loc3_.§null for null§);
         return 4;
      }
   }
}

