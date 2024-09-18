package Renamed149
{
   import Renamed4312.Renamed5061;
   import alternativa.osgi.OSGi;
   import alternativa.protocol.ICodec;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.OptionalMap;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.protocol.info.TypeCodecInfo;
   import alternativa.tanks.model.item.present.PresentItem;
   import alternativa.types.Long;
   import flash.utils.ByteArray;
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.type.IGameObject;
   import scpacker.networking.Network;
   
   public class Renamed5062
   {
      private var protocol:IProtocol;
      
      private var protocolBuffer:ProtocolBuffer;
      
      private var Renamed5063:Long;
      
      private var Renamed5064:ICodec;
      
      private var model:IModel;
      
      public function Renamed5062(param1:IModel)
      {
         this.Renamed5063 = Long.getLong(1053633131,-938990018);
         super();
         this.model = param1;
         var _loc2_:ByteArray = new ByteArray();
         this.protocol = IProtocol(OSGi.getInstance().getService(IProtocol));
         this.protocolBuffer = new ProtocolBuffer(_loc2_,_loc2_,new OptionalMap());
         this.Renamed5064 = this.protocol.getCodec(new TypeCodecInfo(IGameObject,false));
      }
      
      public function removePresent(param1:IGameObject) : void
      {
         Network(OSGi.getInstance().getService(Network)).send(new Renamed5061(PresentItem(param1.adapt(PresentItem)).getConstructor().id));
      }
   }
}

