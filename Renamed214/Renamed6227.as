package Renamed214
{
   import AbstractPackets.AbstractPacket;
   import platform.client.fp10.core.resource.Resource;
   
   public class Renamed6226 extends AbstractPacket
   {
      public var text:String;
      
      public var sound:Resource;
      
      public function Renamed6226(param1:String = "", param2:Resource = null)
      {
         super();
         this.text = param1;
         this.sound = param2;
         addObjToAbsPacket(param1);
         addCodecToAbsPacket("scpacker.networking.protocol.codec.primitive.StringCodec");
         addObjToAbsPacket(param2);
         addCodecToAbsPacket("scpacker.networking.protocol.codec.custom.ResourceGetterCodec");
      }
      
      override public function Implement(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.text = param1 as String;
               break;
            case 1:
               this.sound = param1 as Resource;
         }
      }
      
      override public function getReference() : AbstractPacket
      {
         return new Renamed6226();
      }
      
      override public function getCorrespondingModel() : int
      {
         return 65;
      }
      
      override public function getPacketId() : int
      {
         return -666893269;
      }
   }
}

