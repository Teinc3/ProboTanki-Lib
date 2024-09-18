package §,#K§
{
   import §#"Z§.§["C§;
   import alternativa.osgi.OSGi;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.OptionalMap;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.types.Long;
   import flash.utils.ByteArray;
   import platform.client.fp10.core.model.IModel;
   import scpacker.networking.Network;
   
   public class §with var continue§
   {
      private var protocol:IProtocol;
      
      private var protocolBuffer:ProtocolBuffer;
      
      private var native:Long;
      
      private var model:IModel;
      
      private var network:Network;
      
      public function §with var continue§(param1:IModel)
      {
         this.native = Long.getLong(2114234791,-757663181);
         super();
         this.model = param1;
         this.network = Network(OSGi.getInstance().getService(Network));
         var _loc2_:ByteArray = new ByteArray();
         this.protocol = IProtocol(OSGi.getInstance().getService(IProtocol));
         this.protocolBuffer = new ProtocolBuffer(_loc2_,_loc2_,new OptionalMap());
      }
      
      public function activate(param1:String) : void
      {
         this.network.send(new §["C§(param1));
      }
   }
}

