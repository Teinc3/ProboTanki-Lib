package Renamed386
{
   import Renamed8372.Renamed8373;
   import Renamed8372.Renamed8374;
   import alternativa.osgi.OSGi;
   import alternativa.protocol.ICodec;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.OptionalMap;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.protocol.info.CollectionCodecInfo;
   import alternativa.protocol.info.TypeCodecInfo;
   import alternativa.types.Long;
   import flash.utils.ByteArray;
   import platform.client.fp10.core.model.IModel;
   import scpacker.networking.Network;
   
   public class Renamed8375
   {
      private var protocol:IProtocol;
      
      private var protocolBuffer:ProtocolBuffer;
      
      private var Renamed8376:Long;
      
      private var Renamed8377:ICodec;
      
      private var Renamed8378:Long;
      
      private var Renamed8379:ICodec;
      
      private var model:IModel;
      
      public function Renamed8375(param1:IModel)
      {
         this.Renamed8376 = Long.getLong(0,300150005);
         this.Renamed8378 = Long.getLong(0,300150006);
         super();
         this.model = param1;
         var _loc2_:ByteArray = new ByteArray();
         this.protocol = IProtocol(OSGi.getInstance().getService(IProtocol));
         this.protocolBuffer = new ProtocolBuffer(_loc2_,_loc2_,new OptionalMap());
         this.Renamed8377 = this.protocol.getCodec(new TypeCodecInfo(Long,false));
         this.Renamed8379 = this.protocol.getCodec(new CollectionCodecInfo(new TypeCodecInfo(Long,false),false,1));
      }
      
      public function subscribe(param1:String) : void
      {
         Network(OSGi.getInstance().getService(Network)).send(new Renamed8374(param1));
      }
      
      public function Renamed4503(param1:Vector.<String>) : void
      {
         Network(OSGi.getInstance().getService(Network)).send(new Renamed8373(param1));
      }
   }
}

