package Renamed7273
{
   import AbstractPackets.AbstractPacket;
   
   public class Renamed7296 extends AbstractPacket
   {
      public var projectionOnVerticalAxis:Number;
      
      public function Renamed7296(param1:Number = 0)
      {
         super();
         this.projectionOnVerticalAxis = param1;
         addObjToAbsPacket(param1);
         addCodecToAbsPacket("scpacker.networking.protocol.codec.primitive.FloatCodec");
      }
      
      override public function Implement(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.projectionOnVerticalAxis = param1 as Number;
         }
      }
      
      override public function getReference() : AbstractPacket
      {
         return new Renamed7296();
      }
      
      override public function getCorrespondingModel() : int
      {
         return 50;
      }
      
      override public function getPacketId() : int
      {
         return 1224288585;
      }
   }
}

