package §!#^§
{
   import §@"5§.§'"M§;
   import §@"5§.§package for if§;
   import alternativa.osgi.OSGi;
   import alternativa.protocol.ICodec;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.OptionalMap;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.types.Long;
   import flash.utils.ByteArray;
   import §function catch if§.§if package native§;
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.network.command.SpaceCommand;
   import platform.client.fp10.core.type.IGameObject;
   import platform.client.fp10.core.type.ISpace;
   import scpacker.networking.Network;
   
   public class §&!s§
   {
      private var protocol:IProtocol;
      
      private var protocolBuffer:ProtocolBuffer;
      
      private var §class for import§:Long;
      
      private var §+"N§:ICodec;
      
      private var §native var extends§:Long;
      
      private var §<K§:Long;
      
      private var §&"0§:ICodec;
      
      private var model:IModel;
      
      private var network:Network;
      
      public function §&!s§(param1:IModel)
      {
         this.§class for import§ = Long.getLong(1792558267,422618582);
         this.§native var extends§ = Long.getLong(763612380,736380393);
         this.§<K§ = Long.getLong(1605739608,-2116633576);
         super();
         this.model = param1;
         var _loc2_:ByteArray = new ByteArray();
         this.protocol = IProtocol(OSGi.getInstance().getService(IProtocol));
         this.network = Network(OSGi.getInstance().getService(Network));
         this.protocolBuffer = new ProtocolBuffer(_loc2_,_loc2_,new OptionalMap());
      }
      
      public function §,"r§(param1:§if package native§) : void
      {
         ByteArray(this.protocolBuffer.writer).position = 0;
         ByteArray(this.protocolBuffer.writer).length = 0;
         this.§+"N§.encode(this.protocolBuffer,param1);
         ByteArray(this.protocolBuffer.writer).position = 0;
         if(Model.object == null)
         {
            throw new Error("Execute method without model context.");
         }
         var _loc2_:SpaceCommand = new SpaceCommand(Model.object.id,this.§class for import§,this.protocolBuffer);
         var _loc3_:IGameObject = Model.object;
         var _loc4_:ISpace = _loc3_.space;
         _loc4_.commandSender.sendCommand(_loc2_);
         this.protocolBuffer.optionalMap.clear();
      }
      
      public function §@"O§() : void
      {
         this.network.send(new §'"M§());
      }
      
      public function §#_§(param1:§8$ §) : void
      {
         this.network.send(new §package for if§(param1.§dynamic const super§));
      }
   }
}

