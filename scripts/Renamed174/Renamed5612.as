package Renamed4312
{
   import AbstractPackets.AbstractPacket;
   
   public class Renamed5612 extends AbstractPacket
   {
      public var Renamed5613:String;
      
      public function Renamed5612(param1:String = "")
      {
         super();
         this.Renamed5613 = param1;
         addObjToAbsPacket(param1);
         addCodecToAbsPacket("scpacker.networking.protocol.codec.primitive.StringCodec");
      }
      
      override public function Implement(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.Renamed5613 = param1 as String;
         }
      }
      
      override public function getReference() : AbstractPacket
      {
         return new Renamed5612();
      }
      
      override public function getCorrespondingModel() : int
      {
         return 34;
      }
      
      override public function getPacketId() : int
      {
         return -161726525;
      }
   }
}

