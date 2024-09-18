package §-!?§
{
   import §=#'§.§+"n§;
   import §=#'§.§1e§;
   import §=#'§.§use const override§;
   import alternativa.osgi.OSGi;
   import alternativa.protocol.ICodec;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.OptionalMap;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.protocol.info.TypeCodecInfo;
   import alternativa.types.Long;
   import flash.utils.ByteArray;
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.network.command.SpaceCommand;
   import platform.client.fp10.core.type.IGameObject;
   import platform.client.fp10.core.type.ISpace;
   import scpacker.networking.Network;
   
   public class §dynamic for const§
   {
      private var protocol:IProtocol;
      
      private var protocolBuffer:ProtocolBuffer;
      
      private var §]"Q§:Long;
      
      private var §extends var throw§:ICodec;
      
      private var §each class§:ICodec;
      
      private var §do package var§:ICodec;
      
      private var §get catch get§:Long;
      
      private var §default default§:ICodec;
      
      private var §with package override§:Long;
      
      private var §default catch else§:ICodec;
      
      private var §]"-§:Long;
      
      private var §each var override§:ICodec;
      
      private var model:IModel;
      
      public function §dynamic for const§(param1:IModel)
      {
         this.§]"Q§ = Long.getLong(0,300020058);
         this.§get catch get§ = Long.getLong(0,300020059);
         this.§with package override§ = Long.getLong(0,300020060);
         this.§]"-§ = Long.getLong(0,300020061);
         super();
         this.model = param1;
         var _loc2_:ByteArray = new ByteArray();
         this.protocol = IProtocol(OSGi.getInstance().getService(IProtocol));
         this.protocolBuffer = new ProtocolBuffer(_loc2_,_loc2_,new OptionalMap());
         this.§extends var throw§ = this.protocol.getCodec(new TypeCodecInfo(String,false));
         this.§each class§ = this.protocol.getCodec(new TypeCodecInfo(String,false));
         this.§do package var§ = this.protocol.getCodec(new TypeCodecInfo(String,false));
         this.§default default§ = this.protocol.getCodec(new TypeCodecInfo(String,false));
         this.§default catch else§ = this.protocol.getCodec(new TypeCodecInfo(String,false));
         this.§each var override§ = this.protocol.getCodec(new TypeCodecInfo(String,false));
      }
      
      public function changePasswordAndEmail(param1:String, param2:String, param3:String) : void
      {
         Network(OSGi.getInstance().getService(Network)).send(new §use const override§(param2,param3));
      }
      
      public function §null set true§(param1:String) : void
      {
         Network(OSGi.getInstance().getService(Network)).send(new §1e§(param1));
      }
      
      public function §do var return§(param1:String) : void
      {
         ByteArray(this.protocolBuffer.writer).position = 0;
         ByteArray(this.protocolBuffer.writer).length = 0;
         this.§default catch else§.encode(this.protocolBuffer,param1);
         ByteArray(this.protocolBuffer.writer).position = 0;
         if(Model.object == null)
         {
            throw new Error("Execute method without model context.");
         }
         var _loc2_:SpaceCommand = new SpaceCommand(Model.object.id,this.§with package override§,this.protocolBuffer);
         var _loc3_:IGameObject = Model.object;
         var _loc4_:ISpace = _loc3_.space;
         _loc4_.commandSender.sendCommand(_loc2_);
         this.protocolBuffer.optionalMap.clear();
      }
      
      public function sendUsersRestorePasswordLink(param1:String) : void
      {
         Network(OSGi.getInstance().getService(Network)).send(new §+"n§(param1));
      }
   }
}

