package scpacker.networking.protocol.codec.custom
{
   import §[" §.ICodec;
   import alternativa.osgi.OSGi;
   import alternativa.osgi.service.clientlog.IClientLog;
   import flash.utils.ByteArray;
   import §if set dynamic§.§static var function§;
   import projects.tanks.client.battleservice.model.statistics.§in for for§;
   import scpacker.networking.protocol.§?"s§;
   
   public class CodecStatisticsDMCC implements ICodec
   {
      public static var log:IClientLog = IClientLog(OSGi.getInstance().getService(IClientLog));
      
      private var §while catch dynamic§:ICodec;
      
      public function CodecStatisticsDMCC(param1:§?"s§)
      {
         super();
         this.§while catch dynamic§ = param1.getCodec("scpacker.networking.protocol.codec.custom.VectorCodecUserInfo");
      }
      
      public function decode(param1:ByteArray) : Object
      {
         var _loc2_:§static var function§ = new §static var function§();
         _loc2_.usersInfo = this.§while catch dynamic§.decode(param1) as Vector.<§in for for§>;
         return _loc2_;
      }
      
      public function encode(param1:ByteArray, param2:Object) : int
      {
         if(param2 == null)
         {
            throw new Error("Object is null. Use @ProtocolOptional annotation.");
         }
         var _loc3_:§static var function§ = §static var function§(param2);
         this.§while catch dynamic§.encode(param1,_loc3_.usersInfo);
         return 4;
      }
   }
}

