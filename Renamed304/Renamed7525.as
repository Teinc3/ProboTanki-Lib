package Renamed304
{
   import AbstractPackets.AbstractPacket;
   
   public class Renamed7524 extends AbstractPacket
   {
      public var shooter:String;
      
      public function Renamed7524(param1:String = "")
      {
         super();
         this.shooter = param1;
         addObjToAbsPacket(param1);
         addCodecToAbsPacket("scpacker.networking.protocol.codec.primitive.StringCodec");
      }
      
      override public function Implement(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.shooter = param1 as String;
         }
      }
      
      override public function getReference() : AbstractPacket
      {
         return new Renamed7524();
      }
      
      override public function getCorrespondingModel() : int
      {
         return 49;
      }
      
      override public function getPacketId() : int
      {
         return -1032328347;
      }
   }
}

