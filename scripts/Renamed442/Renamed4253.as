package Renamed442
{
   import AbstractPackets.AbstractPacket;
   
   public class Renamed4253 extends AbstractPacket
   {
      public var Renamed8942:String;
      
      public var text:String;
      
      public function Renamed4253(param1:String = "", param2:String = "")
      {
         super();
         this.Renamed8942 = param1;
         this.text = param2;
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
               this.Renamed8942 = param1 as String;
               break;
            case 1:
               this.text = param1 as String;
         }
      }
      
      override public function getReference() : AbstractPacket
      {
         return new Renamed4253();
      }
      
      override public function getCorrespondingModel() : int
      {
         return 28;
      }
      
      override public function getPacketId() : int
      {
         return 705454610;
      }
   }
}

