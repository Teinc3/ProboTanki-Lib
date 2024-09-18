package §6"N§
{
   import §;"?§.§#">§;
   import §`!b§.§,"h§;
   import §`!b§.§?"5§;
   import §`!b§.§throw catch return§;
   import alternativa.osgi.OSGi;
   import alternativa.protocol.ICodec;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.types.Long;
   import flash.utils.ByteArray;
   import platform.client.fp10.core.model.IModel;
   import scpacker.networking.Network;
   
   public class §[!"§
   {
      private var protocol:IProtocol;
      
      private var protocolBuffer:ProtocolBuffer;
      
      private var §use const while§:Long;
      
      private var §1#R§:ICodec;
      
      private var §&$"§:ICodec;
      
      private var §each package package§:ICodec;
      
      private var §override package each§:ICodec;
      
      private var §;"q§:ICodec;
      
      private var §native set import§:Long;
      
      private var §function catch use§:ICodec;
      
      private var §^"k§:Long;
      
      private var §for set break§:ICodec;
      
      private var model:IModel;
      
      private var network:Network;
      
      public function §[!"§(param1:IModel)
      {
         this.§use const while§ = Long.getLong(1226168606,1892142748);
         this.§native set import§ = Long.getLong(36271653,-1590968991);
         this.§^"k§ = Long.getLong(744810110,-807135961);
         super();
         this.model = param1;
         var _loc2_:ByteArray = new ByteArray();
         this.protocol = IProtocol(OSGi.getInstance().getService(IProtocol));
         this.network = Network(OSGi.getInstance().getService(Network));
      }
      
      public function §do set break§(param1:int, param2:Vector.<String>, param3:Vector.<int>, param4:Vector.<§#">§>, param5:Vector.<§#">§>) : void
      {
         this.network.send(new §,"h§(param1,param2,param3,param4,param5));
      }
      
      public function §function for include§(param1:int) : void
      {
         this.network.send(new §throw catch return§(param1));
      }
      
      public function §break catch else§(param1:int) : void
      {
         this.network.send(new §?"5§(param1));
      }
   }
}

