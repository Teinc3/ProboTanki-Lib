package §?"c§
{
   import §6&§.§6#[§;
   import alternativa.osgi.OSGi;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.OptionalMap;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.types.Long;
   import flash.utils.ByteArray;
   import platform.client.fp10.core.model.IModel;
   import scpacker.networking.Network;
   
   public class §else const native§
   {
      private var protocol:IProtocol;
      
      private var protocolBuffer:ProtocolBuffer;
      
      private var §implements const const§:Long;
      
      private var model:IModel;
      
      public function §else const native§(param1:IModel)
      {
         this.§implements const const§ = Long.getLong(332422444,557729256);
         super();
         this.model = param1;
         var _loc2_:ByteArray = new ByteArray();
         this.protocol = IProtocol(OSGi.getInstance().getService(IProtocol));
         this.protocolBuffer = new ProtocolBuffer(_loc2_,_loc2_,new OptionalMap());
      }
      
      public function §finally for import§() : void
      {
         Network(OSGi.getInstance().getService(Network)).send(new §6#[§());
      }
   }
}

