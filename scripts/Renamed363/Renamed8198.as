package Renamed363
{
   import AbstractPackets.AbstractPacket;
   import Renamed420.Renamed1806;
   
   public class Renamed8198 extends AbstractPacket
   {
      public var data:Vector.<Renamed1806>;
      
      public var inviteLink:String;
      
      public var banner:String;
      
      public var inviteMessage:String;
      
      public function Renamed8198(param1:Vector.<Renamed1806> = null, param2:String = "", param3:String = "", param4:String = "")
      {
         super();
         this.data = param1;
         this.inviteLink = param2;
         this.banner = param3;
         this.inviteMessage = param4;
         addObjToAbsPacket(param1);
         addCodecToAbsPacket("scpacker.networking.protocol.codec.custom.VectorCodecReferrerIncomeData");
         addObjToAbsPacket(param2);
         addCodecToAbsPacket("scpacker.networking.protocol.codec.primitive.StringCodec");
         addObjToAbsPacket(param3);
         addCodecToAbsPacket("scpacker.networking.protocol.codec.primitive.StringCodec");
         addObjToAbsPacket(param4);
         addCodecToAbsPacket("scpacker.networking.protocol.codec.primitive.StringCodec");
      }
      
      override public function Implement(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.data = param1 as Vector.<Renamed1806>;
               break;
            case 1:
               this.inviteLink = param1 as String;
               break;
            case 2:
               this.banner = param1 as String;
               break;
            case 3:
               this.inviteMessage = param1 as String;
         }
      }
      
      override public function getReference() : AbstractPacket
      {
         return new Renamed8198();
      }
      
      override public function getCorrespondingModel() : int
      {
         return 76;
      }
      
      override public function getPacketId() : int
      {
         return 1587315905;
      }
   }
}

