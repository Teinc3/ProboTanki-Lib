package Renamed354
{
   import AbstractPackets.AbstractPacket;
   
   public class Renamed8124 extends AbstractPacket
   {
      public var hash:String;
      
      public function Renamed8124(param1:String = "")
      {
         super();
         this.hash = param1;
         addObjToAbsPacket(param1);
         addCodecToAbsPacket("scpacker.networking.protocol.codec.primitive.StringCodec");
      }
      
      override public function Implement(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.hash = param1 as String;
         }
      }
      
      override public function getReference() : AbstractPacket
      {
         return new Renamed8124();
      }
      
      override public function getCorrespondingModel() : int
      {
         return 1;
      }
      
      override public function getPacketId() : int
      {
         return 932564569;
      }
   }
}

