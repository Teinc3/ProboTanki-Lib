package §##N§
{
   import §>"O§.§>!S§;
   import alternativa.osgi.OSGi;
   import alternativa.protocol.ICodec;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.OptionalMap;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.protocol.info.TypeCodecInfo;
   import alternativa.tanks.model.item.present.PresentItem;
   import alternativa.types.Long;
   import flash.utils.ByteArray;
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.type.IGameObject;
   import scpacker.networking.Network;
   
   public class §class var continue§
   {
      private var protocol:IProtocol;
      
      private var protocolBuffer:ProtocolBuffer;
      
      private var §const import§:Long;
      
      private var §?#e§:ICodec;
      
      private var model:IModel;
      
      public function §class var continue§(param1:IModel)
      {
         this.§const import§ = Long.getLong(1053633131,-938990018);
         super();
         this.model = param1;
         var _loc2_:ByteArray = new ByteArray();
         this.protocol = IProtocol(OSGi.getInstance().getService(IProtocol));
         this.protocolBuffer = new ProtocolBuffer(_loc2_,_loc2_,new OptionalMap());
         this.§?#e§ = this.protocol.getCodec(new TypeCodecInfo(IGameObject,false));
      }
      
      public function removePresent(param1:IGameObject) : void
      {
         Network(OSGi.getInstance().getService(Network)).send(new §>!S§(PresentItem(param1.adapt(PresentItem)).getConstructor().id));
      }
   }
}

