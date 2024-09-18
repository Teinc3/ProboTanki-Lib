package Renamed425
{
   import AbstractPackets.AbstractPacket;
   
   public class Renamed8756 extends AbstractPacket
   {
      public var password:String;
      
      public var email:String;
      
      public function Renamed8756(param1:String = "", param2:String = "")
      {
         super();
         this.password = param1;
         this.email = param2;
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
               this.password = param1 as String;
               break;
            case 1:
               this.email = param1 as String;
         }
      }
      
      override public function getReference() : AbstractPacket
      {
         return new Renamed8756();
      }
      
      override public function getCorrespondingModel() : int
      {
         return 24;
      }
      
      override public function getPacketId() : int
      {
         return 147737736;
      }
   }
}

