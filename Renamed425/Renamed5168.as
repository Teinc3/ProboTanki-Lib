package Renamed425
{
   import AbstractPackets.AbstractPacket;
   
   public class Renamed5168 extends AbstractPacket
   {
      public var email:String;
      
      public var emailConfirmed:Boolean;
      
      public function Renamed5168(param1:String = "", param2:Boolean = false)
      {
         super();
         this.email = param1;
         this.emailConfirmed = param2;
         addObjToAbsPacket(param1);
         addCodecToAbsPacket("scpacker.networking.protocol.codec.primitive.StringCodec");
         addObjToAbsPacket(param2);
         addCodecToAbsPacket("scpacker.networking.protocol.codec.primitive.BooleanCodec");
      }
      
      override public function Implement(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.email = param1 as String;
               break;
            case 1:
               this.emailConfirmed = param1 as Boolean;
         }
      }
      
      override public function getReference() : AbstractPacket
      {
         return new Renamed5168();
      }
      
      override public function getCorrespondingModel() : int
      {
         return 24;
      }
      
      override public function getPacketId() : int
      {
         return 613462801;
      }
   }
}

