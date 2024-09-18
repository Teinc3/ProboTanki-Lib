package Renamed311
{
   import AbstractPackets.AbstractPacket;
   
   public class Renamed7643 extends AbstractPacket
   {
      public var battleId:String;
      
      public var userId:String;
      
      public var suspicious:Boolean;
      
      public function Renamed7643(param1:String = "", param2:String = "", param3:Boolean = false)
      {
         super();
         this.battleId = param1;
         this.userId = param2;
         this.suspicious = param3;
         addObjToAbsPacket(param1);
         addCodecToAbsPacket("scpacker.networking.protocol.codec.primitive.StringCodec");
         addObjToAbsPacket(param2);
         addCodecToAbsPacket("scpacker.networking.protocol.codec.primitive.StringCodec");
         addObjToAbsPacket(param3);
         addCodecToAbsPacket("scpacker.networking.protocol.codec.primitive.BooleanCodec");
      }
      
      override public function Implement(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.battleId = param1 as String;
               break;
            case 1:
               this.userId = param1 as String;
               break;
            case 2:
               this.suspicious = param1 as Boolean;
         }
      }
      
      override public function getReference() : AbstractPacket
      {
         return new Renamed7643();
      }
      
      override public function getCorrespondingModel() : int
      {
         return 33;
      }
      
      override public function getPacketId() : int
      {
         return -698399183;
      }
   }
}

