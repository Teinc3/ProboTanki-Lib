package Renamed346
{
   import alternativa.osgi.OSGi;
   import alternativa.protocol.ICodec;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.OptionalMap;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.protocol.info.TypeCodecInfo;
   import alternativa.types.Long;
   import Renamed321.Renamed7720;
   import flash.utils.ByteArray;
   import platform.client.fp10.core.model.IModel;
   import scpacker.networking.Network;
   
   public class Renamed8051
   {
      private var protocol:IProtocol;
      
      private var protocolBuffer:ProtocolBuffer;
      
      private var Renamed8052:Long;
      
      private var Renamed8053:ICodec;
      
      private var model:IModel;
      
      public function Renamed8051(param1:IModel)
      {
         this.Renamed8052 = Long.getLong(0,300020046);
         super();
         this.model = param1;
         var _loc2_:ByteArray = new ByteArray();
         this.protocol = IProtocol(OSGi.getInstance().getService(IProtocol));
         this.protocolBuffer = new ProtocolBuffer(_loc2_,_loc2_,new OptionalMap());
         this.Renamed8053 = this.protocol.getCodec(new TypeCodecInfo(String,false));
      }
      
      public function Renamed7702(param1:String) : void
      {
         Network(OSGi.getInstance().getService(Network)).send(new Renamed7720(param1));
      }
   }
}

