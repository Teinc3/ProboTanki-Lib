package Renamed436
{
   import AbstractPackets.AbstractPacket;
   
   public class Renamed8882 extends AbstractPacket
   {
      public var userId:String;
      
      public var suspicious:Boolean;
      
      public function Renamed8882(param1:String = "", param2:Boolean = false)
      {
         super();
         this.userId = param1;
         this.suspicious = param2;
         addObjToAbsPacket(param1);
         addCodecToAbsPacket("scpacker.networking.protocol.codec.primitive.StringCodec");
         addObjToAbsPacket(param2);
         addCodecToAbsPacket("scpacker.networking.protocol.codec.primitive.BooleanCodec");
      }
      
      override public function Implement(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.userId = param1 as String;
               break;
            case 1:
               this.suspicious = param1 as Boolean;
         }
      }
      
      override public function getReference() : AbstractPacket
      {
         return new Renamed8882();
      }
      
      override public function getCorrespondingModel() : int
      {
         return 37;
      }
      
      override public function getPacketId() : int
      {
         return 446781737;
      }
   }
}

