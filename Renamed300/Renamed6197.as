package Renamed300
{
   import AbstractPackets.AbstractPacket;
   
   public class Renamed6197 extends AbstractPacket
   {
      public var Renamed7475:String;
      
      public function Renamed6197(param1:String = "")
      {
         super();
         this.Renamed7475 = param1;
         addObjToAbsPacket(param1);
         addCodecToAbsPacket("scpacker.networking.protocol.codec.primitive.StringCodec");
      }
      
      override public function Implement(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.Renamed7475 = param1 as String;
         }
      }
      
      override public function getReference() : AbstractPacket
      {
         return new Renamed6197();
      }
      
      override public function getCorrespondingModel() : int
      {
         return 9;
      }
      
      override public function getPacketId() : int
      {
         return 903498755;
      }
   }
}

