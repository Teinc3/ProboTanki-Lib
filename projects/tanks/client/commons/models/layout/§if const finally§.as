package projects.tanks.client.commons.models.layout
{
   import §%!?§.§5"§;
   import §%!?§.§package for implements§;
   import §%!?§.§switch final§;
   import §%!?§.§switch package§;
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
   
   public class §if const finally§
   {
      private var protocol:IProtocol;
      
      private var protocolBuffer:ProtocolBuffer;
      
      private var §8#,§:Long;
      
      private var §>!-§:ICodec;
      
      private var §switch if§:Long;
      
      private var §get catch if§:Long;
      
      private var §false for dynamic§:Long;
      
      private var §import catch var§:Long;
      
      private var model:IModel;
      
      public function §if const finally§(param1:IModel)
      {
         this.§8#,§ = Long.getLong(0,300070008);
         this.§switch if§ = Long.getLong(0,300070009);
         this.§get catch if§ = Long.getLong(0,300070010);
         this.§false for dynamic§ = Long.getLong(0,300070011);
         this.§import catch var§ = Long.getLong(0,300070012);
         super();
         this.model = param1;
         var _loc2_:ByteArray = new ByteArray();
         this.protocol = IProtocol(OSGi.getInstance().getService(IProtocol));
         this.protocolBuffer = new ProtocolBuffer(_loc2_,_loc2_,new OptionalMap());
      }
      
      public function exitFromBattle(param1:LayoutState) : void
      {
         Network(OSGi.getInstance().getService(Network)).send(new §switch package§(param1));
      }
      
      public function §native package class§() : void
      {
         ByteArray(this.protocolBuffer.writer).position = 0;
         ByteArray(this.protocolBuffer.writer).length = 0;
         ByteArray(this.protocolBuffer.writer).position = 0;
         if(Model.object == null)
         {
            throw new Error("Execute method without model context.");
         }
         var _loc1_:SpaceCommand = new SpaceCommand(Model.object.id,this.§switch if§,this.protocolBuffer);
         var _loc2_:IGameObject = Model.object;
         var _loc3_:ISpace = _loc2_.space;
         _loc3_.commandSender.sendCommand(_loc1_);
         this.protocolBuffer.optionalMap.clear();
      }
      
      public function switchBattleSelect() : void
      {
         Network(OSGi.getInstance().getService(Network)).send(new §package for implements§());
      }
      
      public function switchGarage() : void
      {
         Network(OSGi.getInstance().getService(Network)).send(new §5"§());
      }
      
      public function switchPayment() : void
      {
         Network(OSGi.getInstance().getService(Network)).send(new §switch final§());
      }
   }
}

