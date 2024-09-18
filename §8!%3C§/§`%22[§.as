package §8!<§
{
   import § !g§.§class for case§;
   import alternativa.osgi.OSGi;
   import alternativa.protocol.ICodec;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.OptionalMap;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.types.Long;
   import §break each§.§extends package super§;
   import flash.utils.ByteArray;
   import platform.client.fp10.core.model.IModel;
   import scpacker.networking.Network;
   
   public class §`"[§
   {
      private var protocol:IProtocol;
      
      private var protocolBuffer:ProtocolBuffer;
      
      private var §1#5§:Long;
      
      private var §,#m§:ICodec;
      
      private var model:IModel;
      
      public function §`"[§(param1:IModel)
      {
         this.§1#5§ = Long.getLong(0,300090028);
         super();
         this.model = param1;
         var _loc2_:ByteArray = new ByteArray();
         this.protocol = IProtocol(OSGi.getInstance().getService(IProtocol));
         this.protocolBuffer = new ProtocolBuffer(_loc2_,_loc2_,new OptionalMap());
      }
      
      public function §?!?§(param1:§class for case§) : void
      {
         Network(OSGi.getInstance().getService(Network)).send(new §extends package super§(param1));
      }
   }
}

