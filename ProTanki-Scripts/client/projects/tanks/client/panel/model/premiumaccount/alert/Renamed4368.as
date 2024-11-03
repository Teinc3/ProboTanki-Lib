package projects.tanks.client.panel.model.premiumaccount.alert
{
   import alternativa.osgi.OSGi;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.OptionalMap;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.types.Long;
   import flash.utils.ByteArray;
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.network.command.SpaceCommand;
   import platform.client.fp10.core.type.IGameObject;
   import platform.client.fp10.core.type.ISpace;
   
   public class Renamed4368
   {
      private var protocol:IProtocol;
      
      private var protocolBuffer:ProtocolBuffer;
      
      private var Renamed4371:Long;
      
      private var Renamed4372:Long;
      
      private var Renamed4373:Long;
      
      private var model:IModel;
      
      public function Renamed4368(param1:IModel)
      {
         this.Renamed4371 = Long.getLong(560873126,327330396);
         this.Renamed4372 = Long.getLong(949918204,289867701);
         this.Renamed4373 = Long.getLong(1747841083,-1515647086);
         super();
         this.model = param1;
         var _loc2_:ByteArray = new ByteArray();
         this.protocol = IProtocol(OSGi.getInstance().getService(IProtocol));
         this.protocolBuffer = new ProtocolBuffer(_loc2_,_loc2_,new OptionalMap());
      }
      
      public function Renamed4374() : void
      {
         ByteArray(this.protocolBuffer.writer).position = 0;
         ByteArray(this.protocolBuffer.writer).length = 0;
         ByteArray(this.protocolBuffer.writer).position = 0;
         if(Model.object == null)
         {
            throw new Error("Execute method without model context.");
         }
         var _loc1_:SpaceCommand = new SpaceCommand(Model.object.id,this.Renamed4371,this.protocolBuffer);
         var _loc2_:IGameObject = Model.object;
         var _loc3_:ISpace = _loc2_.space;
         _loc3_.commandSender.sendCommand(_loc1_);
         this.protocolBuffer.optionalMap.clear();
      }
      
      public function Renamed4375() : void
      {
         ByteArray(this.protocolBuffer.writer).position = 0;
         ByteArray(this.protocolBuffer.writer).length = 0;
         ByteArray(this.protocolBuffer.writer).position = 0;
         if(Model.object == null)
         {
            throw new Error("Execute method without model context.");
         }
         var _loc1_:SpaceCommand = new SpaceCommand(Model.object.id,this.Renamed4372,this.protocolBuffer);
         var _loc2_:IGameObject = Model.object;
         var _loc3_:ISpace = _loc2_.space;
         _loc3_.commandSender.sendCommand(_loc1_);
         this.protocolBuffer.optionalMap.clear();
      }
      
      public function Renamed4376() : void
      {
         ByteArray(this.protocolBuffer.writer).position = 0;
         ByteArray(this.protocolBuffer.writer).length = 0;
         ByteArray(this.protocolBuffer.writer).position = 0;
         if(Model.object == null)
         {
            throw new Error("Execute method without model context.");
         }
         var _loc1_:SpaceCommand = new SpaceCommand(Model.object.id,this.Renamed4373,this.protocolBuffer);
         var _loc2_:IGameObject = Model.object;
         var _loc3_:ISpace = _loc2_.space;
         _loc3_.commandSender.sendCommand(_loc1_);
         this.protocolBuffer.optionalMap.clear();
      }
   }
}

