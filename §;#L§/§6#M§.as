package §;#L§
{
   import alternativa.osgi.OSGi;
   import alternativa.protocol.ICodec;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.OptionalMap;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.protocol.info.TypeCodecInfo;
   import alternativa.types.Long;
   import flash.utils.ByteArray;
   import platform.client.fp10.core.model.IModel;
   
   public class §6#M§
   {
      private var protocol:IProtocol;
      
      private var protocolBuffer:ProtocolBuffer;
      
      private var §throw var override§:Long;
      
      private var §finally for class§:ICodec;
      
      private var model:IModel;
      
      public function §6#M§(param1:IModel)
      {
         this.§throw var override§ = Long.getLong(1669375812,-973745790);
         super();
         this.model = param1;
         var _loc2_:ByteArray = new ByteArray();
         this.protocol = IProtocol(OSGi.getInstance().getService(IProtocol));
         this.protocolBuffer = new ProtocolBuffer(_loc2_,_loc2_,new OptionalMap());
         this.§finally for class§ = this.protocol.getCodec(new TypeCodecInfo(Long,false));
      }
      
      public function §false const true§(param1:String) : void
      {
      }
   }
}

