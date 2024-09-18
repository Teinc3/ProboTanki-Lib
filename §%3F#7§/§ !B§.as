package §?#7§
{
   import §>"O§.§'#S§;
   import alternativa.osgi.OSGi;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.OptionalMap;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.types.Long;
   import flash.utils.ByteArray;
   import platform.client.fp10.core.model.IModel;
   import scpacker.networking.Network;
   
   public class § !B§
   {
      private var protocol:IProtocol;
      
      private var protocolBuffer:ProtocolBuffer;
      
      private var §default const null§:Long;
      
      private var model:IModel;
      
      public function § !B§(param1:IModel)
      {
         this.§default const null§ = Long.getLong(914895541,882746119);
         super();
         this.model = param1;
         var _loc2_:ByteArray = new ByteArray();
         this.protocol = IProtocol(OSGi.getInstance().getService(IProtocol));
         this.protocolBuffer = new ProtocolBuffer(_loc2_,_loc2_,new OptionalMap());
      }
      
      public function §case set if§() : void
      {
         Network(OSGi.getInstance().getService(Network)).send(new §'#S§());
      }
   }
}

