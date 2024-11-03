package Renamed205
{
   import AbstractPackets.AbstractPacket;
   
   public class Renamed6090 extends AbstractPacket
   {
      public var defaultCountryCode:String;
      
      public function Renamed6090(param1:String = "")
      {
         super();
         this.defaultCountryCode = param1;
         addObjToAbsPacket(param1);
         addCodecToAbsPacket("scpacker.networking.protocol.codec.primitive.StringCodec");
      }
      
      override public function Implement(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.defaultCountryCode = param1 as String;
         }
      }
      
      override public function getReference() : AbstractPacket
      {
         return new Renamed6090();
      }
      
      override public function getCorrespondingModel() : int
      {
         return 75;
      }
      
      override public function getPacketId() : int
      {
         return 1961542160;
      }
   }
}

