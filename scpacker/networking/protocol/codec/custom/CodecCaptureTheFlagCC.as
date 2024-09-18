package scpacker.networking.protocol.codec.custom
{
   import §9"a§.§each var for§;
   import §9"a§.§extends package continue§;
   import §9"a§.§override const implements§;
   import §[" §.ICodec;
   import alternativa.osgi.OSGi;
   import alternativa.osgi.service.clientlog.IClientLog;
   import flash.utils.ByteArray;
   import platform.client.fp10.core.resource.types.ImageResource;
   import projects.tanks.clients.flash.resources.resource.Tanks3DSResource;
   import scpacker.networking.protocol.§?"s§;
   
   public class CodecCaptureTheFlagCC implements ICodec
   {
      public static var log:IClientLog = IClientLog(OSGi.getInstance().getService(IClientLog));
      
      private var §default for override§:ICodec;
      
      private var §set var with§:ICodec;
      
      private var §set const get§:ICodec;
      
      private var §import set for§:ICodec;
      
      private var §break package false§:ICodec;
      
      private var §set package§:ICodec;
      
      private var §true var while§:ICodec;
      
      private var §throw const include§:ICodec;
      
      private var §3$%§:ICodec;
      
      public function CodecCaptureTheFlagCC(param1:§?"s§)
      {
         super();
         this.§default for override§ = param1.getCodec("scpacker.networking.protocol.codec.custom.CodecClientFlag");
         this.§set var with§ = param1.getCodec("scpacker.networking.protocol.codec.custom.ResourceGetterCodec");
         this.§set const get§ = param1.getCodec("scpacker.networking.protocol.codec.custom.ResourceGetterCodec");
         this.§import set for§ = param1.getCodec("scpacker.networking.protocol.codec.custom.ResourceGetterCodec");
         this.§break package false§ = param1.getCodec("scpacker.networking.protocol.codec.custom.CodecClientFlag");
         this.§set package§ = param1.getCodec("scpacker.networking.protocol.codec.custom.ResourceGetterCodec");
         this.§true var while§ = param1.getCodec("scpacker.networking.protocol.codec.custom.ResourceGetterCodec");
         this.§throw const include§ = param1.getCodec("scpacker.networking.protocol.codec.custom.ResourceGetterCodec");
         this.§3$%§ = param1.getCodec("scpacker.networking.protocol.codec.custom.CodecCaptureTheFlagSoundFX");
      }
      
      public function decode(param1:ByteArray) : Object
      {
         var _loc2_:§extends package continue§ = new §extends package continue§();
         _loc2_.§null const null§ = this.§default for override§.decode(param1) as §override const implements§;
         _loc2_.§const var with§ = this.§set const get§.decode(param1) as ImageResource;
         _loc2_.§2"D§ = this.§import set for§.decode(param1) as Tanks3DSResource;
         _loc2_.§04§ = this.§break package false§.decode(param1) as §override const implements§;
         _loc2_.§final set implements§ = this.§true var while§.decode(param1) as ImageResource;
         _loc2_.§import for set§ = this.§throw const include§.decode(param1) as Tanks3DSResource;
         _loc2_.§3!P§ = this.§3$%§.decode(param1) as §each var for§;
         return _loc2_;
      }
      
      public function encode(param1:ByteArray, param2:Object) : int
      {
         var _loc3_:int = 0;
         if(param2 == null)
         {
            throw new Error("Object is null. Use @ProtocolOptional annotation.");
         }
         var _loc4_:§extends package continue§ = §extends package continue§(param2);
         _loc3_ += this.§default for override§.encode(param1,_loc4_.§null const null§);
         _loc3_ += this.§set var with§.encode(param1,_loc4_.§break finally§);
         _loc3_ += this.§set const get§.encode(param1,_loc4_.§const var with§);
         _loc3_ += this.§import set for§.encode(param1,_loc4_.§2"D§);
         _loc3_ += this.§break package false§.encode(param1,_loc4_.§04§);
         _loc3_ += this.§set package§.encode(param1,_loc4_.§,"p§);
         _loc3_ += this.§true var while§.encode(param1,_loc4_.§final set implements§);
         _loc3_ += this.§throw const include§.encode(param1,_loc4_.§import for set§);
         return _loc3_ + this.§3$%§.encode(param1,_loc4_.§3!P§);
      }
   }
}

