package Renamed5154
{
   import AbstractPackets.AbstractPacket;
   
   public class Renamed5169 extends AbstractPacket
   {
      public var mineId:String;
      
      public function Renamed5169(param1:String = "")
      {
         super();
         this.mineId = param1;
         addObjToAbsPacket(param1);
         addCodecToAbsPacket("scpacker.networking.protocol.codec.primitive.StringCodec");
      }
      
      override public function Implement(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.mineId = param1 as String;
         }
      }
      
      override public function getReference() : AbstractPacket
      {
         return new Renamed5169();
      }
      
      override public function getCorrespondingModel() : int
      {
         return 43;
      }
      
      override public function getPacketId() : int
      {
         return -1981777467;
      }
   }
}

