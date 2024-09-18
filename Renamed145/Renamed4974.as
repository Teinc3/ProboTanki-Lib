package Renamed145
{
   import Renamed4971.Renamed4972;
   import Renamed4971.Renamed4973;
   import alternativa.osgi.OSGi;
   import alternativa.protocol.ICodec;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.OptionalMap;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.types.Long;
   import flash.utils.ByteArray;
   import Renamed374.Renamed2180;
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.network.command.SpaceCommand;
   import platform.client.fp10.core.type.IGameObject;
   import platform.client.fp10.core.type.ISpace;
   import scpacker.networking.Network;
   
   public class Renamed4974
   {
      private var protocol:IProtocol;
      
      private var protocolBuffer:ProtocolBuffer;
      
      private var Renamed4975:Long;
      
      private var Renamed4976:ICodec;
      
      private var Renamed4977:Long;
      
      private var Renamed4978:Long;
      
      private var Renamed4979:ICodec;
      
      private var model:IModel;
      
      private var network:Network;
      
      public function Renamed4974(param1:IModel)
      {
         this.Renamed4975 = Long.getLong(1792558267,422618582);
         this.Renamed4977 = Long.getLong(763612380,736380393);
         this.Renamed4978 = Long.getLong(1605739608,-2116633576);
         super();
         this.model = param1;
         var _loc2_:ByteArray = new ByteArray();
         this.protocol = IProtocol(OSGi.getInstance().getService(IProtocol));
         this.network = Network(OSGi.getInstance().getService(Network));
         this.protocolBuffer = new ProtocolBuffer(_loc2_,_loc2_,new OptionalMap());
      }
      
      public function Renamed4980(param1:Renamed2180) : void
      {
         ByteArray(this.protocolBuffer.writer).position = 0;
         ByteArray(this.protocolBuffer.writer).length = 0;
         this.Renamed4976.encode(this.protocolBuffer,param1);
         ByteArray(this.protocolBuffer.writer).position = 0;
         if(Model.object == null)
         {
            throw new Error("Execute method without model context.");
         }
         var _loc2_:SpaceCommand = new SpaceCommand(Model.object.id,this.Renamed4975,this.protocolBuffer);
         var _loc3_:IGameObject = Model.object;
         var _loc4_:ISpace = _loc3_.space;
         _loc4_.commandSender.sendCommand(_loc2_);
         this.protocolBuffer.optionalMap.clear();
      }
      
      public function Renamed2208() : void
      {
         this.network.send(new Renamed4972());
      }
      
      public function Renamed2207(param1:Renamed2176) : void
      {
         this.network.send(new Renamed4973(param1.Renamed2206));
      }
   }
}

