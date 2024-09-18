package Renamed214
{
   import AbstractPackets.AbstractPacket;
   
   public class Renamed6228 extends AbstractPacket
   {
      public var text:String;
      
      public var uid:String;
      
      public function Renamed6228(param1:String = "", param2:String = "")
      {
         super();
         this.text = param1;
         this.uid = param2;
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
               this.text = param1 as String;
               break;
            case 1:
               this.uid = param1 as String;
         }
      }
      
      override public function getReference() : AbstractPacket
      {
         return new Renamed6228();
      }
      
      override public function getCorrespondingModel() : int
      {
         return 65;
      }
      
      override public function getPacketId() : int
      {
         return 1382076950;
      }
   }
}

