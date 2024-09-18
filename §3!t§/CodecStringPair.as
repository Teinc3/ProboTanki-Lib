package §3!t§
{
   import alternativa.osgi.OSGi;
   import alternativa.osgi.service.clientlog.IClientLog;
   import alternativa.protocol.ICodec;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.protocol.info.TypeCodecInfo;
   import platform.client.core.general.resourcelocale.format.StringPair;
   
   public class CodecStringPair implements ICodec
   {
      public static var log:IClientLog = IClientLog(OSGi.getInstance().getService(IClientLog));
      
      private var §break set package§:ICodec;
      
      private var §`"f§:ICodec;
      
      public function CodecStringPair()
      {
         super();
      }
      
      public function init(param1:IProtocol) : void
      {
         this.§break set package§ = param1.getCodec(new TypeCodecInfo(String,false));
         this.§`"f§ = param1.getCodec(new TypeCodecInfo(String,false));
      }
      
      public function decode(param1:ProtocolBuffer) : Object
      {
         var _loc2_:StringPair = new StringPair();
         _loc2_.key = this.§break set package§.decode(param1) as String;
         _loc2_.value = this.§`"f§.decode(param1) as String;
         return _loc2_;
      }
      
      public function encode(param1:ProtocolBuffer, param2:Object) : void
      {
         if(param2 == null)
         {
            throw new Error("Object is null. Use @ProtocolOptional annotation.");
         }
         var _loc3_:StringPair = StringPair(param2);
         this.§break set package§.encode(param1,_loc3_.key);
         this.§`"f§.encode(param1,_loc3_.value);
      }
   }
}

