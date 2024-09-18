package projects.tanks.client.entrance.model.entrance.externalentrance
{
   import § "5§.§,!t§;
   import § "5§.§6"G§;
   import alternativa.osgi.OSGi;
   import alternativa.protocol.ICodec;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.OptionalMap;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.protocol.info.TypeCodecInfo;
   import alternativa.types.Long;
   import §else for implements§.§[!m§;
   import flash.utils.ByteArray;
   import platform.client.fp10.core.model.IModel;
   import scpacker.networking.Network;
   
   public class §include set native§
   {
      private var protocol:IProtocol;
      
      private var protocolBuffer:ProtocolBuffer;
      
      private var §import for each§:Long;
      
      private var §finally get§:ICodec;
      
      private var §override catch true§:ICodec;
      
      private var §if while§:Long;
      
      private var §false if§:ICodec;
      
      private var §continue var class§:ICodec;
      
      private var §false for get§:Long;
      
      private var §##n§:ICodec;
      
      private var §3P§:ICodec;
      
      private var model:IModel;
      
      public function §include set native§(param1:IModel)
      {
         this.§import for each§ = Long.getLong(0,300020027);
         this.§if while§ = Long.getLong(0,300020028);
         this.§false for get§ = Long.getLong(0,300020029);
         super();
         this.model = param1;
         var _loc2_:ByteArray = new ByteArray();
         this.protocol = IProtocol(OSGi.getInstance().getService(IProtocol));
         this.protocolBuffer = new ProtocolBuffer(_loc2_,_loc2_,new OptionalMap());
         this.§finally get§ = this.protocol.getCodec(new TypeCodecInfo(String,false));
         this.§override catch true§ = this.protocol.getCodec(new TypeCodecInfo(String,false));
         this.§false if§ = this.protocol.getCodec(new TypeCodecInfo(String,false));
         this.§continue var class§ = this.protocol.getCodec(new TypeCodecInfo(String,true));
         this.§##n§ = this.protocol.getCodec(new TypeCodecInfo(Boolean,false));
         this.§3P§ = this.protocol.getCodec(new TypeCodecInfo(String,false));
      }
      
      public function §finally var while§(param1:String, param2:String) : void
      {
         Network(OSGi.getInstance().getService(Network)).send(new §6"G§(param1,param2));
      }
      
      public function § "P§(param1:String, param2:String) : void
      {
         Network(OSGi.getInstance().getService(Network)).send(new §[!m§(param1));
      }
      
      public function §static package try§(param1:Boolean, param2:String) : void
      {
         Network(OSGi.getInstance().getService(Network)).send(new §,!t§(param1));
      }
   }
}

