package §use var final§
{
   import §;"?§.§#">§;
   import alternativa.object.ClientObject;
   import alternativa.osgi.OSGi;
   import alternativa.protocol.ICodec;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.types.Long;
   import flash.utils.ByteArray;
   import §import catch static§.§+§;
   import §import catch static§.§=G§;
   import §import catch static§.§`"t§;
   import §import catch static§.§function const extends§;
   import platform.client.fp10.core.model.IModel;
   import scpacker.networking.Network;
   
   public class §break for include§
   {
      private var protocol:IProtocol;
      
      private var protocolBuffer:ProtocolBuffer;
      
      private var §'"W§:Long;
      
      private var §throw var function§:ICodec;
      
      private var §[X§:ICodec;
      
      private var §each package final§:ICodec;
      
      private var §return var in§:ICodec;
      
      private var §+"v§:ICodec;
      
      private var §switch const case§:Long;
      
      private var §0"S§:ICodec;
      
      private var §class var class§:Long;
      
      private var §static for default§:ICodec;
      
      private var §try var get§:ICodec;
      
      private var §switch var throw§:ICodec;
      
      private var §@!R§:Long;
      
      private var §+!0§:ICodec;
      
      private var §throw for get§:ICodec;
      
      private var §null var with§:ICodec;
      
      private var §="e§:ICodec;
      
      private var §set var set§:ICodec;
      
      private var model:IModel;
      
      private var network:Network;
      
      public function §break for include§(param1:IModel)
      {
         this.§'"W§ = Long.getLong(1356868511,460931703);
         this.§switch const case§ = Long.getLong(1432853658,-446317051);
         this.§class var class§ = Long.getLong(1659660949,-434756778);
         this.§@!R§ = Long.getLong(1733814889,1388397267);
         super();
         this.model = param1;
         var _loc2_:ByteArray = new ByteArray();
         this.protocol = IProtocol(OSGi.getInstance().getService(IProtocol));
         this.network = Network(OSGi.getInstance().getService(Network));
      }
      
      public function §super var throw§(param1:int, param2:int, param3:int, param4:int, param5:int) : void
      {
         this.network.send(new §+#2§(param1,param2,param3,param4,param5));
      }
      
      public function §[r§(param1:int) : void
      {
         this.network.send(new §=G§(param1));
      }
      
      public function §if for continue§(param1:int, param2:int, param3:Vector.<§#">§>) : void
      {
         this.network.send(new §function const extends§(param1,param2,param3));
      }
      
      public function §1b§(param1:int, param2:ClientObject, param3:int, param4:§#">§, param5:Vector.<§#">§>) : void
      {
         this.network.send(new §`"t§(param1,param2.id,param3,param4,param5));
      }
   }
}

