package §>Y§
{
   import § !g§.§class for case§;
   import alternativa.osgi.OSGi;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.OptionalMap;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.types.Long;
   import §break each§.§extends package super§;
   import flash.utils.ByteArray;
   import platform.client.fp10.core.model.IModel;
   import scpacker.networking.Network;
   
   public class §"!x§
   {
      private var protocol:IProtocol;
      
      private var protocolBuffer:ProtocolBuffer;
      
      private var §1#5§:Long;
      
      private var model:IModel;
      
      private var network:Network;
      
      public function §"!x§(param1:IModel)
      {
         this.§1#5§ = Long.getLong(0,300090007);
         super();
         this.model = param1;
         this.network = Network(OSGi.getInstance().getService(Network));
         var _loc2_:ByteArray = new ByteArray();
         this.protocol = IProtocol(OSGi.getInstance().getService(IProtocol));
         this.protocolBuffer = new ProtocolBuffer(_loc2_,_loc2_,new OptionalMap());
      }
      
      public function §?!?§() : void
      {
         this.network.send(new §extends package super§(§class for case§.NONE));
      }
   }
}

