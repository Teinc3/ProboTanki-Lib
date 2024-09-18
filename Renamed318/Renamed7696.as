package Renamed318
{
   import AbstractPackets.AbstractPacket;
   
   public class Renamed7696 extends AbstractPacket
   {
      public var mineId:String;
      
      public var targetId:String;
      
      public function Renamed7696(param1:String = "", param2:String = "")
      {
         super();
         this.mineId = param1;
         this.targetId = param2;
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
               this.mineId = param1 as String;
               break;
            case 1:
               this.targetId = param1 as String;
         }
      }
      
      override public function getReference() : AbstractPacket
      {
         return new Renamed7696();
      }
      
      override public function getCorrespondingModel() : int
      {
         return 62;
      }
      
      override public function getPacketId() : int
      {
         return 1387974401;
      }
   }
}

