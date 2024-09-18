package Renamed77
{
   import Renamed7273.Renamed7289;
   import Renamed7273.Renamed7296;
   import Renamed7273.Renamed7304;
   import Renamed602.3DPositionVector;
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
   
   public class Renamed10265
   {
      private var protocol:IProtocol;
      
      private var protocolBuffer:ProtocolBuffer;
      
      private var Renamed10266:Long;
      
      private var Renamed10267:ICodec;
      
      private var Renamed10268:ICodec;
      
      private var Renamed10269:Long;
      
      private var Renamed10270:Long;
      
      private var Renamed10271:ICodec;
      
      private var model:IModel;
      
      private var network:Network;
      
      public function Renamed10265(param1:IModel)
      {
         this.Renamed10266 = Long.getLong(378246388,-1614466693);
         this.Renamed10269 = Long.getLong(1929188336,1755522623);
         this.Renamed10270 = Long.getLong(840274237,-606345319);
         super();
         this.model = param1;
         var _loc2_:ByteArray = new ByteArray();
         this.network = Network(OSGi.getInstance().getService(Network));
         this.protocol = IProtocol(OSGi.getInstance().getService(IProtocol));
         this.protocolBuffer = new ProtocolBuffer(_loc2_,_loc2_,new OptionalMap());
      }
      
      public function Renamed7192(param1:ClientObject, param2:3DPositionVector) : void
      {
         this.network.send(new Renamed7304(param1.id,param2));
      }
      
      public function hide() : void
      {
         this.network.send(new Renamed7289());
      }
      
      public function Renamed7194(param1:Number) : void
      {
         this.network.send(new Renamed7296(param1));
      }
   }
}

