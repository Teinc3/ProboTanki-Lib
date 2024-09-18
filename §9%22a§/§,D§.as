package §9"a§
{
   import §["t§.§3#A§;
   import alternativa.osgi.OSGi;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.OptionalMap;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.tanks.battle.objects.tank.Tank;
   import alternativa.types.Long;
   import flash.utils.ByteArray;
   import platform.client.fp10.core.model.IModel;
   import scpacker.networking.Network;
   
   public class §,D§
   {
      private var protocol:IProtocol;
      
      private var protocolBuffer:ProtocolBuffer;
      
      private var §]M§:Long;
      
      private var model:IModel;
      
      private var network:Network;
      
      public function §,D§(param1:IModel)
      {
         this.§]M§ = Long.getLong(896493825,-1828539754);
         super();
         this.model = param1;
         var _loc2_:ByteArray = new ByteArray();
         this.protocol = IProtocol(OSGi.getInstance().getService(IProtocol));
         this.network = Network(OSGi.getInstance().getService(Network));
         this.protocolBuffer = new ProtocolBuffer(_loc2_,_loc2_,new OptionalMap());
      }
      
      public function §&"H§(param1:Tank) : void
      {
         this.network.send(new §3#A§());
      }
   }
}

