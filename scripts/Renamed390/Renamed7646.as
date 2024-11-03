package Renamed390
{
   import AbstractPackets.AbstractPacket;
   
   public class Renamed7646 extends AbstractPacket
   {
      public var battleId:String;
      
      public var newName:String;
      
      public function Renamed7646(param1:String = "", param2:String = "")
      {
         super();
         this.battleId = param1;
         this.newName = param2;
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
               this.newName = param1 as String;
         }
      }
      
      override public function getReference() : AbstractPacket
      {
         return new Renamed7646();
      }
      
      override public function getCorrespondingModel() : int
      {
         return 32;
      }
      
      override public function getPacketId() : int
      {
         return 2011860838;
      }
   }
}

