package projects.tanks.client.panel.model.dailyquest
{
   import Renamed284.Renamed4352;
   import Renamed284.Renamed4353;
   import Renamed284.Renamed4354;
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
   
   public class Renamed4355
   {
      private var protocol:IProtocol;
      
      private var protocolBuffer:ProtocolBuffer;
      
      private var Renamed4356:Long;
      
      private var Renamed4357:ICodec;
      
      private var Renamed4358:ICodec;
      
      private var Renamed4359:Long;
      
      private var Renamed4360:ICodec;
      
      private var Renamed4361:Long;
      
      private var Renamed4362:ICodec;
      
      private var model:IModel;
      
      public function Renamed4355(param1:IModel)
      {
         this.Renamed4356 = Long.getLong(721193585,-108838556);
         this.Renamed4359 = Long.getLong(898481927,1112991605);
         this.Renamed4361 = Long.getLong(663591737,-831307794);
         super();
         this.model = param1;
         var _loc2_:ByteArray = new ByteArray();
         this.protocol = IProtocol(OSGi.getInstance().getService(IProtocol));
         this.protocolBuffer = new ProtocolBuffer(_loc2_,_loc2_,new OptionalMap());
         this.Renamed4357 = this.protocol.getCodec(new TypeCodecInfo(Long,false));
         this.Renamed4358 = this.protocol.getCodec(new TypeCodecInfo(int,false));
         this.Renamed4360 = this.protocol.getCodec(new TypeCodecInfo(Long,false));
         this.Renamed4362 = this.protocol.getCodec(new TypeCodecInfo(Long,false));
      }
      
      public function Renamed4363(param1:Long, param2:int) : void
      {
         Network(OSGi.getInstance().getService(Network)).send(new Renamed4354(param1.low));
      }
      
      public function Renamed4364(param1:Long) : void
      {
         Network(OSGi.getInstance().getService(Network)).send(new Renamed4352(param1.low));
      }
      
      public function takePrize(param1:Long) : void
      {
         Network(OSGi.getInstance().getService(Network)).send(new Renamed4353(param1.low));
      }
   }
}

