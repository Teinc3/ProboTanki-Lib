package scpacker.networking.protocol.codec.custom
{
   import §5""§.§while const for§;
   import §[" §.ICodec;
   import alternativa.osgi.OSGi;
   import alternativa.osgi.service.clientlog.IClientLog;
   import flash.utils.ByteArray;
   import platform.client.fp10.core.resource.types.SoundResource;
   import scpacker.networking.protocol.§?"s§;
   
   public class CodecAssaultSoundFX implements ICodec
   {
      public static var log:IClientLog = IClientLog(OSGi.getInstance().getService(IClientLog));
      
      private var §continue for catch§:ICodec;
      
      private var §null try§:ICodec;
      
      private var §?#D§:ICodec;
      
      private var §&j§:ICodec;
      
      public function CodecAssaultSoundFX(param1:§?"s§)
      {
         super();
         this.§continue for catch§ = param1.getCodec("scpacker.networking.protocol.codec.custom.ResourceGetterCodec");
         this.§null try§ = param1.getCodec("scpacker.networking.protocol.codec.custom.ResourceGetterCodec");
         this.§?#D§ = param1.getCodec("scpacker.networking.protocol.codec.custom.ResourceGetterCodec");
         this.§&j§ = param1.getCodec("scpacker.networking.protocol.codec.custom.ResourceGetterCodec");
      }
      
      public function decode(param1:ByteArray) : Object
      {
         var _loc2_:§while const for§ = new §while const for§();
         _loc2_.§8,§ = this.§continue for catch§.decode(param1) as SoundResource;
         _loc2_.§do for try§ = this.§null try§.decode(param1) as SoundResource;
         _loc2_.§final var get§ = this.§?#D§.decode(param1) as SoundResource;
         _loc2_.§return set while§ = this.§&j§.decode(param1) as SoundResource;
         return _loc2_;
      }
      
      public function encode(param1:ByteArray, param2:Object) : int
      {
         if(param2 == null)
         {
            throw new Error("Object is null. Use @ProtocolOptional annotation.");
         }
         var _loc3_:§while const for§ = §while const for§(param2);
         this.§continue for catch§.encode(param1,_loc3_.§8,§);
         this.§null try§.encode(param1,_loc3_.§do for try§);
         this.§?#D§.encode(param1,_loc3_.§final var get§);
         this.§&j§.encode(param1,_loc3_.§return set while§);
         return 4;
      }
   }
}

