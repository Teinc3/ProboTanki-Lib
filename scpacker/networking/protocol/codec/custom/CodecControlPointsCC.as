package scpacker.networking.protocol.codec.custom
{
   import §,#a§.§'"P§;
   import §,#a§.§7N§;
   import §9p§.§break var finally§;
   import §9p§.§var const final§;
   import §[" §.ICodec;
   import alternativa.osgi.OSGi;
   import alternativa.osgi.service.clientlog.IClientLog;
   import flash.utils.ByteArray;
   import scpacker.networking.protocol.§?"s§;
   
   public class CodecControlPointsCC implements ICodec
   {
      public static var log:IClientLog = IClientLog(OSGi.getInstance().getService(IClientLog));
      
      private var §?!J§:ICodec;
      
      private var §include const var§:ICodec;
      
      private var §+^§:ICodec;
      
      private var §false set for§:ICodec;
      
      private var §]"]§:ICodec;
      
      private var §3$%§:ICodec;
      
      public function CodecControlPointsCC(param1:§?"s§)
      {
         super();
         this.§?!J§ = param1.getCodec("scpacker.networking.protocol.codec.primitive.FloatCodec");
         this.§include const var§ = param1.getCodec("scpacker.networking.protocol.codec.primitive.FloatCodec");
         this.§+^§ = param1.getCodec("scpacker.networking.protocol.codec.primitive.FloatCodec");
         this.§false set for§ = param1.getCodec("scpacker.networking.protocol.codec.custom.VectorCodecClientPointData");
         this.§]"]§ = param1.getCodec("scpacker.networking.protocol.codec.custom.CodecDominationResources");
         this.§3$%§ = param1.getCodec("scpacker.networking.protocol.codec.custom.CodecDominationSounds");
      }
      
      public function decode(param1:ByteArray) : Object
      {
         var _loc2_:§7N§ = new §7N§();
         _loc2_.§'"K§ = this.§?!J§.decode(param1) as Number;
         _loc2_.§;%§ = this.§include const var§.decode(param1) as Number;
         _loc2_.§8!x§ = this.§+^§.decode(param1) as Number;
         _loc2_.§-!H§ = this.§false set for§.decode(param1) as Vector.<§'"P§>;
         _loc2_.resources = this.§]"]§.decode(param1) as §var const final§;
         _loc2_.§3!P§ = this.§3$%§.decode(param1) as §break var finally§;
         return _loc2_;
      }
      
      public function encode(param1:ByteArray, param2:Object) : int
      {
         if(param2 == null)
         {
            throw new Error("Object is null. Use @ProtocolOptional annotation.");
         }
         var _loc3_:§7N§ = §7N§(param2);
         this.§?!J§.encode(param1,_loc3_.§'"K§);
         this.§include const var§.encode(param1,_loc3_.§;%§);
         this.§+^§.encode(param1,_loc3_.§8!x§);
         this.§false set for§.encode(param1,_loc3_.§-!H§);
         this.§]"]§.encode(param1,_loc3_.resources);
         this.§3$%§.encode(param1,_loc3_.§3!P§);
         return 4;
      }
   }
}

