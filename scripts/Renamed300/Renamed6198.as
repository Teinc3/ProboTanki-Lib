package Renamed300
{
   import AbstractPackets.AbstractPacket;
   
   public class Renamed6198 extends AbstractPacket
   {
      public var Renamed7480:String;
      
      public var Renamed7481:String;
      
      public function Renamed6198(param1:String = "", param2:String = "")
      {
         super();
         this.Renamed7480 = param1;
         this.Renamed7481 = param2;
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
               this.Renamed7480 = param1 as String;
               break;
            case 1:
               this.Renamed7481 = param1 as String;
         }
      }
      
      override public function getReference() : AbstractPacket
      {
         return new Renamed6198();
      }
      
      override public function getCorrespondingModel() : int
      {
         return 9;
      }
      
      override public function getPacketId() : int
      {
         return 762959326;
      }
   }
}

