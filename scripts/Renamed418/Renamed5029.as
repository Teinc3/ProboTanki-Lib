package Renamed418
{
   import AbstractPackets.AbstractPacket;
   import Renamed461.Renamed2773;
   
   public class Renamed5029 extends AbstractPacket
   {
      public var Renamed6864:int;
      
      public var rotateTurretCommand:Renamed2773;
      
      public var incarnationId:int;
      
      public function Renamed5029(param1:int = 0, param2:Renamed2773 = null, param3:int = 0)
      {
         super();
         this.Renamed6864 = param1;
         this.rotateTurretCommand = param2;
         this.incarnationId = param3;
         addObjToAbsPacket(param1);
         addCodecToAbsPacket("scpacker.networking.protocol.codec.primitive.IntCodec");
         addObjToAbsPacket(param2);
         addCodecToAbsPacket("scpacker.networking.protocol.codec.custom.CodecRotateTurretCommand");
         addObjToAbsPacket(param3);
         addCodecToAbsPacket("scpacker.networking.protocol.codec.primitive.ShortCodec");
      }
      
      override public function Implement(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.Renamed6864 = param1 as int;
               break;
            case 1:
               this.rotateTurretCommand = param1 as Renamed2773;
               break;
            case 2:
               this.incarnationId = param1 as int;
         }
      }
      
      override public function getReference() : AbstractPacket
      {
         return new Renamed5029();
      }
      
      override public function getCorrespondingModel() : int
      {
         return 39;
      }
      
      override public function getPacketId() : int
      {
         return -114968993;
      }
   }
}

