package § !a§
{
   import §4"T§.§;!W§;
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
   
   public class §<2§
   {
      private var protocol:IProtocol;
      
      private var protocolBuffer:ProtocolBuffer;
      
      private var §"!k§:Long;
      
      private var §'#=§:ICodec;
      
      private var model:IModel;
      
      private var network:Network;
      
      public function §<2§(param1:IModel)
      {
         this.§"!k§ = Long.getLong(848767568,-2110445115);
         super();
         this.model = param1;
         var _loc2_:ByteArray = new ByteArray();
         this.protocol = IProtocol(OSGi.getInstance().getService(IProtocol));
         this.network = Network(OSGi.getInstance().getService(Network));
         this.protocolBuffer = new ProtocolBuffer(_loc2_,_loc2_,new OptionalMap());
         this.§'#=§ = this.protocol.getCodec(new TypeCodecInfo(Long,false));
      }
      
      public function remove(param1:String) : void
      {
         this.network.send(new §;!W§(param1));
      }
   }
}

