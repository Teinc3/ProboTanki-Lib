package §switch var set§
{
   import alternativa.osgi.OSGi;
   import alternativa.osgi.service.clientlog.IClientLog;
   import alternativa.protocol.ICodec;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.protocol.info.TypeCodecInfo;
   import alternativa.types.Long;
   import platform.client.core.general.spaces.loading.modelconstructors.ModelData;
   
   public class §4!G§ implements ICodec
   {
      public static var log:IClientLog = IClientLog(OSGi.getInstance().getService(IClientLog));
      
      private var §=!B§:ICodec;
      
      private var §default set native§:ICodec;
      
      public function §4!G§()
      {
         super();
      }
      
      public function init(param1:IProtocol) : void
      {
         this.§=!B§ = param1.getCodec(new TypeCodecInfo(Object,false));
         this.§default set native§ = param1.getCodec(new TypeCodecInfo(Long,false));
      }
      
      public function decode(param1:ProtocolBuffer) : Object
      {
         var _loc2_:ModelData = new ModelData();
         _loc2_.data = this.§=!B§.decode(param1) as Object;
         _loc2_.id = this.§default set native§.decode(param1) as Long;
         return _loc2_;
      }
      
      public function encode(param1:ProtocolBuffer, param2:Object) : void
      {
         if(param2 == null)
         {
            throw new Error("Object is null. Use @ProtocolOptional annotation.");
         }
         var _loc3_:ModelData = ModelData(param2);
         this.§=!B§.encode(param1,_loc3_.data);
         this.§default set native§.encode(param1,_loc3_.id);
      }
   }
}

