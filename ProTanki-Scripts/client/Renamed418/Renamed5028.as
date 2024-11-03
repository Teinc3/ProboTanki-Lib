package Renamed418
{
   import AbstractPackets.AbstractPacket;
   import Renamed461.Renamed2772;
   
   public class Renamed5028 extends AbstractPacket
   {
      public var Renamed6864:int;
      
      public var specificationId:int;
      
      public var moveCommand:Renamed2772;
      
      public function Renamed5028(param1:int = 0, param2:int = 0, param3:Renamed2772 = null)
      {
         super();
         this.Renamed6864 = param1;
         this.specificationId = param2;
         this.moveCommand = param3;
         addObjToAbsPacket(param1);
         addCodecToAbsPacket("scpacker.networking.protocol.codec.primitive.IntCodec");
         addObjToAbsPacket(param2);
         addCodecToAbsPacket("scpacker.networking.protocol.codec.primitive.ShortCodec");
         addObjToAbsPacket(param3);
         addCodecToAbsPacket("scpacker.networking.protocol.codec.custom.CodecMoveCommand");
      }
      
      override public function Implement(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.Renamed6864 = param1 as int;
               break;
            case 1:
               this.specificationId = param1 as int;
               break;
            case 2:
               this.moveCommand = param1 as Renamed2772;
         }
      }
      
      override public function getReference() : AbstractPacket
      {
         return new Renamed5028();
      }
      
      override public function getCorrespondingModel() : int
      {
         return 39;
      }
      
      override public function getPacketId() : int
      {
         return 329279865;
      }
   }
}

