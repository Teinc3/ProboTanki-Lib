package Renamed5934
{
   import AbstractPackets.AbstractPacket;
   import platform.client.fp10.core.resource.Resource;
   
   public class Renamed5939 extends AbstractPacket
   {
      public var image:Resource;
      
      public var bottomText:String;
      
      public var topText:String;
      
      public function Renamed5939(param1:Resource = null, param2:String = "", param3:String = "")
      {
         super();
         this.image = param1;
         this.bottomText = param2;
         this.topText = param3;
         addObjToAbsPacket(param1);
         addCodecToAbsPacket("scpacker.networking.protocol.codec.custom.ResourceGetterCodec");
         addObjToAbsPacket(param2);
         addCodecToAbsPacket("scpacker.networking.protocol.codec.primitive.StringCodec");
         addObjToAbsPacket(param3);
         addCodecToAbsPacket("scpacker.networking.protocol.codec.primitive.StringCodec");
      }
      
      override public function Implement(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.image = param1 as Resource;
               break;
            case 1:
               this.bottomText = param1 as String;
               break;
            case 2:
               this.topText = param1 as String;
         }
      }
      
      override public function getReference() : AbstractPacket
      {
         return new Renamed5939();
      }
      
      override public function getCorrespondingModel() : int
      {
         return 21;
      }
      
      override public function getPacketId() : int
      {
         return -875418096;
      }
   }
}

