package §,"i§
{
   import alternativa.osgi.OSGi;
   import alternativa.protocol.ICodec;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.OptionalMap;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.protocol.info.TypeCodecInfo;
   import alternativa.types.Long;
   import flash.utils.ByteArray;
   import platform.client.fp10.core.model.IModel;
   import scpacker.networking.Network;
   import §static set if§.§use set if§;
   
   public class §get for include§
   {
      private var protocol:IProtocol;
      
      private var protocolBuffer:ProtocolBuffer;
      
      private var §var const implements§:Long;
      
      private var §catch set include§:ICodec;
      
      private var model:IModel;
      
      private var network:Network;
      
      public function §get for include§(param1:IModel)
      {
         this.§var const implements§ = Long.getLong(2095583187,-547646417);
         super();
         this.model = param1;
         var _loc2_:ByteArray = new ByteArray();
         this.protocol = IProtocol(OSGi.getInstance().getService(IProtocol));
         this.network = Network(OSGi.getInstance().getService(Network));
         this.protocolBuffer = new ProtocolBuffer(_loc2_,_loc2_,new OptionalMap());
         this.§catch set include§ = this.protocol.getCodec(new TypeCodecInfo(Boolean,false));
      }
      
      public function enable(param1:Boolean) : void
      {
         this.network.send(new §use set if§(param1));
      }
   }
}

