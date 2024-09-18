package projects.tanks.client.battlefield.models.battle.battlefield
{
   import §<">§.§4!5§;
   import §<">§.§true const while§;
   import alternativa.osgi.OSGi;
   import alternativa.protocol.ICodec;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.OptionalMap;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.protocol.info.CollectionCodecInfo;
   import alternativa.protocol.info.TypeCodecInfo;
   import alternativa.types.Float;
   import alternativa.types.Long;
   import flash.utils.ByteArray;
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.network.command.SpaceCommand;
   import platform.client.fp10.core.type.IGameObject;
   import platform.client.fp10.core.type.ISpace;
   import scpacker.networking.Network;
   
   public class §"%§
   {
      private var protocol:IProtocol;
      
      private var protocolBuffer:ProtocolBuffer;
      
      private var §import const set§:Long;
      
      private var §!! §:ICodec;
      
      private var §4N§:Long;
      
      private var §+#[§:ICodec;
      
      private var §while set catch§:Long;
      
      private var §extends var with§:ICodec;
      
      private var §true const finally§:ICodec;
      
      private var §+"t§:Long;
      
      private var model:IModel;
      
      private var network:Network;
      
      public function §"%§(param1:IModel)
      {
         this.§import const set§ = Long.getLong(312624829,1518890877);
         this.§4N§ = Long.getLong(312624829,1518890663);
         this.§while set catch§ = Long.getLong(1789749753,1049490765);
         this.§+"t§ = Long.getLong(312624829,1518890261);
         super();
         this.model = param1;
         var _loc2_:ByteArray = new ByteArray();
         this.protocol = IProtocol(OSGi.getInstance().getService(IProtocol));
         this.network = Network(OSGi.getInstance().getService(Network));
         this.protocolBuffer = new ProtocolBuffer(_loc2_,_loc2_,new OptionalMap());
         this.§!! § = this.protocol.getCodec(new CollectionCodecInfo(new TypeCodecInfo(int,false),false,1));
         this.§+#[§ = this.protocol.getCodec(new TypeCodecInfo(int,false));
         this.§true const finally§ = this.protocol.getCodec(new TypeCodecInfo(Float,false));
      }
      
      public function §class class§(param1:Vector.<int>) : void
      {
         this.network.send(new §true const while§(param1));
      }
      
      public function §1_§(param1:int) : void
      {
         this.network.send(new §4!5§(param1));
      }
      
      public function §4!1§() : void
      {
         ByteArray(this.protocolBuffer.writer).position = 0;
         ByteArray(this.protocolBuffer.writer).length = 0;
         ByteArray(this.protocolBuffer.writer).position = 0;
         if(Model.object == null)
         {
            throw new Error("Execute method without model context.");
         }
         var _loc1_:SpaceCommand = new SpaceCommand(Model.object.id,this.§+"t§,this.protocolBuffer);
         var _loc2_:IGameObject = Model.object;
         var _loc3_:ISpace = _loc2_.space;
         _loc3_.commandSender.sendCommand(_loc1_);
         this.protocolBuffer.optionalMap.clear();
      }
   }
}

