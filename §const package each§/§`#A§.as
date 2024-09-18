package §const package each§
{
   import §4"T§.§6#,§;
   import alternativa.osgi.OSGi;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.OptionalMap;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.types.Long;
   import flash.utils.ByteArray;
   import platform.client.fp10.core.model.IModel;
   import scpacker.networking.Network;
   
   public class §`#A§
   {
      private var protocol:IProtocol;
      
      private var protocolBuffer:ProtocolBuffer;
      
      private var §-#W§:Long;
      
      private var model:IModel;
      
      public function §`#A§(param1:IModel)
      {
         this.§-#W§ = Long.getLong(0,300050020);
         super();
         this.model = param1;
         var _loc2_:ByteArray = new ByteArray();
         this.protocol = IProtocol(OSGi.getInstance().getService(IProtocol));
         this.protocolBuffer = new ProtocolBuffer(_loc2_,_loc2_,new OptionalMap());
      }
      
      public function show() : void
      {
         Network(OSGi.getInstance().getService(Network)).send(new §6#,§());
      }
   }
}

