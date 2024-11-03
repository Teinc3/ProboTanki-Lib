package Renamed292
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
   
   public class Renamed7402
   {
      private var protocol:IProtocol;
      
      private var protocolBuffer:ProtocolBuffer;
      
      private var Renamed7416:Long;
      
      private var Renamed7417:ICodec;
      
      private var model:IModel;
      
      public function Renamed7402(param1:IModel)
      {
         this.Renamed7416 = Long.getLong(1669375812,-973745790);
         super();
         this.model = param1;
         var _loc2_:ByteArray = new ByteArray();
         this.protocol = IProtocol(OSGi.getInstance().getService(IProtocol));
         this.protocolBuffer = new ProtocolBuffer(_loc2_,_loc2_,new OptionalMap());
         this.Renamed7417 = this.protocol.getCodec(new TypeCodecInfo(Long,false));
      }
      
      public function Renamed2487(param1:String) : void
      {
      }
   }
}

