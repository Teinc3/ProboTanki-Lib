package Renamed156
{
   import AbstractPackets.AbstractPacket;
   
   public class Renamed5191 extends AbstractPacket
   {
      public var json:String;
      
      public function Renamed5191(param1:String = "")
      {
         super();
         this.json = param1;
         addObjToAbsPacket(param1);
         addCodecToAbsPacket("scpacker.networking.protocol.codec.primitive.StringCodec");
      }
      
      override public function Implement(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.json = param1 as String;
         }
      }
      
      override public function getReference() : AbstractPacket
      {
         return new Renamed5191();
      }
      
      override public function getCorrespondingModel() : int
      {
         return 66;
      }
      
      override public function getPacketId() : int
      {
         return -1709511848;
      }
   }
}

