package Renamed420
{
   import alternativa.osgi.OSGi;
   import alternativa.protocol.ICodec;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.OptionalMap;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.protocol.info.CollectionCodecInfo;
   import alternativa.protocol.info.TypeCodecInfo;
   import alternativa.types.Long;
   import Renamed363.Renamed8184;
   import Renamed363.Renamed8199;
   import flash.utils.ByteArray;
   import platform.client.fp10.core.model.IModel;
   import scpacker.networking.Network;
   
   public class Renamed8716
   {
      private var protocol:IProtocol;
      
      private var protocolBuffer:ProtocolBuffer;
      
      private var Renamed8725:Long;
      
      private var Renamed8726:ICodec;
      
      private var Renamed8727:ICodec;
      
      private var Renamed8728:Long;
      
      private var model:IModel;
      
      private var network:Network;
      
      public function Renamed8716(param1:IModel)
      {
         this.Renamed8725 = Long.getLong(0,300050027);
         this.Renamed8728 = Long.getLong(0,300050028);
         super();
         this.model = param1;
         var _loc2_:ByteArray = new ByteArray();
         this.protocol = IProtocol(OSGi.getInstance().getService(IProtocol));
         this.network = Network(OSGi.getInstance().getService(Network));
         this.protocolBuffer = new ProtocolBuffer(_loc2_,_loc2_,new OptionalMap());
         this.Renamed8726 = this.protocol.getCodec(new CollectionCodecInfo(new TypeCodecInfo(String,false),false,1));
         this.Renamed8727 = this.protocol.getCodec(new TypeCodecInfo(String,false));
      }
      
      public function Renamed7396(param1:Vector.<String>, param2:String) : void
      {
         this.network.send(new Renamed8199(param1,param2));
      }
      
      public function Renamed7397() : void
      {
         this.network.send(new Renamed8184());
      }
   }
}

