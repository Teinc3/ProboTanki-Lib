package Renamed323
{
   import AbstractPackets.AbstractPacket;
   
   public class Renamed4343 extends AbstractPacket
   {
      public var Renamed7746:String;
      
      public var battleId:String;
      
      public function Renamed4343(param1:String = "", param2:String = "")
      {
         super();
         this.Renamed7746 = param1;
         this.battleId = param2;
         addObjToAbsPacket(param1);
         addCodecToAbsPacket("scpacker.networking.protocol.codec.primitive.StringCodec");
         addObjToAbsPacket(param2);
         addCodecToAbsPacket("scpacker.networking.protocol.codec.primitive.StringCodec");
      }
      
      override public function Implement(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.Renamed7746 = param1 as String;
               break;
            case 1:
               this.battleId = param1 as String;
         }
      }
      
      override public function getReference() : AbstractPacket
      {
         return new Renamed4343();
      }
      
      override public function getCorrespondingModel() : int
      {
         return 15;
      }
      
      override public function getPacketId() : int
      {
         return -864265623;
      }
   }
}

