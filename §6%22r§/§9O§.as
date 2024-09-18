package §6"r§
{
   import alternativa.osgi.OSGi;
   import alternativa.osgi.service.clientlog.IClientLog;
   import alternativa.protocol.ICodec;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.protocol.info.CollectionCodecInfo;
   import alternativa.protocol.info.TypeCodecInfo;
   import platform.client.core.general.spaces.loading.dispatcher.types.ObjectsData;
   import platform.client.core.general.spaces.loading.modelconstructors.ModelData;
   import platform.client.fp10.core.type.IGameObject;
   
   public class §9O§ implements ICodec
   {
      public static var log:IClientLog = IClientLog(OSGi.getInstance().getService(IClientLog));
      
      private var §^f§:ICodec;
      
      private var §for for false§:ICodec;
      
      public function §9O§()
      {
         super();
      }
      
      public function init(param1:IProtocol) : void
      {
         this.§^f§ = param1.getCodec(new CollectionCodecInfo(new TypeCodecInfo(ModelData,false),false,1));
         this.§for for false§ = param1.getCodec(new CollectionCodecInfo(new TypeCodecInfo(IGameObject,false),false,1));
      }
      
      public function decode(param1:ProtocolBuffer) : Object
      {
         var _loc2_:ObjectsData = new ObjectsData();
         _loc2_.modelsData = this.§^f§.decode(param1) as Vector.<ModelData>;
         _loc2_.objects = this.§for for false§.decode(param1) as Vector.<IGameObject>;
         return _loc2_;
      }
      
      public function encode(param1:ProtocolBuffer, param2:Object) : void
      {
         if(param2 == null)
         {
            throw new Error("Object is null. Use @ProtocolOptional annotation.");
         }
         var _loc3_:ObjectsData = ObjectsData(param2);
         this.§^f§.encode(param1,_loc3_.modelsData);
         this.§for for false§.encode(param1,_loc3_.objects);
      }
   }
}

