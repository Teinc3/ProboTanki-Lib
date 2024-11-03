package Renamed389
{
   import AbstractPackets.AbstractPacket;
   
   public class Renamed6874 extends AbstractPacket
   {
      public var shooter:String;
      
      public var shotDirectionX:int;
      
      public var shotDirectionY:int;
      
      public var shotDirectionZ:int;
      
      public function Renamed6874(param1:String = "", param2:int = 0, param3:int = 0, param4:int = 0)
      {
         super();
         this.shooter = param1;
         this.shotDirectionX = param2;
         this.shotDirectionY = param3;
         this.shotDirectionZ = param4;
         addObjToAbsPacket(param1);
         addCodecToAbsPacket("scpacker.networking.protocol.codec.primitive.StringCodec");
         addObjToAbsPacket(param2);
         addCodecToAbsPacket("scpacker.networking.protocol.codec.primitive.ShortCodec");
         addObjToAbsPacket(param3);
         addCodecToAbsPacket("scpacker.networking.protocol.codec.primitive.ShortCodec");
         addObjToAbsPacket(param4);
         addCodecToAbsPacket("scpacker.networking.protocol.codec.primitive.ShortCodec");
      }
      
      override public function Implement(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.shooter = param1 as String;
               break;
            case 1:
               this.shotDirectionX = param1 as int;
               break;
            case 2:
               this.shotDirectionY = param1 as int;
               break;
            case 3:
               this.shotDirectionZ = param1 as int;
         }
      }
      
      override public function getReference() : AbstractPacket
      {
         return new Renamed6874();
      }
      
      override public function getCorrespondingModel() : int
      {
         return 53;
      }
      
      override public function getPacketId() : int
      {
         return -118119523;
      }
   }
}

