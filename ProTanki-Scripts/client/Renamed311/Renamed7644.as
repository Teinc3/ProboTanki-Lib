package Renamed311
{
   import AbstractPackets.AbstractPacket;
   
   public class Renamed7644 extends AbstractPacket
   {
      public var battleId:String;
      
      public var userId:String;
      
      public function Renamed7644(param1:String = "", param2:String = "")
      {
         super();
         this.battleId = param1;
         this.userId = param2;
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
               this.battleId = param1 as String;
               break;
            case 1:
               this.userId = param1 as String;
         }
      }
      
      override public function getReference() : AbstractPacket
      {
         return new Renamed7644();
      }
      
      override public function getCorrespondingModel() : int
      {
         return 33;
      }
      
      override public function getPacketId() : int
      {
         return 1924874982;
      }
   }
}

