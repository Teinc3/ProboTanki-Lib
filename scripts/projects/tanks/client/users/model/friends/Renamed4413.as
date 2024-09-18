package projects.tanks.client.users.model.friends
{
   import Renamed4426.Renamed4427;
   import Renamed4426.Renamed4428;
   import Renamed4426.Renamed4429;
   import Renamed4426.Renamed4430;
   import Renamed4426.Renamed4341;
   import Renamed4426.Renamed4431;
   import Renamed4426.Renamed4342;
   import alternativa.osgi.OSGi;
   import alternativa.protocol.ICodec;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.OptionalMap;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.protocol.info.TypeCodecInfo;
   import alternativa.types.Long;
   import flash.utils.ByteArray;
   import platform.client.fp10.core.model.IModel;
   import scpacker.networking.Network;
   
   public class Renamed4413
   {
      private var protocol:IProtocol;
      
      private var protocolBuffer:ProtocolBuffer;
      
      private var Renamed4344:Long;
      
      private var Renamed4432:ICodec;
      
      private var Renamed4433:Long;
      
      private var Renamed4434:ICodec;
      
      private var Renamed4435:Long;
      
      private var Renamed4436:ICodec;
      
      private var Renamed4437:Long;
      
      private var Renamed4438:ICodec;
      
      private var Renamed4439:Long;
      
      private var Renamed4440:ICodec;
      
      private var Renamed4349:Long;
      
      private var Renamed4441:ICodec;
      
      private var Renamed4442:Long;
      
      private var Renamed4443:Long;
      
      private var Renamed4444:ICodec;
      
      private var model:IModel;
      
      private var network:Network;
      
      public function Renamed4413(param1:IModel)
      {
         this.Renamed4344 = Long.getLong(615300036,-941734513);
         this.Renamed4433 = Long.getLong(1307353856,-1978331782);
         this.Renamed4435 = Long.getLong(1402151501,-2115283743);
         this.Renamed4437 = Long.getLong(1152146944,316147596);
         this.Renamed4439 = Long.getLong(2058361593,-1495639969);
         this.Renamed4349 = Long.getLong(615300036,-452983770);
         this.Renamed4442 = Long.getLong(517020203,52182117);
         this.Renamed4443 = Long.getLong(615300036,-452616435);
         super();
         this.model = param1;
         var _loc2_:ByteArray = new ByteArray();
         this.protocol = IProtocol(OSGi.getInstance().getService(IProtocol));
         this.network = Network(OSGi.getInstance().getService(Network));
         this.protocolBuffer = new ProtocolBuffer(_loc2_,_loc2_,new OptionalMap());
         this.Renamed4432 = this.protocol.getCodec(new TypeCodecInfo(Long,false));
         this.Renamed4434 = this.protocol.getCodec(new TypeCodecInfo(Long,false));
         this.Renamed4436 = this.protocol.getCodec(new TypeCodecInfo(String,false));
         this.Renamed4438 = this.protocol.getCodec(new TypeCodecInfo(Long,false));
         this.Renamed4440 = this.protocol.getCodec(new TypeCodecInfo(String,false));
         this.Renamed4441 = this.protocol.getCodec(new TypeCodecInfo(Long,false));
         this.Renamed4444 = this.protocol.getCodec(new TypeCodecInfo(Long,false));
      }
      
      public function accept(param1:String) : void
      {
         this.network.send(new Renamed4342(param1));
      }
      
      public function add(param1:String) : void
      {
         this.network.send(new Renamed4430(param1));
      }
      
      public function addByUid(param1:String) : void
      {
         this.network.send(new Renamed4430(param1));
      }
      
      public function breakItOff(param1:String) : void
      {
         this.network.send(new Renamed4431(param1));
      }
      
      public function Renamed822(param1:String) : void
      {
         this.network.send(new Renamed4428(param1));
      }
      
      public function reject(param1:String) : void
      {
         this.network.send(new Renamed4341(param1));
      }
      
      public function Renamed4445() : void
      {
         this.network.send(new Renamed4429());
      }
      
      public function revoke(param1:String) : void
      {
         this.network.send(new Renamed4427(param1));
      }
   }
}

