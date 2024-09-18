package §for package case§
{
   import §,!B§.§each const package§;
   import §,!B§.§function catch switch§;
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
   
   public class §#"7§
   {
      private var protocol:IProtocol;
      
      private var protocolBuffer:ProtocolBuffer;
      
      private var §include for continue§:Long;
      
      private var §const var include§:Long;
      
      private var §="8§:ICodec;
      
      private var model:IModel;
      
      private var network:Network;
      
      public function §#"7§(param1:IModel)
      {
         this.§include for continue§ = Long.getLong(808822004,973348892);
         this.§const var include§ = Long.getLong(1592012491,843943942);
         super();
         this.model = param1;
         var _loc2_:ByteArray = new ByteArray();
         this.protocol = IProtocol(OSGi.getInstance().getService(IProtocol));
         this.network = Network(OSGi.getInstance().getService(Network));
         this.protocolBuffer = new ProtocolBuffer(_loc2_,_loc2_,new OptionalMap());
         this.§="8§ = this.protocol.getCodec(new TypeCodecInfo(String,false));
      }
      
      public function §continue package catch§() : void
      {
         this.network.send(new §each const package§());
      }
      
      public function §8#Z§(param1:String) : void
      {
         this.network.send(new §function catch switch§(param1));
      }
   }
}

