package §include package while§
{
   import §9"j§.§7n§;
   import §9"j§.§if for use§;
   import §9"j§.§try catch finally§;
   import §;"?§.§#">§;
   import alternativa.object.ClientObject;
   import alternativa.osgi.OSGi;
   import alternativa.protocol.ICodec;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.OptionalMap;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.types.Long;
   import flash.utils.ByteArray;
   import platform.client.fp10.core.model.IModel;
   import scpacker.networking.Network;
   
   public class §,!W§
   {
      private var protocol:IProtocol;
      
      private var protocolBuffer:ProtocolBuffer;
      
      private var §%#D§:Long;
      
      private var §dynamic catch static§:ICodec;
      
      private var §'"$§:ICodec;
      
      private var §-!N§:Long;
      
      private var §["?§:Long;
      
      private var §final var in§:ICodec;
      
      private var model:IModel;
      
      private var network:Network;
      
      public function §,!W§(param1:IModel)
      {
         this.§%#D§ = Long.getLong(378246388,-1614466693);
         this.§-!N§ = Long.getLong(1929188336,1755522623);
         this.§["?§ = Long.getLong(840274237,-606345319);
         super();
         this.model = param1;
         var _loc2_:ByteArray = new ByteArray();
         this.network = Network(OSGi.getInstance().getService(Network));
         this.protocol = IProtocol(OSGi.getInstance().getService(IProtocol));
         this.protocolBuffer = new ProtocolBuffer(_loc2_,_loc2_,new OptionalMap());
      }
      
      public function §var const extends§(param1:ClientObject, param2:§#">§) : void
      {
         this.network.send(new §try catch finally§(param1.id,param2));
      }
      
      public function hide() : void
      {
         this.network.send(new §7n§());
      }
      
      public function §else catch class§(param1:Number) : void
      {
         this.network.send(new §if for use§(param1));
      }
   }
}

