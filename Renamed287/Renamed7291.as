package Renamed7273
{
   import AbstractPackets.AbstractPacket;
   
   public class Renamed7290 extends AbstractPacket
   {
      public var shooterId:String;
      
      public var projectionOnVerticalAxis:Number;
      
      public function Renamed7290(param1:String = "", param2:Number = 0)
      {
         super();
         this.shooterId = param1;
         this.projectionOnVerticalAxis = param2;
         addObjToAbsPacket(param1);
         addCodecToAbsPacket("scpacker.networking.protocol.codec.primitive.StringCodec");
         addObjToAbsPacket(param2);
         addCodecToAbsPacket("scpacker.networking.protocol.codec.primitive.FloatCodec");
      }
      
      override public function Implement(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.shooterId = param1 as String;
               break;
            case 1:
               this.projectionOnVerticalAxis = param1 as Number;
         }
      }
      
      override public function getReference() : AbstractPacket
      {
         return new Renamed7290();
      }
      
      override public function getCorrespondingModel() : int
      {
         return 50;
      }
      
      override public function getPacketId() : int
      {
         return -534192254;
      }
   }
}

