package §["1§
{
   import alternativa.osgi.OSGi;
   import alternativa.osgi.service.clientlog.IClientLog;
   import alternativa.protocol.ICodec;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.protocol.info.MapCodecInfo;
   import alternativa.protocol.info.TypeCodecInfo;
   import flash.utils.Dictionary;
   import platform.client.core.general.socialnetwork.types.LoginParameters;
   
   public class §45§ implements ICodec
   {
      public static var log:IClientLog = IClientLog(OSGi.getInstance().getService(IClientLog));
      
      private var §##l§:ICodec;
      
      public function §45§()
      {
         super();
      }
      
      public function init(param1:IProtocol) : void
      {
         this.§##l§ = param1.getCodec(new MapCodecInfo(new TypeCodecInfo(String,false),new TypeCodecInfo(String,false),false));
      }
      
      public function decode(param1:ProtocolBuffer) : Object
      {
         var _loc2_:LoginParameters = new LoginParameters();
         _loc2_.parameters = this.§##l§.decode(param1) as Dictionary;
         return _loc2_;
      }
      
      public function encode(param1:ProtocolBuffer, param2:Object) : void
      {
         if(param2 == null)
         {
            throw new Error("Object is null. Use @ProtocolOptional annotation.");
         }
         var _loc3_:LoginParameters = LoginParameters(param2);
         this.§##l§.encode(param1,_loc3_.parameters);
      }
   }
}

