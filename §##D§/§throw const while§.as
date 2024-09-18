package §##D§
{
   import alternativa.osgi.OSGi;
   import alternativa.protocol.ICodec;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.OptionalMap;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.types.Long;
   import flash.utils.ByteArray;
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.network.command.SpaceCommand;
   import platform.client.fp10.core.type.IGameObject;
   import platform.client.fp10.core.type.ISpace;
   import scpacker.networking.Network;
   import §set package native§.§!#s§;
   import §set package native§.§+v§;
   import §set package native§.§6!y§;
   import §set package native§.§?#H§;
   import §set package native§.§finally include§;
   import §set package native§.§native for catch§;
   import §set package native§.§try throw§;
   import §with const throw§.§["R§;
   import §with const throw§.§^v§;
   
   public class §throw const while§
   {
      private var protocol:IProtocol;
      
      private var protocolBuffer:ProtocolBuffer;
      
      private var §var set while§:Long;
      
      private var §[!'§:Long;
      
      private var §7!g§:ICodec;
      
      private var §="v§:ICodec;
      
      private var §^#[§:ICodec;
      
      private var §%"2§:ICodec;
      
      private var §9!G§:Long;
      
      private var §8!I§:ICodec;
      
      private var §class set var§:Long;
      
      private var §'";§:ICodec;
      
      private var §?#6§:ICodec;
      
      private var §#a§:ICodec;
      
      private var §=N§:Long;
      
      private var §#!s§:ICodec;
      
      private var §else const package§:ICodec;
      
      private var §^"M§:ICodec;
      
      private var §null null§:Long;
      
      private var §var const in§:ICodec;
      
      private var §static set null§:ICodec;
      
      private var §7""§:ICodec;
      
      private var model:IModel;
      
      private var network:Network;
      
      public function §throw const while§(param1:IModel)
      {
         this.§var set while§ = Long.getLong(674088239,-466180297);
         this.§[!'§ = Long.getLong(1469435049,418614378);
         this.§9!G§ = Long.getLong(27305946,689085087);
         this.§class set var§ = Long.getLong(2114337908,577714981);
         this.§=N§ = Long.getLong(1028282615,1943158798);
         this.§null null§ = Long.getLong(785096439,-1657218933);
         super();
         this.model = param1;
         var _loc2_:ByteArray = new ByteArray();
         this.network = Network(OSGi.getInstance().getService(Network));
         this.protocol = IProtocol(OSGi.getInstance().getService(IProtocol));
         this.protocolBuffer = new ProtocolBuffer(_loc2_,_loc2_,new OptionalMap());
      }
      
      public function §,"_§() : void
      {
         ByteArray(this.protocolBuffer.writer).position = 0;
         ByteArray(this.protocolBuffer.writer).length = 0;
         ByteArray(this.protocolBuffer.writer).position = 0;
         if(Model.object == null)
         {
            throw new Error("Execute method without model context.");
         }
         var _loc1_:SpaceCommand = new SpaceCommand(Model.object.id,this.§var set while§,this.protocolBuffer);
         var _loc2_:IGameObject = Model.object;
         var _loc3_:ISpace = _loc2_.space;
         _loc3_.commandSender.sendCommand(_loc1_);
         this.protocolBuffer.optionalMap.clear();
      }
      
      public function §super for dynamic§() : void
      {
         this.network.send(new §native for catch§());
      }
      
      public function §6"X§(param1:int, param2:int, param3:§["R§, param4:Number) : void
      {
         this.network.send(new §try throw§(param1,param2,param3,param4));
      }
      
      public function §7"U§(param1:Number) : void
      {
         ByteArray(this.protocolBuffer.writer).position = 0;
         ByteArray(this.protocolBuffer.writer).length = 0;
         this.§8!I§.encode(this.protocolBuffer,param1);
         ByteArray(this.protocolBuffer.writer).position = 0;
         if(Model.object == null)
         {
            throw new Error("Execute method without model context.");
         }
         var _loc2_:SpaceCommand = new SpaceCommand(Model.object.id,this.§9!G§,this.protocolBuffer);
         var _loc3_:IGameObject = Model.object;
         var _loc4_:ISpace = _loc3_.space;
         _loc4_.commandSender.sendCommand(_loc2_);
         this.protocolBuffer.optionalMap.clear();
      }
      
      public function moveCommand(param1:int, param2:int, param3:§["R§) : void
      {
         this.network.send(new §!#s§(param1,param2,param3));
      }
      
      public function §override get§(param1:int, param2:int, param3:int) : void
      {
         this.network.send(new §6!y§(param1,param2,param3));
      }
      
      public function rotateTurretCommand(param1:int, param2:§^v§, param3:int) : void
      {
         this.network.send(new §+v§(param1,param2,param3));
      }
      
      public function setReadyToPlace() : void
      {
         this.network.send(new §?#H§());
      }
      
      public function §class var try§() : void
      {
         this.network.send(new §finally include§());
      }
   }
}

