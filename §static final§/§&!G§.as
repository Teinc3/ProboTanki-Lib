package §static final§
{
   import alternativa.osgi.OSGi;
   import alternativa.protocol.ICodec;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.OptionalMap;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.protocol.info.CollectionCodecInfo;
   import alternativa.protocol.info.TypeCodecInfo;
   import alternativa.types.Long;
   import §finally each§.§!"[§;
   import §finally each§.§^u§;
   import flash.utils.ByteArray;
   import platform.client.fp10.core.model.IModel;
   import scpacker.networking.Network;
   
   public class §&!G§
   {
      private var protocol:IProtocol;
      
      private var protocolBuffer:ProtocolBuffer;
      
      private var §with for null§:Long;
      
      private var §<"3§:ICodec;
      
      private var §true set with§:ICodec;
      
      private var §!$$§:Long;
      
      private var model:IModel;
      
      private var network:Network;
      
      public function §&!G§(param1:IModel)
      {
         this.§with for null§ = Long.getLong(0,300050027);
         this.§!$$§ = Long.getLong(0,300050028);
         super();
         this.model = param1;
         var _loc2_:ByteArray = new ByteArray();
         this.protocol = IProtocol(OSGi.getInstance().getService(IProtocol));
         this.network = Network(OSGi.getInstance().getService(Network));
         this.protocolBuffer = new ProtocolBuffer(_loc2_,_loc2_,new OptionalMap());
         this.§<"3§ = this.protocol.getCodec(new CollectionCodecInfo(new TypeCodecInfo(String,false),false,1));
         this.§true set with§ = this.protocol.getCodec(new TypeCodecInfo(String,false));
      }
      
      public function §package var null§(param1:Vector.<String>, param2:String) : void
      {
         this.network.send(new §^u§(param1,param2));
      }
      
      public function §static const case§() : void
      {
         this.network.send(new §!"[§());
      }
   }
}

