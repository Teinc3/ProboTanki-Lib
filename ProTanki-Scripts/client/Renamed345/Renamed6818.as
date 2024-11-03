package Renamed345
{
   import AbstractPackets.AbstractPacket;
   
   public class Renamed6818 extends AbstractPacket
   {
      public var serverSessionTime:int;
      
      public var clientPing:int;
      
      public function Renamed6818(param1:int = 0, param2:int = 0)
      {
         super();
         this.serverSessionTime = param1;
         this.clientPing = param2;
         addObjToAbsPacket(param1);
         addCodecToAbsPacket("scpacker.networking.protocol.codec.primitive.IntCodec");
         addObjToAbsPacket(param2);
         addCodecToAbsPacket("scpacker.networking.protocol.codec.primitive.IntCodec");
      }
      
      override public function Implement(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.serverSessionTime = param1 as int;
               break;
            case 1:
               this.clientPing = param1 as int;
         }
      }
      
      override public function getReference() : AbstractPacket
      {
         return new Renamed6818();
      }
      
      override public function getCorrespondingModel() : int
      {
         return 46;
      }
      
      override public function getPacketId() : int
      {
         return 34068208;
      }
   }
}

