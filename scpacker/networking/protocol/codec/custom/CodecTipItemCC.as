package scpacker.networking.protocol.codec.custom
{
   import §[" §.ICodec;
   import alternativa.osgi.OSGi;
   import alternativa.osgi.service.clientlog.IClientLog;
   import §do static§.§0!1§;
   import flash.utils.ByteArray;
   import platform.client.fp10.core.resource.types.LocalizedImageResource;
   import scpacker.networking.protocol.§?"s§;
   
   public class CodecTipItemCC implements ICodec
   {
      public static var log:IClientLog = IClientLog(OSGi.getInstance().getService(IClientLog));
      
      private var §[!i§:ICodec;
      
      public function CodecTipItemCC(param1:§?"s§)
      {
         super();
         this.§[!i§ = param1.getCodec("scpacker.networking.protocol.codec.custom.ResourceGetterCodec");
      }
      
      public function decode(param1:ByteArray) : Object
      {
         var _loc2_:§0!1§ = new §0!1§();
         _loc2_.preview = this.§[!i§.decode(param1) as LocalizedImageResource;
         return _loc2_;
      }
      
      public function encode(param1:ByteArray, param2:Object) : int
      {
         if(param2 == null)
         {
            throw new Error("Object is null. Use @ProtocolOptional annotation.");
         }
         var _loc3_:§0!1§ = §0!1§(param2);
         this.§[!i§.encode(param1,_loc3_.preview);
         return 4;
      }
   }
}

