package §`_§
{
   import alternativa.osgi.OSGi;
   import alternativa.osgi.service.clientlog.IClientLog;
   import alternativa.protocol.ICodec;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.protocol.info.TypeCodecInfo;
   import platform.client.models.commons.description.DescriptionModelCC;
   
   public class §package const native§ implements ICodec
   {
      public static var log:IClientLog = IClientLog(OSGi.getInstance().getService(IClientLog));
      
      private var §implements var extends§:ICodec;
      
      private var §+#!§:ICodec;
      
      public function §package const native§()
      {
         super();
      }
      
      public function init(param1:IProtocol) : void
      {
         this.§implements var extends§ = param1.getCodec(new TypeCodecInfo(String,true));
         this.§+#!§ = param1.getCodec(new TypeCodecInfo(String,true));
      }
      
      public function decode(param1:ProtocolBuffer) : Object
      {
         var _loc2_:DescriptionModelCC = new DescriptionModelCC();
         _loc2_.description = this.§implements var extends§.decode(param1) as String;
         _loc2_.name = this.§+#!§.decode(param1) as String;
         return _loc2_;
      }
      
      public function encode(param1:ProtocolBuffer, param2:Object) : void
      {
         if(param2 == null)
         {
            throw new Error("Object is null. Use @ProtocolOptional annotation.");
         }
         var _loc3_:DescriptionModelCC = DescriptionModelCC(param2);
         this.§implements var extends§.encode(param1,_loc3_.description);
         this.§+#!§.encode(param1,_loc3_.name);
      }
   }
}

