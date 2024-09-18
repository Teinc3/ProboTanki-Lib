package projects.tanks.client.panel.model.dailyquest
{
   import §9#2§.§1!G§;
   import §9#2§.§<4§;
   import §9#2§.§[k§;
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
   
   public class §continue var set§
   {
      private var protocol:IProtocol;
      
      private var protocolBuffer:ProtocolBuffer;
      
      private var §?w§:Long;
      
      private var §extends catch finally§:ICodec;
      
      private var §default var while§:ICodec;
      
      private var §%!I§:Long;
      
      private var §get for throw§:ICodec;
      
      private var §true set do§:Long;
      
      private var §[z§:ICodec;
      
      private var model:IModel;
      
      public function §continue var set§(param1:IModel)
      {
         this.§?w§ = Long.getLong(721193585,-108838556);
         this.§%!I§ = Long.getLong(898481927,1112991605);
         this.§true set do§ = Long.getLong(663591737,-831307794);
         super();
         this.model = param1;
         var _loc2_:ByteArray = new ByteArray();
         this.protocol = IProtocol(OSGi.getInstance().getService(IProtocol));
         this.protocolBuffer = new ProtocolBuffer(_loc2_,_loc2_,new OptionalMap());
         this.§extends catch finally§ = this.protocol.getCodec(new TypeCodecInfo(Long,false));
         this.§default var while§ = this.protocol.getCodec(new TypeCodecInfo(int,false));
         this.§get for throw§ = this.protocol.getCodec(new TypeCodecInfo(Long,false));
         this.§[z§ = this.protocol.getCodec(new TypeCodecInfo(Long,false));
      }
      
      public function §["Z§(param1:Long, param2:int) : void
      {
         Network(OSGi.getInstance().getService(Network)).send(new §[k§(param1.low));
      }
      
      public function §dynamic const switch§(param1:Long) : void
      {
         Network(OSGi.getInstance().getService(Network)).send(new §1!G§(param1.low));
      }
      
      public function takePrize(param1:Long) : void
      {
         Network(OSGi.getInstance().getService(Network)).send(new §<4§(param1.low));
      }
   }
}

