package §1"z§
{
   import alternativa.osgi.OSGi;
   import alternativa.protocol.ICodec;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.OptionalMap;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.protocol.info.TypeCodecInfo;
   import alternativa.types.Long;
   import §dynamic set try§.§6#[§;
   import flash.utils.ByteArray;
   import platform.client.fp10.core.model.IModel;
   import scpacker.networking.Network;
   
   public class §%"b§
   {
      private var protocol:IProtocol;
      
      private var protocolBuffer:ProtocolBuffer;
      
      private var §implements const const§:Long;
      
      private var §extends set case§:ICodec;
      
      private var §4"p§:ICodec;
      
      private var model:IModel;
      
      private var network:Network;
      
      public function §%"b§(param1:IModel)
      {
         this.§implements const const§ = Long.getLong(829170552,1724953279);
         super();
         this.model = param1;
         var _loc2_:ByteArray = new ByteArray();
         this.network = Network(OSGi.getInstance().getService(Network));
         this.protocol = IProtocol(OSGi.getInstance().getService(IProtocol));
         this.protocolBuffer = new ProtocolBuffer(_loc2_,_loc2_,new OptionalMap());
         this.§extends set case§ = this.protocol.getCodec(new TypeCodecInfo(int,false));
         this.§4"p§ = this.protocol.getCodec(new TypeCodecInfo(int,false));
      }
      
      public function §finally for import§(param1:int, param2:int) : void
      {
         this.network.send(new §6#[§(param1,param2));
      }
   }
}

