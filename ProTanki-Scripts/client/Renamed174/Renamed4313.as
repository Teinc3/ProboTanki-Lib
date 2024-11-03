package Renamed4312
{
   import AbstractPackets.AbstractPacket;
   
   public class Renamed4313 extends AbstractPacket
   {
      public var item:String;
      
      public var count:int;
      
      public var Renamed5552:int;
      
      public function Renamed4313(param1:String = "", param2:int = 0, param3:int = 0)
      {
         super();
         this.item = param1;
         this.count = param2;
         this.Renamed5552 = param3;
         addObjToAbsPacket(param1);
         addCodecToAbsPacket("scpacker.networking.protocol.codec.primitive.StringCodec");
         addObjToAbsPacket(param2);
         addCodecToAbsPacket("scpacker.networking.protocol.codec.primitive.IntCodec");
         addObjToAbsPacket(param3);
         addCodecToAbsPacket("scpacker.networking.protocol.codec.primitive.IntCodec");
      }
      
      override public function Implement(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.item = param1 as String;
               break;
            case 1:
               this.count = param1 as int;
               break;
            case 2:
               this.Renamed5552 = param1 as int;
         }
      }
      
      override public function getReference() : AbstractPacket
      {
         return new Renamed4313();
      }
      
      override public function getCorrespondingModel() : int
      {
         return 34;
      }
      
      override public function getPacketId() : int
      {
         return -1961983005;
      }
   }
}

