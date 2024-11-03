package Renamed448
{
   import AbstractPackets.AbstractPacket;
   
   public class Renamed8992 extends AbstractPacket
   {
      public var uid:String;
      
      public var message:String;
      
      public function Renamed8992(param1:String = "", param2:String = "")
      {
         super();
         this.uid = param1;
         this.message = param2;
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
               this.uid = param1 as String;
               break;
            case 1:
               this.message = param1 as String;
         }
      }
      
      override public function getReference() : AbstractPacket
      {
         return new Renamed8992();
      }
      
      override public function getCorrespondingModel() : int
      {
         return 61;
      }
      
      override public function getPacketId() : int
      {
         return 1532749363;
      }
   }
}

