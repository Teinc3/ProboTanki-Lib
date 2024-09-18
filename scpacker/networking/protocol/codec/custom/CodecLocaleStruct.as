package scpacker.networking.protocol.codec.custom
{
   import §[" §.ICodec;
   import alternativa.osgi.OSGi;
   import alternativa.osgi.service.clientlog.IClientLog;
   import flash.utils.ByteArray;
   import platform.client.core.general.resourcelocale.format.ImagePair;
   import platform.client.core.general.resourcelocale.format.LocalizedFileFormat;
   import platform.client.core.general.resourcelocale.format.StringPair;
   import scpacker.networking.protocol.§?"s§;
   
   public class CodecLocaleStruct implements ICodec
   {
      public static var log:IClientLog = IClientLog(OSGi.getInstance().getService(IClientLog));
      
      private var §-!$§:ICodec;
      
      private var §'"J§:ICodec;
      
      public function CodecLocaleStruct(param1:§?"s§)
      {
         super();
         this.§-!$§ = param1.getCodec("scpacker.networking.protocol.codec.custom.VectorCodecImagePair");
         this.§'"J§ = param1.getCodec("scpacker.networking.protocol.codec.custom.VectorCodecStringPair");
      }
      
      public function decode(param1:ByteArray) : Object
      {
         var _loc2_:LocalizedFileFormat = new LocalizedFileFormat();
         _loc2_.images = this.§-!$§.decode(param1) as Vector.<ImagePair>;
         _loc2_.strings = this.§'"J§.decode(param1) as Vector.<StringPair>;
         return _loc2_;
      }
      
      public function encode(param1:ByteArray, param2:Object) : int
      {
         if(param2 == null)
         {
            throw new Error("Object is null. Use @ProtocolOptional annotation.");
         }
         var _loc3_:LocalizedFileFormat = LocalizedFileFormat(param2);
         this.§-!$§.encode(param1,_loc3_.images);
         this.§'"J§.encode(param1,_loc3_.strings);
         return 4;
      }
   }
}

