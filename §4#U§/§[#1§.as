package §4#U§
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
   import §static set if§.§+k§;
   import §static set if§.§4§;
   import §static set if§.§case set function§;
   import §static set if§.§final const var§;
   import §static set if§.§function const null§;
   import §static set if§.§var for class§;
   
   public class §[#1§
   {
      private var protocol:IProtocol;
      
      private var protocolBuffer:ProtocolBuffer;
      
      private var §null set include§:Long;
      
      private var §0>§:Long;
      
      private var §if package super§:ICodec;
      
      private var §switch catch class§:Long;
      
      private var §throw for import§:ICodec;
      
      private var model:IModel;
      
      public function §[#1§(param1:IModel)
      {
         this.§null set include§ = Long.getLong(0,300050054);
         this.§0>§ = Long.getLong(0,300050055);
         this.§switch catch class§ = Long.getLong(0,300050056);
         super();
         this.model = param1;
         var _loc2_:ByteArray = new ByteArray();
         this.protocol = IProtocol(OSGi.getInstance().getService(IProtocol));
         this.protocolBuffer = new ProtocolBuffer(_loc2_,_loc2_,new OptionalMap());
         this.§if package super§ = this.protocol.getCodec(new TypeCodecInfo(String,false));
         this.§throw for import§ = this.protocol.getCodec(new TypeCodecInfo(String,false));
      }
      
      public function §in const include§(param1:String) : void
      {
         Network(OSGi.getInstance().getService(Network)).send(new §+k§(param1));
      }
      
      public function §="x§() : void
      {
         Network(OSGi.getInstance().getService(Network)).send(new §4#4§());
      }
      
      public function §#!2§() : void
      {
         Network(OSGi.getInstance().getService(Network)).send(new §case set function§());
      }
      
      public function §-#f§(param1:String) : void
      {
         Network(OSGi.getInstance().getService(Network)).send(new §var for class§(param1));
      }
      
      public function §<U§(param1:String) : void
      {
         Network(OSGi.getInstance().getService(Network)).send(new §function const null§(param1));
      }
      
      public function §false set get§(param1:String, param2:String) : void
      {
         Network(OSGi.getInstance().getService(Network)).send(new §final const var§(param1,param2));
      }
   }
}

