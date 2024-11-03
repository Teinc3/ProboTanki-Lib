package Renamed268
{
   import AbstractPackets.AbstractPacket;
   
   public class Renamed6900 extends AbstractPacket
   {
      public var name:String;
      
      public function Renamed6900(param1:String = "")
      {
         super();
         this.name = param1;
         addObjToAbsPacket(param1);
         addCodecToAbsPacket("scpacker.networking.protocol.codec.primitive.StringCodec");
      }
      
      override public function Implement(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.name = param1 as String;
         }
      }
      
      override public function getReference() : AbstractPacket
      {
         return new Renamed6900();
      }
      
      override public function getCorrespondingModel() : int
      {
         return 30;
      }
      
      override public function getPacketId() : int
      {
         return 120401338;
      }
   }
}

