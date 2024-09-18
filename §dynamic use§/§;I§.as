package §dynamic use§
{
   import alternativa.osgi.OSGi;
   import alternativa.protocol.ICodec;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.OptionalMap;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.protocol.info.TypeCodecInfo;
   import alternativa.types.Long;
   import §catch const dynamic§.§6!-§;
   import flash.utils.ByteArray;
   import platform.client.fp10.core.model.IModel;
   import scpacker.networking.Network;
   
   public class §;I§
   {
      private var protocol:IProtocol;
      
      private var protocolBuffer:ProtocolBuffer;
      
      private var §final set final§:Long;
      
      private var §5!z§:ICodec;
      
      private var model:IModel;
      
      public function §;I§(param1:IModel)
      {
         this.§final set final§ = Long.getLong(0,300020046);
         super();
         this.model = param1;
         var _loc2_:ByteArray = new ByteArray();
         this.protocol = IProtocol(OSGi.getInstance().getService(IProtocol));
         this.protocolBuffer = new ProtocolBuffer(_loc2_,_loc2_,new OptionalMap());
         this.§5!z§ = this.protocol.getCodec(new TypeCodecInfo(String,false));
      }
      
      public function §%!!§(param1:String) : void
      {
         Network(OSGi.getInstance().getService(Network)).send(new §6!-§(param1));
      }
   }
}

