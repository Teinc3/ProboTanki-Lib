package §implements const catch§
{
   import §]"^§.§""q§;
   import §]"^§.§9#N§;
   import alternativa.osgi.OSGi;
   import alternativa.protocol.ICodec;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.OptionalMap;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.protocol.info.CollectionCodecInfo;
   import alternativa.protocol.info.TypeCodecInfo;
   import alternativa.types.Long;
   import flash.utils.ByteArray;
   import platform.client.fp10.core.model.IModel;
   import scpacker.networking.Network;
   
   public class §return var else§
   {
      private var protocol:IProtocol;
      
      private var protocolBuffer:ProtocolBuffer;
      
      private var §,#6§:Long;
      
      private var §break const super§:ICodec;
      
      private var §final const set§:Long;
      
      private var §native package return§:ICodec;
      
      private var model:IModel;
      
      public function §return var else§(param1:IModel)
      {
         this.§,#6§ = Long.getLong(0,300150005);
         this.§final const set§ = Long.getLong(0,300150006);
         super();
         this.model = param1;
         var _loc2_:ByteArray = new ByteArray();
         this.protocol = IProtocol(OSGi.getInstance().getService(IProtocol));
         this.protocolBuffer = new ProtocolBuffer(_loc2_,_loc2_,new OptionalMap());
         this.§break const super§ = this.protocol.getCodec(new TypeCodecInfo(Long,false));
         this.§native package return§ = this.protocol.getCodec(new CollectionCodecInfo(new TypeCodecInfo(Long,false),false,1));
      }
      
      public function subscribe(param1:String) : void
      {
         Network(OSGi.getInstance().getService(Network)).send(new §9#N§(param1));
      }
      
      public function §use const const§(param1:Vector.<String>) : void
      {
         Network(OSGi.getInstance().getService(Network)).send(new §""q§(param1));
      }
   }
}

