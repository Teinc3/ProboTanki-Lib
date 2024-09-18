package § "u§
{
   import §7#n§.§""@§;
   import §7#n§.§+§;
   import §7#n§.§=G§;
   import §;"?§.§#">§;
   import alternativa.osgi.OSGi;
   import alternativa.protocol.ICodec;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.types.Long;
   import flash.utils.ByteArray;
   import platform.client.fp10.core.model.IModel;
   import scpacker.networking.Network;
   
   public class §!#Z§
   {
      private var protocol:IProtocol;
      
      private var protocolBuffer:ProtocolBuffer;
      
      private var §'"W§:Long;
      
      private var §throw var function§:ICodec;
      
      private var §break set else§:ICodec;
      
      private var §7$"§:ICodec;
      
      private var §set for do§:ICodec;
      
      private var §return const throw§:ICodec;
      
      private var §2[§:ICodec;
      
      private var §if package class§:ICodec;
      
      private var §switch const case§:Long;
      
      private var §0"S§:ICodec;
      
      private var §function var override§:Long;
      
      private var §throw catch const§:ICodec;
      
      private var model:IModel;
      
      private var network:Network;
      
      public function §!#Z§(param1:IModel)
      {
         this.§'"W§ = Long.getLong(448278927,-679337769);
         this.§switch const case§ = Long.getLong(1791455660,457007003);
         this.§function var override§ = Long.getLong(747256245,1216344676);
         super();
         this.model = param1;
         var _loc2_:ByteArray = new ByteArray();
         this.protocol = IProtocol(OSGi.getInstance().getService(IProtocol));
         this.network = Network(OSGi.getInstance().getService(Network));
      }
      
      public function §super var throw§(param1:int, param2:§#">§, param3:Vector.<String>, param4:Vector.<§#">§>, param5:Vector.<int>, param6:Vector.<§#">§>, param7:Vector.<§#">§>) : void
      {
         this.network.send(new §+#2§(param1,param2,param3,param4,param5,param6,param7));
      }
      
      public function §[r§(param1:int) : void
      {
         this.network.send(new §=G§(param1));
      }
      
      public function §0t§(param1:int) : void
      {
         this.network.send(new §""@§(param1));
      }
   }
}

