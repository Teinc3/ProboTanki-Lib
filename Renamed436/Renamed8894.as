package Renamed436
{
   import AbstractPackets.AbstractPacket;
   
   public class Renamed8894 extends AbstractPacket
   {
      public var userId:String;
      
      public var newRank:int;
      
      public function Renamed8894(param1:String = "", param2:int = 0)
      {
         super();
         this.userId = param1;
         this.newRank = param2;
         addObjToAbsPacket(param1);
         addCodecToAbsPacket("scpacker.networking.protocol.codec.primitive.StringCodec");
         addObjToAbsPacket(param2);
         addCodecToAbsPacket("scpacker.networking.protocol.codec.primitive.IntCodec");
      }
      
      override public function Implement(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.userId = param1 as String;
               break;
            case 1:
               this.newRank = param1 as int;
         }
      }
      
      override public function getReference() : AbstractPacket
      {
         return new Renamed8894();
      }
      
      override public function getCorrespondingModel() : int
      {
         return 37;
      }
      
      override public function getPacketId() : int
      {
         return 1262947513;
      }
   }
}

