package Renamed377
{
   import AbstractPackets.AbstractPacket;
   
   public class Renamed8323 extends AbstractPacket
   {
      public var battleId:String;
      
      public function Renamed8323(param1:String = "")
      {
         super();
         this.battleId = param1;
         addObjToAbsPacket(param1);
         addCodecToAbsPacket("scpacker.networking.protocol.codec.primitive.StringCodec");
      }
      
      override public function Implement(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.battleId = param1 as String;
         }
      }
      
      override public function getReference() : AbstractPacket
      {
         return new Renamed8323();
      }
      
      override public function getCorrespondingModel() : int
      {
         return 14;
      }
      
      override public function getPacketId() : int
      {
         return 1152930968;
      }
   }
}

