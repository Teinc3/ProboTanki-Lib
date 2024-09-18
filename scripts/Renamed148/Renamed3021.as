package Renamed148
{
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
   import Renamed418.Renamed5028;
   import Renamed418.Renamed5029;
   import Renamed418.Renamed5030;
   import Renamed418.Renamed5031;
   import Renamed418.Renamed5032;
   import Renamed418.Renamed5033;
   import Renamed418.Renamed5034;
   import Renamed461.Renamed2772;
   import Renamed461.Renamed2773;
   
   public class Renamed3021
   {
      private var protocol:IProtocol;
      
      private var protocolBuffer:ProtocolBuffer;
      
      private var Renamed5035:Long;
      
      private var Renamed5036:Long;
      
      private var Renamed5037:ICodec;
      
      private var Renamed5038:ICodec;
      
      private var Renamed5039:ICodec;
      
      private var Renamed5040:ICodec;
      
      private var Renamed5041:Long;
      
      private var Renamed5042:ICodec;
      
      private var Renamed5043:Long;
      
      private var Renamed5044:ICodec;
      
      private var Renamed5045:ICodec;
      
      private var Renamed5046:ICodec;
      
      private var Renamed5047:Long;
      
      private var Renamed5048:ICodec;
      
      private var Renamed5049:ICodec;
      
      private var Renamed5050:ICodec;
      
      private var Renamed5051:Long;
      
      private var Renamed5052:ICodec;
      
      private var Renamed5053:ICodec;
      
      private var Renamed5054:ICodec;
      
      private var model:IModel;
      
      private var network:Network;
      
      public function Renamed3021(param1:IModel)
      {
         this.Renamed5035 = Long.getLong(674088239,-466180297);
         this.Renamed5036 = Long.getLong(1469435049,418614378);
         this.Renamed5041 = Long.getLong(27305946,689085087);
         this.Renamed5043 = Long.getLong(2114337908,577714981);
         this.Renamed5047 = Long.getLong(1028282615,1943158798);
         this.Renamed5051 = Long.getLong(785096439,-1657218933);
         super();
         this.model = param1;
         var _loc2_:ByteArray = new ByteArray();
         this.network = Network(OSGi.getInstance().getService(Network));
         this.protocol = IProtocol(OSGi.getInstance().getService(IProtocol));
         this.protocolBuffer = new ProtocolBuffer(_loc2_,_loc2_,new OptionalMap());
      }
      
      public function Renamed5055() : void
      {
         ByteArray(this.protocolBuffer.writer).position = 0;
         ByteArray(this.protocolBuffer.writer).length = 0;
         ByteArray(this.protocolBuffer.writer).position = 0;
         if(Model.object == null)
         {
            throw new Error("Execute method without model context.");
         }
         var _loc1_:SpaceCommand = new SpaceCommand(Model.object.id,this.Renamed5035,this.protocolBuffer);
         var _loc2_:IGameObject = Model.object;
         var _loc3_:ISpace = _loc2_.space;
         _loc3_.commandSender.sendCommand(_loc1_);
         this.protocolBuffer.optionalMap.clear();
      }
      
      public function Renamed2849() : void
      {
         this.network.send(new Renamed5033());
      }
      
      public function Renamed2934(param1:int, param2:int, param3:Renamed2772, param4:Number) : void
      {
         this.network.send(new Renamed5034(param1,param2,param3,param4));
      }
      
      public function Renamed5056(param1:Number) : void
      {
         ByteArray(this.protocolBuffer.writer).position = 0;
         ByteArray(this.protocolBuffer.writer).length = 0;
         this.Renamed5042.encode(this.protocolBuffer,param1);
         ByteArray(this.protocolBuffer.writer).position = 0;
         if(Model.object == null)
         {
            throw new Error("Execute method without model context.");
         }
         var _loc2_:SpaceCommand = new SpaceCommand(Model.object.id,this.Renamed5041,this.protocolBuffer);
         var _loc3_:IGameObject = Model.object;
         var _loc4_:ISpace = _loc3_.space;
         _loc4_.commandSender.sendCommand(_loc2_);
         this.protocolBuffer.optionalMap.clear();
      }
      
      public function moveCommand(param1:int, param2:int, param3:Renamed2772) : void
      {
         this.network.send(new Renamed5028(param1,param2,param3));
      }
      
      public function Renamed2940(param1:int, param2:int, param3:int) : void
      {
         this.network.send(new Renamed5030(param1,param2,param3));
      }
      
      public function rotateTurretCommand(param1:int, param2:Renamed2773, param3:int) : void
      {
         this.network.send(new Renamed5029(param1,param2,param3));
      }
      
      public function setReadyToPlace() : void
      {
         this.network.send(new Renamed5031());
      }
      
      public function Renamed3023() : void
      {
         this.network.send(new Renamed5032());
      }
   }
}

