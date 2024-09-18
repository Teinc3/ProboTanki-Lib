package Renamed345
{
   import AbstractPackets.AbstractPacket;
   
   public class Renamed5800 extends AbstractPacket
   {
      public var Renamed6864:int;
      
      public var serverSessionTime:int;
      
      public function Renamed5800(param1:int = 0, param2:int = 0)
      {
         super();
         this.Renamed6864 = param1;
         this.serverSessionTime = param2;
         addObjToAbsPacket(param1);
         addCodecToAbsPacket("scpacker.networking.protocol.codec.primitive.IntCodec");
         addObjToAbsPacket(param2);
         addCodecToAbsPacket("scpacker.networking.protocol.codec.primitive.IntCodec");
      }
      
      override public function Implement(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.Renamed6864 = param1 as int;
               break;
            case 1:
               this.serverSessionTime = param1 as int;
         }
      }
      
      override public function getReference() : AbstractPacket
      {
         return new Renamed5800();
      }
      
      override public function getCorrespondingModel() : int
      {
         return 46;
      }
      
      override public function getPacketId() : int
      {
         return 2074243318;
      }
   }
}

