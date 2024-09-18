package projects.tanks.client.panel.model.battleinvite
{
   import alternativa.osgi.OSGi;
   import alternativa.protocol.ICodec;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.OptionalMap;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.protocol.info.TypeCodecInfo;
   import alternativa.types.Long;
   import Renamed323.Renamed4341;
   import Renamed323.Renamed4342;
   import Renamed323.Renamed4343;
   import flash.utils.ByteArray;
   import platform.client.fp10.core.model.IModel;
   import scpacker.networking.Network;
   
   public class ProtectionContexts3
   {
      private var protocol:IProtocol;
      
      private var protocolBuffer:ProtocolBuffer;
      
      private var Renamed4344:Long;
      
      private var Renamed4345:ICodec;
      
      private var Renamed4346:Long;
      
      private var Renamed4347:ICodec;
      
      private var Renamed4348:ICodec;
      
      private var Renamed4349:Long;
      
      private var Renamed4350:ICodec;
      
      private var model:IModel;
      
      private var network:Network;
      
      public function ProtectionContexts3(param1:IModel)
      {
         this.Renamed4344 = Long.getLong(0,300050006);
         this.Renamed4346 = Long.getLong(0,300050007);
         this.Renamed4349 = Long.getLong(0,300050008);
         super();
         this.model = param1;
         var _loc2_:ByteArray = new ByteArray();
         this.protocol = IProtocol(OSGi.getInstance().getService(IProtocol));
         this.network = Network(OSGi.getInstance().getService(Network));
         this.protocolBuffer = new ProtocolBuffer(_loc2_,_loc2_,new OptionalMap());
         this.Renamed4345 = this.protocol.getCodec(new TypeCodecInfo(Long,false));
         this.Renamed4347 = this.protocol.getCodec(new TypeCodecInfo(Long,false));
         this.Renamed4348 = this.protocol.getCodec(new TypeCodecInfo(Long,false));
         this.Renamed4350 = this.protocol.getCodec(new TypeCodecInfo(Long,false));
      }
      
      public function accept(param1:String) : void
      {
         this.network.send(new Renamed4342(param1));
      }
      
      public function invite(param1:String, param2:String) : void
      {
         this.network.send(new Renamed4343(param1,param2));
      }
      
      public function reject(param1:String) : void
      {
         this.network.send(new Renamed4341(param1));
      }
   }
}

