package projects.tanks.client.commons.models.layout
{
   import Renamed4257.Renamed4258;
   import Renamed4257.Renamed4259;
   import Renamed4257.Renamed4260;
   import Renamed4257.Renamed4261;
   import alternativa.osgi.OSGi;
   import alternativa.protocol.ICodec;
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
   import scpacker.networking.Network;
   
   public class Renamed4256
   {
      private var protocol:IProtocol;
      
      private var protocolBuffer:ProtocolBuffer;
      
      private var Renamed4262:Long;
      
      private var Renamed4263:ICodec;
      
      private var Renamed4264:Long;
      
      private var Renamed4265:Long;
      
      private var Renamed4266:Long;
      
      private var Renamed4267:Long;
      
      private var model:IModel;
      
      public function Renamed4256(param1:IModel)
      {
         this.Renamed4262 = Long.getLong(0,300070008);
         this.Renamed4264 = Long.getLong(0,300070009);
         this.Renamed4265 = Long.getLong(0,300070010);
         this.Renamed4266 = Long.getLong(0,300070011);
         this.Renamed4267 = Long.getLong(0,300070012);
         super();
         this.model = param1;
         var _loc2_:ByteArray = new ByteArray();
         this.protocol = IProtocol(OSGi.getInstance().getService(IProtocol));
         this.protocolBuffer = new ProtocolBuffer(_loc2_,_loc2_,new OptionalMap());
      }
      
      public function exitFromBattle(param1:LayoutState) : void
      {
         Network(OSGi.getInstance().getService(Network)).send(new Renamed4261(param1));
      }
      
      public function Renamed4268() : void
      {
         ByteArray(this.protocolBuffer.writer).position = 0;
         ByteArray(this.protocolBuffer.writer).length = 0;
         ByteArray(this.protocolBuffer.writer).position = 0;
         if(Model.object == null)
         {
            throw new Error("Execute method without model context.");
         }
         var _loc1_:SpaceCommand = new SpaceCommand(Model.object.id,this.Renamed4264,this.protocolBuffer);
         var _loc2_:IGameObject = Model.object;
         var _loc3_:ISpace = _loc2_.space;
         _loc3_.commandSender.sendCommand(_loc1_);
         this.protocolBuffer.optionalMap.clear();
      }
      
      public function switchBattleSelect() : void
      {
         Network(OSGi.getInstance().getService(Network)).send(new Renamed4259());
      }
      
      public function switchGarage() : void
      {
         Network(OSGi.getInstance().getService(Network)).send(new Renamed4258());
      }
      
      public function switchPayment() : void
      {
         Network(OSGi.getInstance().getService(Network)).send(new Renamed4260());
      }
   }
}

