package Renamed300
{
   import AbstractPackets.AbstractPacket;
   
   public class Renamed7483 extends AbstractPacket
   {
      public var success:Boolean;
      
      public var error:String;
      
      public function Renamed7483(param1:Boolean = false, param2:String = "")
      {
         super();
         this.success = param1;
         this.error = param2;
         addObjToAbsPacket(param1);
         addCodecToAbsPacket("scpacker.networking.protocol.codec.primitive.BooleanCodec");
         addObjToAbsPacket(param2);
         addCodecToAbsPacket("scpacker.networking.protocol.codec.primitive.StringCodec");
      }
      
      override public function Implement(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.success = param1 as Boolean;
               break;
            case 1:
               this.error = param1 as String;
         }
      }
      
      override public function getReference() : AbstractPacket
      {
         return new Renamed7483();
      }
      
      override public function getCorrespondingModel() : int
      {
         return 9;
      }
      
      override public function getPacketId() : int
      {
         return 1570555748;
      }
   }
}

