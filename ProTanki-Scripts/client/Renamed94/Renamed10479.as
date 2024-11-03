package Renamed94
{
   import Renamed7273.Renamed7292;
   import Renamed7273.Renamed7306;
   import Renamed7273.Renamed7294;
   import Renamed7273.Renamed7302;
   import Renamed7273.Renamed7305;
   import Renamed602.3DPositionVector;
   import alternativa.osgi.OSGi;
   import alternativa.protocol.ICodec;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.types.Long;
   import flash.utils.ByteArray;
   import platform.client.fp10.core.model.IModel;
   import scpacker.networking.Network;
   
   public class Renamed10458
   {
      private var protocol:IProtocol;
      
      private var protocolBuffer:ProtocolBuffer;
      
      private var Renamed10459:Long;
      
      private var Renamed10460:Long;
      
      private var Renamed10461:ICodec;
      
      private var Renamed10462:ICodec;
      
      private var Renamed10463:ICodec;
      
      private var Renamed10464:ICodec;
      
      private var Renamed10465:ICodec;
      
      private var Renamed10466:ICodec;
      
      private var Renamed10467:ICodec;
      
      private var Renamed10468:Long;
      
      private var Renamed10469:ICodec;
      
      private var Renamed10470:Long;
      
      private var Renamed10471:ICodec;
      
      private var Renamed10472:ICodec;
      
      private var Renamed10473:ICodec;
      
      private var Renamed10474:ICodec;
      
      private var Renamed10475:ICodec;
      
      private var Renamed10476:ICodec;
      
      private var Renamed10477:ICodec;
      
      private var Renamed10478:Long;
      
      private var model:IModel;
      
      private var network:Network;
      
      public function Renamed10458(param1:IModel)
      {
         this.Renamed10459 = Long.getLong(1850967873,1410393465);
         this.Renamed10460 = Long.getLong(665718601,863056095);
         this.Renamed10468 = Long.getLong(384666897,-1041026192);
         this.Renamed10470 = Long.getLong(1060379432,313263560);
         this.Renamed10478 = Long.getLong(717480200,-1898093994);
         this.network = OSGi.getInstance().getService(Network) as Network;
         super();
         this.model = param1;
         var _loc2_:ByteArray = new ByteArray();
      }
      
      public function Renamed3178() : void
      {
         this.network.send(new Renamed7305());
      }
      
      public function Renamed3172(param1:int, param2:3DPositionVector, param3:Vector.<String>, param4:Vector.<3DPositionVector>, param5:Vector.<int>, param6:Vector.<3DPositionVector>, param7:Vector.<3DPositionVector>) : void
      {
         this.network.send(new Renamed7294(param1,param2,param3,param4,param5,param6,param7));
      }
      
      public function Renamed3176(param1:int) : void
      {
         this.network.send(new Renamed7306(param1));
      }
      
      public function Renamed3174(param1:int, param2:3DPositionVector, param3:Vector.<String>, param4:Vector.<3DPositionVector>, param5:Vector.<int>, param6:Vector.<3DPositionVector>, param7:Vector.<3DPositionVector>) : void
      {
         this.network.send(new Renamed7292(param1,param2,param3,param4,param5,param6,param7));
      }
      
      public function Renamed3180(param1:int) : void
      {
         this.network.send(new Renamed7302(param1));
      }
   }
}

