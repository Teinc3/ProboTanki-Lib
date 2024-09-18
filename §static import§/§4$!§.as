package §static import§
{
   import §>"O§.§else package continue§;
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
   
   public class §4$!§
   {
      private var protocol:IProtocol;
      
      private var protocolBuffer:ProtocolBuffer;
      
      private var §!"S§:Long;
      
      private var §get var dynamic§:ICodec;
      
      private var model:IModel;
      
      private var network:Network;
      
      public function §4$!§(param1:IModel)
      {
         this.§!"S§ = Long.getLong(1667820062,-1874560004);
         super();
         this.model = param1;
         var _loc2_:ByteArray = new ByteArray();
         this.network = Network(OSGi.getInstance().getService(Network));
         this.protocol = IProtocol(OSGi.getInstance().getService(IProtocol));
         this.protocolBuffer = new ProtocolBuffer(_loc2_,_loc2_,new OptionalMap());
         this.§get var dynamic§ = this.protocol.getCodec(new TypeCodecInfo(String,false));
      }
      
      public function rename(param1:String) : void
      {
         this.network.send(new §else package continue§(param1));
      }
   }
}

