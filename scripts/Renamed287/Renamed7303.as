package Renamed7273
{
   import AbstractPackets.AbstractPacket;
   
   public class Renamed7303 extends AbstractPacket
   {
      public var shooterId:String;
      
      public function Renamed7303(param1:String = "")
      {
         super();
         this.shooterId = param1;
         addObjToAbsPacket(param1);
         addCodecToAbsPacket("scpacker.networking.protocol.codec.primitive.StringCodec");
      }
      
      override public function Implement(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.shooterId = param1 as String;
         }
      }
      
      override public function getReference() : AbstractPacket
      {
         return new Renamed7303();
      }
      
      override public function getCorrespondingModel() : int
      {
         return 50;
      }
      
      override public function getPacketId() : int
      {
         return -380595194;
      }
   }
}

