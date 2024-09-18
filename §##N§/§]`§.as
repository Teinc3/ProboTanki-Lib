package §##N§
{
   import §>"O§.§function set§;
   import alternativa.osgi.OSGi;
   import alternativa.protocol.ICodec;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.OptionalMap;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.protocol.info.TypeCodecInfo;
   import alternativa.types.Long;
   import flash.utils.ByteArray;
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.type.IGameObject;
   import scpacker.networking.Network;
   
   public class §]`§
   {
      private var protocol:IProtocol;
      
      private var protocolBuffer:ProtocolBuffer;
      
      private var §if const get§:Long;
      
      private var §6^§:ICodec;
      
      private var § "R§:ICodec;
      
      private var §&§:ICodec;
      
      private var §^!k§:ICodec;
      
      private var model:IModel;
      
      private var network:Network;
      
      public function §]`§(param1:IModel)
      {
         this.§if const get§ = Long.getLong(169296918,-2003348677);
         super();
         this.model = param1;
         var _loc2_:ByteArray = new ByteArray();
         this.protocol = IProtocol(OSGi.getInstance().getService(IProtocol));
         this.network = Network(OSGi.getInstance().getService(Network));
         this.protocolBuffer = new ProtocolBuffer(_loc2_,_loc2_,new OptionalMap());
         this.§6^§ = this.protocol.getCodec(new TypeCodecInfo(String,false));
         this.§ "R§ = this.protocol.getCodec(new TypeCodecInfo(IGameObject,false));
         this.§&§ = this.protocol.getCodec(new TypeCodecInfo(String,false));
         this.§^!k§ = this.protocol.getCodec(new TypeCodecInfo(int,false));
      }
      
      public function § #1§(param1:String, param2:IGameObject, param3:String, param4:int) : void
      {
         this.network.send(new §function set§(param1,param2.name,param3,param4));
      }
   }
}

