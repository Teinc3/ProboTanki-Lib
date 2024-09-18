package §const catch import§
{
   import §>y§.§[!,§;
   import alternativa.osgi.OSGi;
   import alternativa.protocol.ICodec;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.OptionalMap;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.protocol.info.TypeCodecInfo;
   import alternativa.types.Long;
   import flash.utils.ByteArray;
   import platform.client.fp10.core.model.IModel;
   import scpacker.networking.Network;
   
   public class §final set while§
   {
      private var protocol:IProtocol;
      
      private var protocolBuffer:ProtocolBuffer;
      
      private var §2o§:Long;
      
      private var §get continue§:ICodec;
      
      private var §try var default§:ICodec;
      
      private var §<!<§:ICodec;
      
      private var model:IModel;
      
      public function §final set while§(param1:IModel)
      {
         this.§2o§ = Long.getLong(0,300020048);
         super();
         this.model = param1;
         var _loc2_:ByteArray = new ByteArray();
         this.protocol = IProtocol(OSGi.getInstance().getService(IProtocol));
         this.protocolBuffer = new ProtocolBuffer(_loc2_,_loc2_,new OptionalMap());
         this.§get continue§ = this.protocol.getCodec(new TypeCodecInfo(String,false));
         this.§try var default§ = this.protocol.getCodec(new TypeCodecInfo(String,false));
         this.§<!<§ = this.protocol.getCodec(new TypeCodecInfo(Boolean,false));
      }
      
      public function login(param1:String, param2:String, param3:Boolean) : void
      {
         Network(OSGi.getInstance().getService(Network)).send(new §[!,§(param1,param2,param3));
      }
   }
}

