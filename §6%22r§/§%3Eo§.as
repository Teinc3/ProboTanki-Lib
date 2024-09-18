package §6"r§
{
   import alternativa.osgi.OSGi;
   import alternativa.osgi.service.clientlog.IClientLog;
   import alternativa.protocol.ICodec;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.protocol.info.CollectionCodecInfo;
   import alternativa.protocol.info.TypeCodecInfo;
   import platform.client.core.general.spaces.loading.dispatcher.types.ObjectsDependencies;
   import platform.client.fp10.core.resource.Resource;
   
   public class §>o§ implements ICodec
   {
      public static var log:IClientLog = IClientLog(OSGi.getInstance().getService(IClientLog));
      
      private var §get get§:ICodec;
      
      private var §]"]§:ICodec;
      
      public function §>o§()
      {
         super();
      }
      
      public function init(param1:IProtocol) : void
      {
         this.§get get§ = param1.getCodec(new TypeCodecInfo(int,false));
         this.§]"]§ = param1.getCodec(new CollectionCodecInfo(new TypeCodecInfo(Resource,false),false,1));
      }
      
      public function decode(param1:ProtocolBuffer) : Object
      {
         var _loc2_:ObjectsDependencies = new ObjectsDependencies();
         _loc2_.callbackId = this.§get get§.decode(param1) as int;
         _loc2_.resources = this.§]"]§.decode(param1) as Vector.<Resource>;
         return _loc2_;
      }
      
      public function encode(param1:ProtocolBuffer, param2:Object) : void
      {
         if(param2 == null)
         {
            throw new Error("Object is null. Use @ProtocolOptional annotation.");
         }
         var _loc3_:ObjectsDependencies = ObjectsDependencies(param2);
         this.§get get§.encode(param1,_loc3_.callbackId);
         this.§]"]§.encode(param1,_loc3_.resources);
      }
   }
}

