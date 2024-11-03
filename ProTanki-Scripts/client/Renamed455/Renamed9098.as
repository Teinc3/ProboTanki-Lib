package Renamed455
{
   import alternativa.osgi.OSGi;
   import alternativa.protocol.ICodec;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.OptionalMap;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.protocol.info.TypeCodecInfo;
   import alternativa.types.Long;
   import Renamed354.Renamed8126;
   import flash.utils.ByteArray;
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.network.command.SpaceCommand;
   import platform.client.fp10.core.type.IGameObject;
   import platform.client.fp10.core.type.ISpace;
   import scpacker.networking.Network;
   
   public class Renamed9098
   {
      private var protocol:IProtocol;
      
      private var protocolBuffer:ProtocolBuffer;
      
      private var Renamed9099:Long;
      
      private var Renamed9100:ICodec;
      
      private var Renamed9101:Long;
      
      private var Renamed9102:ICodec;
      
      private var model:IModel;
      
      public function Renamed9098(param1:IModel)
      {
         this.Renamed9099 = Long.getLong(0,300020043);
         this.Renamed9101 = Long.getLong(0,300020044);
         super();
         this.model = param1;
         var _loc2_:ByteArray = new ByteArray();
         this.protocol = IProtocol(OSGi.getInstance().getService(IProtocol));
         this.protocolBuffer = new ProtocolBuffer(_loc2_,_loc2_,new OptionalMap());
         this.Renamed9100 = this.protocol.getCodec(new TypeCodecInfo(String,false));
         this.Renamed9102 = this.protocol.getCodec(new TypeCodecInfo(String,false));
      }
      
      public function loginByHash(param1:String) : void
      {
         Network(OSGi.getInstance().getService(Network)).send(new Renamed8126(param1));
      }
      
      public function loginBySingleUseHash(param1:String) : void
      {
         ByteArray(this.protocolBuffer.writer).position = 0;
         ByteArray(this.protocolBuffer.writer).length = 0;
         this.Renamed9102.encode(this.protocolBuffer,param1);
         ByteArray(this.protocolBuffer.writer).position = 0;
         if(Model.object == null)
         {
            throw new Error("Execute method without model context.");
         }
         var _loc2_:SpaceCommand = new SpaceCommand(Model.object.id,this.Renamed9101,this.protocolBuffer);
         var _loc3_:IGameObject = Model.object;
         var _loc4_:ISpace = _loc3_.space;
         _loc4_.commandSender.sendCommand(_loc2_);
         this.protocolBuffer.optionalMap.clear();
      }
   }
}

