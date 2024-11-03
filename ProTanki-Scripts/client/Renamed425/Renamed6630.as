package Renamed425
{
   import AbstractPackets.AbstractPacket;
   
   public class Renamed6630 extends AbstractPacket
   {
      public var Renamed7495:String;
      
      public var password:String;
      
      public function Renamed6630(param1:String = "", param2:String = "")
      {
         super();
         this.Renamed7495 = param1;
         this.password = param2;
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
               this.Renamed7495 = param1 as String;
               break;
            case 1:
               this.password = param1 as String;
         }
      }
      
      override public function getReference() : AbstractPacket
      {
         return new Renamed6630();
      }
      
      override public function getCorrespondingModel() : int
      {
         return 24;
      }
      
      override public function getPacketId() : int
      {
         return 668890771;
      }
   }
}

