package §var set dynamic§
{
   import alternativa.osgi.OSGi;
   import alternativa.protocol.ICodec;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.OptionalMap;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.protocol.info.TypeCodecInfo;
   import alternativa.types.Long;
   import §extends const import§.§`!V§;
   import flash.utils.ByteArray;
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.network.command.SpaceCommand;
   import platform.client.fp10.core.type.IGameObject;
   import platform.client.fp10.core.type.ISpace;
   import scpacker.networking.Network;
   
   public class §,#e§
   {
      private var protocol:IProtocol;
      
      private var protocolBuffer:ProtocolBuffer;
      
      private var §with include§:Long;
      
      private var §6"7§:ICodec;
      
      private var §-h§:Long;
      
      private var §%"k§:ICodec;
      
      private var model:IModel;
      
      public function §,#e§(param1:IModel)
      {
         this.§with include§ = Long.getLong(0,300020043);
         this.§-h§ = Long.getLong(0,300020044);
         super();
         this.model = param1;
         var _loc2_:ByteArray = new ByteArray();
         this.protocol = IProtocol(OSGi.getInstance().getService(IProtocol));
         this.protocolBuffer = new ProtocolBuffer(_loc2_,_loc2_,new OptionalMap());
         this.§6"7§ = this.protocol.getCodec(new TypeCodecInfo(String,false));
         this.§%"k§ = this.protocol.getCodec(new TypeCodecInfo(String,false));
      }
      
      public function loginByHash(param1:String) : void
      {
         Network(OSGi.getInstance().getService(Network)).send(new §`!V§(param1));
      }
      
      public function loginBySingleUseHash(param1:String) : void
      {
         ByteArray(this.protocolBuffer.writer).position = 0;
         ByteArray(this.protocolBuffer.writer).length = 0;
         this.§%"k§.encode(this.protocolBuffer,param1);
         ByteArray(this.protocolBuffer.writer).position = 0;
         if(Model.object == null)
         {
            throw new Error("Execute method without model context.");
         }
         var _loc2_:SpaceCommand = new SpaceCommand(Model.object.id,this.§-h§,this.protocolBuffer);
         var _loc3_:IGameObject = Model.object;
         var _loc4_:ISpace = _loc3_.space;
         _loc4_.commandSender.sendCommand(_loc2_);
         this.protocolBuffer.optionalMap.clear();
      }
   }
}

