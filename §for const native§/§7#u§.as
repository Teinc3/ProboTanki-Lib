package §for const native§
{
   import §'"f§.§7"K§;
   import alternativa.osgi.OSGi;
   import alternativa.protocol.ICodec;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.OptionalMap;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.protocol.info.TypeCodecInfo;
   import alternativa.types.Long;
   import flash.utils.ByteArray;
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.type.IGameObject;
   import scpacker.networking.Network;
   
   public class §7#u§
   {
      private var protocol:IProtocol;
      
      private var protocolBuffer:ProtocolBuffer;
      
      private var _selectId:Long;
      
      private var §catch package static§:ICodec;
      
      private var model:IModel;
      
      public function §7#u§(param1:IModel)
      {
         this._selectId = Long.getLong(0,300050004);
         super();
         this.model = param1;
         var _loc2_:ByteArray = new ByteArray();
         this.protocol = IProtocol(OSGi.getInstance().getService(IProtocol));
         this.protocolBuffer = new ProtocolBuffer(_loc2_,_loc2_,new OptionalMap());
         this.§catch package static§ = this.protocol.getCodec(new TypeCodecInfo(IGameObject,false));
      }
      
      public function select(param1:IGameObject) : void
      {
         Network(OSGi.getInstance().getService(Network)).send(new §7"K§(param1.name));
      }
   }
}

