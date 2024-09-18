package projects.tanks.client.panel.model.socialnetwork
{
   import Renamed490.Renamed4383;
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
   
   public class Renamed4377
   {
      private var protocol:IProtocol;
      
      private var protocolBuffer:ProtocolBuffer;
      
      private var Renamed4384:Long;
      
      private var Renamed4385:ICodec;
      
      private var model:IModel;
      
      public function Renamed4377(param1:IModel)
      {
         this.Renamed4384 = Long.getLong(0,300050043);
         super();
         this.model = param1;
         var _loc2_:ByteArray = new ByteArray();
         this.protocol = IProtocol(OSGi.getInstance().getService(IProtocol));
         this.protocolBuffer = new ProtocolBuffer(_loc2_,_loc2_,new OptionalMap());
         this.Renamed4385 = this.protocol.getCodec(new TypeCodecInfo(String,false));
      }
      
      public function Renamed2279(param1:String) : void
      {
         Network(OSGi.getInstance().getService(Network)).send(new Renamed4383(param1));
      }
   }
}

