package §package var while§
{
   import §>"O§.§&!H§;
   import alternativa.osgi.OSGi;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.OptionalMap;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.types.Long;
   import flash.utils.ByteArray;
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   import scpacker.networking.Network;
   
   public class §function const throw§
   {
      private var protocol:IProtocol;
      
      private var protocolBuffer:ProtocolBuffer;
      
      private var §>"n§:Long;
      
      private var model:IModel;
      
      public function §function const throw§(param1:IModel)
      {
         this.§>"n§ = Long.getLong(1031114541,134796764);
         super();
         this.model = param1;
         var _loc2_:ByteArray = new ByteArray();
         this.protocol = IProtocol(OSGi.getInstance().getService(IProtocol));
         this.protocolBuffer = new ProtocolBuffer(_loc2_,_loc2_,new OptionalMap());
      }
      
      public function fit() : void
      {
         Network(OSGi.getInstance().getService(Network)).send(new §&!H§(Model.object.name));
      }
   }
}

