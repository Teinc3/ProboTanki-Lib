package Renamed4829
{
   import Renamed300.Renamed6196;
   import Renamed300.Renamed6197;
   import Renamed300.Renamed6198;
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
   
   public class Renamed6199
   {
      private var protocol:IProtocol;
      
      private var protocolBuffer:ProtocolBuffer;
      
      private var Renamed6200:Long;
      
      private var Renamed6201:ICodec;
      
      private var Renamed6202:ICodec;
      
      private var Renamed6203:ICodec;
      
      private var Renamed6204:Long;
      
      private var Renamed6205:ICodec;
      
      private var Renamed6206:Long;
      
      private var Renamed6207:ICodec;
      
      private var Renamed6208:Long;
      
      private var Renamed6209:ICodec;
      
      private var model:IModel;
      
      public function Renamed6199(param1:IModel)
      {
         this.Renamed6200 = Long.getLong(0,300020058);
         this.Renamed6204 = Long.getLong(0,300020059);
         this.Renamed6206 = Long.getLong(0,300020060);
         this.Renamed6208 = Long.getLong(0,300020061);
         super();
         this.model = param1;
         var _loc2_:ByteArray = new ByteArray();
         this.protocol = IProtocol(OSGi.getInstance().getService(IProtocol));
         this.protocolBuffer = new ProtocolBuffer(_loc2_,_loc2_,new OptionalMap());
         this.Renamed6201 = this.protocol.getCodec(new TypeCodecInfo(String,false));
         this.Renamed6202 = this.protocol.getCodec(new TypeCodecInfo(String,false));
         this.Renamed6203 = this.protocol.getCodec(new TypeCodecInfo(String,false));
         this.Renamed6205 = this.protocol.getCodec(new TypeCodecInfo(String,false));
         this.Renamed6207 = this.protocol.getCodec(new TypeCodecInfo(String,false));
         this.Renamed6209 = this.protocol.getCodec(new TypeCodecInfo(String,false));
      }
      
      public function changePasswordAndEmail(param1:String, param2:String, param3:String) : void
      {
         Network(OSGi.getInstance().getService(Network)).send(new Renamed6198(param2,param3));
      }
      
      public function Renamed6210(param1:String) : void
      {
         Network(OSGi.getInstance().getService(Network)).send(new Renamed6197(param1));
      }
      
      public function Renamed6211(param1:String) : void
      {
         ByteArray(this.protocolBuffer.writer).position = 0;
         ByteArray(this.protocolBuffer.writer).length = 0;
         this.Renamed6207.encode(this.protocolBuffer,param1);
         ByteArray(this.protocolBuffer.writer).position = 0;
         if(Model.object == null)
         {
            throw new Error("Execute method without model context.");
         }
         var _loc2_:SpaceCommand = new SpaceCommand(Model.object.id,this.Renamed6206,this.protocolBuffer);
         var _loc3_:IGameObject = Model.object;
         var _loc4_:ISpace = _loc3_.space;
         _loc4_.commandSender.sendCommand(_loc2_);
         this.protocolBuffer.optionalMap.clear();
      }
      
      public function sendUsersRestorePasswordLink(param1:String) : void
      {
         Network(OSGi.getInstance().getService(Network)).send(new Renamed6196(param1));
      }
   }
}

