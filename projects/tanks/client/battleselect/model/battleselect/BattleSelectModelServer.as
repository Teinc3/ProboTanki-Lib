package projects.tanks.client.battleselect.model.battleselect
{
   import §^2§.§7"K§;
   import alternativa.osgi.OSGi;
   import alternativa.protocol.ICodec;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.OptionalMap;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.protocol.info.TypeCodecInfo;
   import alternativa.types.Long;
   import flash.utils.ByteArray;
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.network.command.SpaceCommand;
   import platform.client.fp10.core.type.IGameObject;
   import platform.client.fp10.core.type.ISpace;
   import scpacker.networking.Network;
   
   public class BattleSelectModelServer
   {
      private var protocol:IProtocol;
      
      private var protocolBuffer:ProtocolBuffer;
      
      private var _onSelectId:Long;
      
      private var _onSelect_itemCodec:ICodec;
      
      private var _searchId:Long;
      
      private var _search_battleIdCodec:ICodec;
      
      private var model:IModel;
      
      public function BattleSelectModelServer(param1:IModel)
      {
         this._onSelectId = Long.getLong(0,300090024);
         this._searchId = Long.getLong(0,300090025);
         super();
         this.model = param1;
         var _loc2_:ByteArray = new ByteArray();
         this.protocol = IProtocol(OSGi.getInstance().getService(IProtocol));
         this.protocolBuffer = new ProtocolBuffer(_loc2_,_loc2_,new OptionalMap());
         this._onSelect_itemCodec = this.protocol.getCodec(new TypeCodecInfo(IGameObject,false));
         this._search_battleIdCodec = this.protocol.getCodec(new TypeCodecInfo(Long,false));
      }
      
      public function onSelect(param1:String) : void
      {
         Network(OSGi.getInstance().getService(Network)).send(new §7"K§(param1));
      }
      
      public function search(param1:String) : void
      {
         ByteArray(this.protocolBuffer.writer).position = 0;
         ByteArray(this.protocolBuffer.writer).length = 0;
         this._search_battleIdCodec.encode(this.protocolBuffer,param1);
         ByteArray(this.protocolBuffer.writer).position = 0;
         if(Model.object == null)
         {
            throw new Error("Execute method without model context.");
         }
         var _loc2_:SpaceCommand = new SpaceCommand(Model.object.id,this._searchId,this.protocolBuffer);
         var _loc3_:IGameObject = Model.object;
         var _loc4_:ISpace = _loc3_.space;
         _loc4_.commandSender.sendCommand(_loc2_);
         this.protocolBuffer.optionalMap.clear();
      }
   }
}

