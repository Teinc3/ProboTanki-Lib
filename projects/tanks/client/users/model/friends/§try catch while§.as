package projects.tanks.client.users.model.friends
{
   import §4"T§.§+h§;
   import §4"T§.§1,§;
   import §4"T§.§2"n§;
   import §4"T§.§;,§;
   import §4"T§.§function package var§;
   import §4"T§.§include package native§;
   import §4"T§.§override package true§;
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
   
   public class §try catch while§
   {
      private var protocol:IProtocol;
      
      private var protocolBuffer:ProtocolBuffer;
      
      private var §@F§:Long;
      
      private var §!!l§:ICodec;
      
      private var §0X§:Long;
      
      private var §for var if§:ICodec;
      
      private var §#!7§:Long;
      
      private var §'#6§:ICodec;
      
      private var §1#T§:Long;
      
      private var §^#P§:ICodec;
      
      private var §if for false§:Long;
      
      private var §+"j§:ICodec;
      
      private var §const package do§:Long;
      
      private var §break var case§:ICodec;
      
      private var §get for implements§:Long;
      
      private var §>#T§:Long;
      
      private var §'!t§:ICodec;
      
      private var model:IModel;
      
      private var network:Network;
      
      public function §try catch while§(param1:IModel)
      {
         this.§@F§ = Long.getLong(615300036,-941734513);
         this.§0X§ = Long.getLong(1307353856,-1978331782);
         this.§#!7§ = Long.getLong(1402151501,-2115283743);
         this.§1#T§ = Long.getLong(1152146944,316147596);
         this.§if for false§ = Long.getLong(2058361593,-1495639969);
         this.§const package do§ = Long.getLong(615300036,-452983770);
         this.§get for implements§ = Long.getLong(517020203,52182117);
         this.§>#T§ = Long.getLong(615300036,-452616435);
         super();
         this.model = param1;
         var _loc2_:ByteArray = new ByteArray();
         this.protocol = IProtocol(OSGi.getInstance().getService(IProtocol));
         this.network = Network(OSGi.getInstance().getService(Network));
         this.protocolBuffer = new ProtocolBuffer(_loc2_,_loc2_,new OptionalMap());
         this.§!!l§ = this.protocol.getCodec(new TypeCodecInfo(Long,false));
         this.§for var if§ = this.protocol.getCodec(new TypeCodecInfo(Long,false));
         this.§'#6§ = this.protocol.getCodec(new TypeCodecInfo(String,false));
         this.§^#P§ = this.protocol.getCodec(new TypeCodecInfo(Long,false));
         this.§+"j§ = this.protocol.getCodec(new TypeCodecInfo(String,false));
         this.§break var case§ = this.protocol.getCodec(new TypeCodecInfo(Long,false));
         this.§'!t§ = this.protocol.getCodec(new TypeCodecInfo(Long,false));
      }
      
      public function accept(param1:String) : void
      {
         this.network.send(new §override package true§(param1));
      }
      
      public function add(param1:String) : void
      {
         this.network.send(new §;,§(param1));
      }
      
      public function addByUid(param1:String) : void
      {
         this.network.send(new §;,§(param1));
      }
      
      public function breakItOff(param1:String) : void
      {
         this.network.send(new §include package native§(param1));
      }
      
      public function §5!t§(param1:String) : void
      {
         this.network.send(new §1,§(param1));
      }
      
      public function reject(param1:String) : void
      {
         this.network.send(new §function package var§(param1));
      }
      
      public function §while package§() : void
      {
         this.network.send(new §2"n§());
      }
      
      public function revoke(param1:String) : void
      {
         this.network.send(new §+h§(param1));
      }
   }
}

