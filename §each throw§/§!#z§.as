package §each throw§
{
   import §;"?§.§#">§;
   import alternativa.osgi.OSGi;
   import alternativa.protocol.ICodec;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.OptionalMap;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.types.Long;
   import flash.utils.ByteArray;
   import platform.client.fp10.core.model.IModel;
   import projects.tanks.client.battlefield.models.tankparts.weapons.common.§default for break§;
   import scpacker.networking.Network;
   import §while set switch§.§7$#§;
   import §while set switch§.§false for override§;
   
   public class §!#z§
   {
      private var protocol:IProtocol;
      
      private var protocolBuffer:ProtocolBuffer;
      
      private var §8#9§:Long;
      
      private var §>"4§:ICodec;
      
      private var §include catch throw§:ICodec;
      
      private var §override var true§:Long;
      
      private var §5"o§:ICodec;
      
      private var §package var use§:ICodec;
      
      private var §?"G§:ICodec;
      
      private var model:IModel;
      
      private var network:Network;
      
      public function §!#z§(param1:IModel)
      {
         this.§8#9§ = Long.getLong(854040669,-100146847);
         this.§override var true§ = Long.getLong(2115177320,1289626411);
         super();
         this.model = param1;
         var _loc2_:ByteArray = new ByteArray();
         this.protocol = IProtocol(OSGi.getInstance().getService(IProtocol));
         this.network = Network(OSGi.getInstance().getService(Network));
         this.protocolBuffer = new ProtocolBuffer(_loc2_,_loc2_,new OptionalMap());
      }
      
      public function §case break§(param1:int, param2:§#">§) : void
      {
         this.network.send(new §false for override§(param1,param2));
      }
      
      public function §;# §(param1:int, param2:§#">§, param3:Vector.<§default for break§>) : void
      {
         this.network.send(new §7$#§(param1,param2,param3));
      }
   }
}

