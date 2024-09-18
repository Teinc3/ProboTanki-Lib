package §set break§
{
   import §;"?§.§#">§;
   import alternativa.object.ClientObject;
   import alternativa.osgi.OSGi;
   import alternativa.protocol.ICodec;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.types.Long;
   import flash.utils.ByteArray;
   import §native const true§.§ !y§;
   import §native const true§.§&#!§;
   import §native const true§.§5#M§;
   import §native const true§.§case const var§;
   import platform.client.fp10.core.model.IModel;
   import scpacker.networking.Network;
   
   public class §=!0§
   {
      private var protocol:IProtocol;
      
      private var protocolBuffer:ProtocolBuffer;
      
      private var §4#x§:Long;
      
      private var §0#7§:ICodec;
      
      private var §continue set for§:Long;
      
      private var §0#A§:ICodec;
      
      private var §#!W§:ICodec;
      
      private var §<!l§:ICodec;
      
      private var §;!l§:ICodec;
      
      private var §%#5§:Long;
      
      private var §7"c§:ICodec;
      
      private var §switch package break§:Long;
      
      private var §import var static§:ICodec;
      
      private var §false const class§:ICodec;
      
      private var §!"j§:ICodec;
      
      private var §4?§:ICodec;
      
      private var model:IModel;
      
      private var network:Network;
      
      public function §=!0§(param1:IModel)
      {
         this.§4#x§ = Long.getLong(315477850,74416950);
         this.§continue set for§ = Long.getLong(724350021,-1874612855);
         this.§%#5§ = Long.getLong(2132283949,89958307);
         this.§switch package break§ = Long.getLong(315880994,956762724);
         super();
         this.model = param1;
         var _loc2_:ByteArray = new ByteArray();
         this.protocol = IProtocol(OSGi.getInstance().getService(IProtocol));
         this.network = Network(OSGi.getInstance().getService(Network));
      }
      
      public function §implements package for§(param1:int) : void
      {
         this.network.send(new §&#!§(param1));
      }
      
      public function §return const do§(param1:int, param2:ClientObject, param3:int, param4:§#">§) : void
      {
         this.network.send(new § !y§(param1,param2.id,param3,param4));
      }
      
      public function §5#v§(param1:int) : void
      {
         this.network.send(new §case const var§(param1));
      }
      
      public function §'3§(param1:int, param2:int, param3:§#">§, param4:§#">§) : void
      {
         this.network.send(new §5#M§(param1,param2,param3,param4));
      }
   }
}

