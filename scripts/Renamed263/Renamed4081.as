package Renamed263
{
   import alternativa.osgi.OSGi;
   import alternativa.osgi.service.clientlog.IClientLog;
   import alternativa.protocol.ICodec;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.protocol.info.TypeCodecInfo;
   import platform.client.core.general.socialnetwork.models.socialnetworkparameters.SocialNetworkParametersCC;
   
   public class Renamed4081 implements ICodec
   {
      public static var log:IClientLog = IClientLog(OSGi.getInstance().getService(IClientLog));
      
      private var Renamed6824:ICodec;
      
      private var Renamed6825:ICodec;
      
      public function Renamed4081()
      {
         super();
      }
      
      public function init(param1:IProtocol) : void
      {
         this.Renamed6824 = param1.getCodec(new TypeCodecInfo(Boolean,false));
         this.Renamed6825 = param1.getCodec(new TypeCodecInfo(Boolean,false));
      }
      
      public function decode(param1:ProtocolBuffer) : Object
      {
         var _loc2_:SocialNetworkParametersCC = new SocialNetworkParametersCC();
         _loc2_.hasOwnPaymentSystem = this.Renamed6824.decode(param1) as Boolean;
         _loc2_.hasSocialFunction = this.Renamed6825.decode(param1) as Boolean;
         return _loc2_;
      }
      
      public function encode(param1:ProtocolBuffer, param2:Object) : void
      {
         if(param2 == null)
         {
            throw new Error("Object is null. Use @ProtocolOptional annotation.");
         }
         var _loc3_:SocialNetworkParametersCC = SocialNetworkParametersCC(param2);
         this.Renamed6824.encode(param1,_loc3_.hasOwnPaymentSystem);
         this.Renamed6825.encode(param1,_loc3_.hasSocialFunction);
      }
   }
}

