package projects.tanks.client.battlefield.models.battle.battlefield
{
   import Renamed2402.Renamed4140;
   import Renamed2402.Renamed4141;
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
   
   public class Renamed4142
   {
      private var protocol:IProtocol;
      
      private var protocolBuffer:ProtocolBuffer;
      
      private var Renamed4143:Long;
      
      private var Renamed4144:ICodec;
      
      private var Renamed4145:Long;
      
      private var Renamed4146:ICodec;
      
      private var Renamed4147:Long;
      
      private var Renamed4148:ICodec;
      
      private var Renamed4149:ICodec;
      
      private var Renamed4150:Long;
      
      private var model:IModel;
      
      private var network:Network;
      
      public function Renamed4142(param1:IModel)
      {
         this.Renamed4143 = Long.getLong(312624829,1518890877);
         this.Renamed4145 = Long.getLong(312624829,1518890663);
         this.Renamed4147 = Long.getLong(1789749753,1049490765);
         this.Renamed4150 = Long.getLong(312624829,1518890261);
         super();
         this.model = param1;
         var _loc2_:ByteArray = new ByteArray();
         this.protocol = IProtocol(OSGi.getInstance().getService(IProtocol));
         this.network = Network(OSGi.getInstance().getService(Network));
         this.protocolBuffer = new ProtocolBuffer(_loc2_,_loc2_,new OptionalMap());
         this.Renamed4144 = this.protocol.getCodec(new CollectionCodecInfo(new TypeCodecInfo(int,false),false,1));
         this.Renamed4146 = this.protocol.getCodec(new TypeCodecInfo(int,false));
         this.Renamed4149 = this.protocol.getCodec(new TypeCodecInfo(Float,false));
      }
      
      public function Renamed2517(param1:Vector.<int>) : void
      {
         this.network.send(new Renamed4141(param1));
      }
      
      public function Renamed2519(param1:int) : void
      {
         this.network.send(new Renamed4140(param1));
      }
      
      public function Renamed4151() : void
      {
         ByteArray(this.protocolBuffer.writer).position = 0;
         ByteArray(this.protocolBuffer.writer).length = 0;
         ByteArray(this.protocolBuffer.writer).position = 0;
         if(Model.object == null)
         {
            throw new Error("Execute method without model context.");
         }
         var _loc1_:SpaceCommand = new SpaceCommand(Model.object.id,this.Renamed4150,this.protocolBuffer);
         var _loc2_:IGameObject = Model.object;
         var _loc3_:ISpace = _loc2_.space;
         _loc3_.commandSender.sendCommand(_loc1_);
         this.protocolBuffer.optionalMap.clear();
      }
   }
}

