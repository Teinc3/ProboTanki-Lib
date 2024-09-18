package Renamed363
{
   import AbstractPackets.AbstractPacket;
   
   public class Renamed8186 extends AbstractPacket
   {
      public var errorMessage:String;
      
      public function Renamed8186(param1:String = "")
      {
         super();
         this.errorMessage = param1;
         addObjToAbsPacket(param1);
         addCodecToAbsPacket("scpacker.networking.protocol.codec.primitive.StringCodec");
      }
      
      override public function Implement(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.errorMessage = param1 as String;
         }
      }
      
      override public function getReference() : AbstractPacket
      {
         return new Renamed8186();
      }
      
      override public function getCorrespondingModel() : int
      {
         return 76;
      }
      
      override public function getPacketId() : int
      {
         return 138698791;
      }
   }
}

