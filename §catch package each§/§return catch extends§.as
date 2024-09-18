package §catch package each§
{
   import §;"d§.§with catch while§;
   import alternativa.osgi.OSGi;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.OptionalMap;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.types.Long;
   import flash.utils.ByteArray;
   import platform.client.fp10.core.model.IModel;
   import scpacker.networking.Network;
   
   public class §return catch extends§
   {
      private var protocol:IProtocol;
      
      private var protocolBuffer:ProtocolBuffer;
      
      private var §package set try§:Long;
      
      private var model:IModel;
      
      private var network:Network;
      
      public function §return catch extends§(param1:IModel)
      {
         this.§package set try§ = Long.getLong(1606027120,-34106692);
         super();
         this.model = param1;
         var _loc2_:ByteArray = new ByteArray();
         this.network = Network(OSGi.getInstance().getService(Network));
         this.protocol = IProtocol(OSGi.getInstance().getService(IProtocol));
         this.protocolBuffer = new ProtocolBuffer(_loc2_,_loc2_,new OptionalMap());
      }
      
      public function §%%§() : void
      {
         this.network.send(new §with catch while§());
      }
   }
}

