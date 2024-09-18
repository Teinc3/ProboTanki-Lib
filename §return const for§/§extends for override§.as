package §return const for§
{
   import §9#2§.§break var if§;
   import alternativa.osgi.OSGi;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.OptionalMap;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.types.Long;
   import flash.utils.ByteArray;
   import platform.client.fp10.core.model.IModel;
   import scpacker.networking.Network;
   
   public class §extends for override§
   {
      private var protocol:IProtocol;
      
      private var protocolBuffer:ProtocolBuffer;
      
      private var §default const final§:Long;
      
      private var model:IModel;
      
      public function §extends for override§(param1:IModel)
      {
         this.§default const final§ = Long.getLong(1329711040,812051806);
         super();
         this.model = param1;
         var _loc2_:ByteArray = new ByteArray();
         this.protocol = IProtocol(OSGi.getInstance().getService(IProtocol));
         this.protocolBuffer = new ProtocolBuffer(_loc2_,_loc2_,new OptionalMap());
      }
      
      public function §native var dynamic§() : void
      {
         Network(OSGi.getInstance().getService(Network)).send(new §break var if§());
      }
   }
}

