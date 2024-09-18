package §,b§
{
   import alternativa.osgi.OSGi;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.OptionalMap;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.types.Long;
   import flash.utils.ByteArray;
   import platform.client.fp10.core.model.IModel;
   import scpacker.networking.Network;
   import §while use§.§&u§;
   
   public class § !i§
   {
      private var protocol:IProtocol;
      
      private var protocolBuffer:ProtocolBuffer;
      
      private var §try package case§:Long;
      
      private var model:IModel;
      
      public function § !i§(param1:IModel)
      {
         this.§try package case§ = Long.getLong(420120869,-795771890);
         super();
         this.model = param1;
         var _loc2_:ByteArray = new ByteArray();
         this.protocol = IProtocol(OSGi.getInstance().getService(IProtocol));
         this.protocolBuffer = new ProtocolBuffer(_loc2_,_loc2_,new OptionalMap());
      }
      
      public function § l§() : void
      {
         Network(OSGi.getInstance().getService(Network)).send(new §&u§());
      }
   }
}

