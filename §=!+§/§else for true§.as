package §=!+§
{
   import alternativa.osgi.OSGi;
   import alternativa.protocol.ICodec;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.OptionalMap;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.protocol.info.TypeCodecInfo;
   import alternativa.types.Long;
   import flash.utils.ByteArray;
   import §function set true§.§8#]§;
   import §function set true§.§?#j§;
   import platform.client.fp10.core.model.IModel;
   import scpacker.networking.Network;
   
   public class §else for true§
   {
      private var protocol:IProtocol;
      
      private var protocolBuffer:ProtocolBuffer;
      
      private var §3"u§:Long;
      
      private var §8#6§:ICodec;
      
      private var §#h§:Long;
      
      private var §'##§:ICodec;
      
      private var model:IModel;
      
      private var network:Network;
      
      public function §else for true§(param1:IModel)
      {
         this.§3"u§ = Long.getLong(0,300070003);
         this.§#h§ = Long.getLong(0,300070004);
         super();
         this.model = param1;
         var _loc2_:ByteArray = new ByteArray();
         this.protocol = IProtocol(OSGi.getInstance().getService(IProtocol));
         this.network = Network(OSGi.getInstance().getService(Network));
         this.protocolBuffer = new ProtocolBuffer(_loc2_,_loc2_,new OptionalMap());
         this.§8#6§ = this.protocol.getCodec(new TypeCodecInfo(String,false));
         this.§'##§ = this.protocol.getCodec(new TypeCodecInfo(Long,false));
      }
      
      public function activateLink(param1:String) : void
      {
         this.network.send(new §8#]§(param1));
      }
      
      public function isAlive(param1:String) : void
      {
         this.network.send(new §?#j§(param1));
      }
   }
}

