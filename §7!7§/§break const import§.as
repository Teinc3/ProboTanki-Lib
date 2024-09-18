package §7!7§
{
   import alternativa.osgi.OSGi;
   import alternativa.osgi.service.clientlog.IClientLog;
   import alternativa.protocol.ICodec;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.protocol.info.TypeCodecInfo;
   import platform.client.core.general.socialnetwork.models.socialnetworkparameters.SocialNetworkParametersCC;
   
   public class §break const import§ implements ICodec
   {
      public static var log:IClientLog = IClientLog(OSGi.getInstance().getService(IClientLog));
      
      private var §^"H§:ICodec;
      
      private var §=#g§:ICodec;
      
      public function §break const import§()
      {
         super();
      }
      
      public function init(param1:IProtocol) : void
      {
         this.§^"H§ = param1.getCodec(new TypeCodecInfo(Boolean,false));
         this.§=#g§ = param1.getCodec(new TypeCodecInfo(Boolean,false));
      }
      
      public function decode(param1:ProtocolBuffer) : Object
      {
         var _loc2_:SocialNetworkParametersCC = new SocialNetworkParametersCC();
         _loc2_.hasOwnPaymentSystem = this.§^"H§.decode(param1) as Boolean;
         _loc2_.hasSocialFunction = this.§=#g§.decode(param1) as Boolean;
         return _loc2_;
      }
      
      public function encode(param1:ProtocolBuffer, param2:Object) : void
      {
         if(param2 == null)
         {
            throw new Error("Object is null. Use @ProtocolOptional annotation.");
         }
         var _loc3_:SocialNetworkParametersCC = SocialNetworkParametersCC(param2);
         this.§^"H§.encode(param1,_loc3_.hasOwnPaymentSystem);
         this.§=#g§.encode(param1,_loc3_.hasSocialFunction);
      }
   }
}

