package §7!S§
{
   import §8"m§.§,#W§;
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
   
   public class §]"C§
   {
      private var protocol:IProtocol;
      
      private var protocolBuffer:ProtocolBuffer;
      
      private var §5#@§:Long;
      
      private var §each catch super§:ICodec;
      
      private var model:IModel;
      
      private var network:Network;
      
      public function §]"C§(param1:IModel)
      {
         this.§5#@§ = Long.getLong(668941246,-1113168476);
         super();
         this.model = param1;
         var _loc2_:ByteArray = new ByteArray();
         this.network = Network(OSGi.getInstance().getService(Network));
         this.protocol = IProtocol(OSGi.getInstance().getService(IProtocol));
         this.protocolBuffer = new ProtocolBuffer(_loc2_,_loc2_,new OptionalMap());
         this.§each catch super§ = this.protocol.getCodec(new TypeCodecInfo(String,false));
      }
      
      public function §<#V§(param1:String) : void
      {
         this.network.send(new §,#W§(param1));
      }
   }
}

