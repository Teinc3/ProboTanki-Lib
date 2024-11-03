package Renamed245
{
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
   import Renamed425.Renamed6627;
   import Renamed425.Renamed6628;
   import Renamed425.Renamed6629;
   import Renamed425.Renamed6630;
   import Renamed425.Renamed6631;
   import Renamed425.Renamed6632;
   
   public class Renamed6633
   {
      private var protocol:IProtocol;
      
      private var protocolBuffer:ProtocolBuffer;
      
      private var Renamed6634:Long;
      
      private var Renamed6635:Long;
      
      private var Renamed6636:ICodec;
      
      private var Renamed6637:Long;
      
      private var Renamed6638:ICodec;
      
      private var model:IModel;
      
      public function Renamed6633(param1:IModel)
      {
         this.Renamed6634 = Long.getLong(0,300050054);
         this.Renamed6635 = Long.getLong(0,300050055);
         this.Renamed6637 = Long.getLong(0,300050056);
         super();
         this.model = param1;
         var _loc2_:ByteArray = new ByteArray();
         this.protocol = IProtocol(OSGi.getInstance().getService(IProtocol));
         this.protocolBuffer = new ProtocolBuffer(_loc2_,_loc2_,new OptionalMap());
         this.Renamed6636 = this.protocol.getCodec(new TypeCodecInfo(String,false));
         this.Renamed6638 = this.protocol.getCodec(new TypeCodecInfo(String,false));
      }
      
      public function Renamed2295(param1:String) : void
      {
         Network(OSGi.getInstance().getService(Network)).send(new Renamed6627(param1));
      }
      
      public function Renamed2294() : void
      {
         Network(OSGi.getInstance().getService(Network)).send(new Renamed6639());
      }
      
      public function Renamed2293() : void
      {
         Network(OSGi.getInstance().getService(Network)).send(new Renamed6629());
      }
      
      public function Renamed2204(param1:String) : void
      {
         Network(OSGi.getInstance().getService(Network)).send(new Renamed6632(param1));
      }
      
      public function Renamed2292(param1:String) : void
      {
         Network(OSGi.getInstance().getService(Network)).send(new Renamed6631(param1));
      }
      
      public function Renamed2182(param1:String, param2:String) : void
      {
         Network(OSGi.getInstance().getService(Network)).send(new Renamed6630(param1,param2));
      }
   }
}

