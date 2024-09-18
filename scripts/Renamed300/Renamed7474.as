package Renamed300
{
   import AbstractPackets.AbstractPacket;
   
   public class Renamed6196 extends AbstractPacket
   {
      public var email:String;
      
      public function Renamed6196(param1:String = "")
      {
         super();
         this.email = param1;
         addObjToAbsPacket(param1);
         addCodecToAbsPacket("scpacker.networking.protocol.codec.primitive.StringCodec");
      }
      
      override public function Implement(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.email = param1 as String;
         }
      }
      
      override public function getReference() : AbstractPacket
      {
         return new Renamed6196();
      }
      
      override public function getCorrespondingModel() : int
      {
         return 9;
      }
      
      override public function getPacketId() : int
      {
         return 1744584433;
      }
   }
}

