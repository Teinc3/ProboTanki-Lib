package §0#1§
{
   import §;"?§.§#">§;
   import §@#6§.§+§;
   import §@#6§.§6"m§;
   import §@#6§.§8#D§;
   import alternativa.object.ClientObject;
   import alternativa.osgi.OSGi;
   import alternativa.protocol.ICodec;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.OptionalMap;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.types.Long;
   import flash.utils.ByteArray;
   import platform.client.fp10.core.model.IModel;
   import scpacker.networking.Network;
   
   public class §case for catch§
   {
      private var protocol:IProtocol;
      
      private var protocolBuffer:ProtocolBuffer;
      
      private var §'"W§:Long;
      
      private var §throw var function§:ICodec;
      
      private var §'#+§:Long;
      
      private var §default override§:ICodec;
      
      private var §set catch true§:ICodec;
      
      private var §3x§:Long;
      
      private var §package var do§:ICodec;
      
      private var § "x§:ICodec;
      
      private var §9#f§:ICodec;
      
      private var §const package§:ICodec;
      
      private var §0!d§:ICodec;
      
      private var §include package with§:ICodec;
      
      private var model:IModel;
      
      private var network:Network;
      
      public function §case for catch§(param1:IModel)
      {
         this.§'"W§ = Long.getLong(158866586,759986797);
         this.§'#+§ = Long.getLong(1766359006,1664614075);
         this.§3x§ = Long.getLong(1692205066,-158539970);
         super();
         this.model = param1;
         var _loc2_:ByteArray = new ByteArray();
         this.network = Network(OSGi.getInstance().getService(Network));
         this.protocol = IProtocol(OSGi.getInstance().getService(IProtocol));
         this.protocolBuffer = new ProtocolBuffer(_loc2_,_loc2_,new OptionalMap());
      }
      
      public function §super var throw§(param1:int) : void
      {
         this.network.send(new §+#2§(param1));
      }
      
      public function §catch const import§(param1:int, param2:§#">§) : void
      {
         this.network.send(new §6"m§(param1,param2));
      }
      
      public function §class const include§(param1:int, param2:ClientObject, param3:int, param4:§#">§, param5:§#">§, param6:§#">§) : void
      {
         this.network.send(new §8#D§(param1,param2.id,param3,param4,param5,param6));
      }
   }
}

