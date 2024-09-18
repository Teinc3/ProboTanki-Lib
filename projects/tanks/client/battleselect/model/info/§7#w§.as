package projects.tanks.client.battleselect.model.info
{
   import alternativa.osgi.OSGi;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.OptionalMap;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.types.Long;
   import §break each§.§false for case§;
   import flash.utils.ByteArray;
   import platform.client.fp10.core.model.IModel;
   import scpacker.networking.Network;
   
   public class §7#w§
   {
      private var protocol:IProtocol;
      
      private var protocolBuffer:ProtocolBuffer;
      
      private var §function for var§:Long;
      
      private var model:IModel;
      
      public function §7#w§(param1:IModel)
      {
         this.§function for var§ = Long.getLong(0,300090013);
         super();
         this.model = param1;
         var _loc2_:ByteArray = new ByteArray();
         this.protocol = IProtocol(OSGi.getInstance().getService(IProtocol));
         this.protocolBuffer = new ProtocolBuffer(_loc2_,_loc2_,new OptionalMap());
      }
      
      public function §catch return§() : void
      {
         Network(OSGi.getInstance().getService(Network)).send(new §false for case§());
      }
   }
}

