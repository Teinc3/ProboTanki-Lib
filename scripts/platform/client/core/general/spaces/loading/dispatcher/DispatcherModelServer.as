package platform.client.core.general.spaces.loading.dispatcher
{
   import alternativa.osgi.OSGi;
   import alternativa.protocol.ICodec;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.OptionalMap;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.protocol.info.TypeCodecInfo;
   import alternativa.types.Long;
   import flash.utils.ByteArray;
   import Renamed406.Renamed4089;
   import platform.client.fp10.core.model.IModel;
   import scpacker.networking.Network;
   
   public class DispatcherModelServer
   {
      private var protocol:IProtocol;
      
      private var protocolBuffer:ProtocolBuffer;
      
      private var _dependeciesLoadedId:Long;
      
      private var _dependeciesLoaded_callbackIdCodec:ICodec;
      
      private var model:IModel;
      
      public function DispatcherModelServer(param1:IModel)
      {
         this._dependeciesLoadedId = Long.getLong(423004956,1791645716);
         super();
         this.model = param1;
         var _loc2_:ByteArray = new ByteArray();
         this.protocol = IProtocol(OSGi.getInstance().getService(IProtocol));
         this.protocolBuffer = new ProtocolBuffer(_loc2_,_loc2_,new OptionalMap());
         this._dependeciesLoaded_callbackIdCodec = this.protocol.getCodec(new TypeCodecInfo(int,false));
      }
      
      public function dependeciesLoaded(param1:int) : void
      {
         Network(OSGi.getInstance().getService(Network)).send(new Renamed4089(param1));
      }
   }
}

