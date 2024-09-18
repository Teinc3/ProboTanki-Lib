package Renamed363
{
   import AbstractPackets.AbstractPacket;
   
   public class Renamed8199 extends AbstractPacket
   {
      public var Renamed8200:Vector.<String>;
      
      public var Renamed8201:String;
      
      public function Renamed8199(param1:Vector.<String> = null, param2:String = "")
      {
         super();
         this.Renamed8200 = param1;
         this.Renamed8201 = param2;
         addObjToAbsPacket(param1);
         addCodecToAbsPacket("scpacker.networking.protocol.codec.complex.VectorCodecString");
         addObjToAbsPacket(param2);
         addCodecToAbsPacket("scpacker.networking.protocol.codec.primitive.StringCodec");
      }
      
      override public function Implement(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.Renamed8200 = param1 as Vector.<String>;
               break;
            case 1:
               this.Renamed8201 = param1 as String;
         }
      }
      
      override public function getReference() : AbstractPacket
      {
         return new Renamed8199();
      }
      
      override public function getCorrespondingModel() : int
      {
         return 76;
      }
      
      override public function getPacketId() : int
      {
         return -762658127;
      }
   }
}

