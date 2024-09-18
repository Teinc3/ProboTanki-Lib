package §>#m§
{
   import §9#2§.§0#w§;
   import alternativa.osgi.OSGi;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.OptionalMap;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.types.Long;
   import flash.utils.ByteArray;
   import platform.client.fp10.core.model.IModel;
   import scpacker.networking.Network;
   
   public class §package const in§
   {
      private var protocol:IProtocol;
      
      private var protocolBuffer:ProtocolBuffer;
      
      private var §0Y§:Long;
      
      private var model:IModel;
      
      public function §package const in§(param1:IModel)
      {
         this.§0Y§ = Long.getLong(398629213,-361250798);
         super();
         this.model = param1;
         var _loc2_:ByteArray = new ByteArray();
         this.protocol = IProtocol(OSGi.getInstance().getService(IProtocol));
         this.protocolBuffer = new ProtocolBuffer(_loc2_,_loc2_,new OptionalMap());
      }
      
      public function §true package super§() : void
      {
         Network(OSGi.getInstance().getService(Network)).send(new §0#w§());
      }
   }
}

