package Renamed425
{
   import AbstractPackets.AbstractPacket;
   
   public class Renamed6632 extends AbstractPacket
   {
      public var password:String;
      
      public function Renamed6632(param1:String = "")
      {
         super();
         this.password = param1;
         addObjToAbsPacket(param1);
         addCodecToAbsPacket("scpacker.networking.protocol.codec.primitive.StringCodec");
      }
      
      override public function Implement(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.password = param1 as String;
         }
      }
      
      override public function getReference() : AbstractPacket
      {
         return new Renamed6632();
      }
      
      override public function getCorrespondingModel() : int
      {
         return 24;
      }
      
      override public function getPacketId() : int
      {
         return 1771456254;
      }
   }
}

