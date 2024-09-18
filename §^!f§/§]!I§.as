package §^!f§
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
   import §var const dynamic§.§ !^§;
   import §var const dynamic§.§>!c§;
   import §var const dynamic§.§?"5§;
   import §var const dynamic§.§throw catch return§;
   
   public class §]!I§
   {
      private var protocol:IProtocol;
      
      private var protocolBuffer:ProtocolBuffer;
      
      private var §implements var override§:Long;
      
      private var §do var if§:ICodec;
      
      private var §for break§:Long;
      
      private var §!#M§:ICodec;
      
      private var §include const null§:Long;
      
      private var § !E§:ICodec;
      
      private var §-!^§:ICodec;
      
      private var §-'§:ICodec;
      
      private var §`"F§:Long;
      
      private var §else set in§:ICodec;
      
      private var §super class§:ICodec;
      
      private var model:IModel;
      
      private var network:Network;
      
      public function §]!I§(param1:IModel)
      {
         this.§implements var override§ = Long.getLong(1600977732,-1971270444);
         this.§for break§ = Long.getLong(779639549,-508617372);
         this.§include const null§ = Long.getLong(1983735305,-731019411);
         this.§`"F§ = Long.getLong(116946402,65284411);
         super();
         this.model = param1;
         var _loc2_:ByteArray = new ByteArray();
         this.protocol = IProtocol(OSGi.getInstance().getService(IProtocol));
         this.protocolBuffer = new ProtocolBuffer(_loc2_,_loc2_,new OptionalMap());
         this.network = Network(OSGi.getInstance().getService(Network));
      }
      
      public function startFire(param1:int) : void
      {
         this.network.send(new §throw catch return§(param1));
      }
      
      public function §else package else§(param1:int) : void
      {
         this.network.send(new §?"5§(param1));
      }
      
      public function §>!p§(param1:int, param2:§#">§, param3:Vector.<§default for break§>) : void
      {
         this.network.send(new § !^§(param1,param2,param3));
      }
      
      public function §import package in§(param1:int, param2:§#">§) : void
      {
         this.network.send(new §>!c§(param1,param2));
      }
   }
}

