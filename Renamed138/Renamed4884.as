package Renamed4292
{
   import AbstractPackets.AbstractPacket;
   
   public class Renamed4294 extends AbstractPacket
   {
      public var login:String;
      
      public var password:String;
      
      public function Renamed4294(param1:String = "", param2:String = "")
      {
         super();
         this.login = param1;
         this.password = param2;
         addObjToAbsPacket(param1);
         addCodecToAbsPacket("scpacker.networking.protocol.codec.primitive.StringCodec");
         addObjToAbsPacket(param2);
         addCodecToAbsPacket("scpacker.networking.protocol.codec.primitive.StringCodec");
      }
      
      override public function Implement(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.login = param1 as String;
               break;
            case 1:
               this.password = param1 as String;
         }
      }
      
      override public function getReference() : AbstractPacket
      {
         return new Renamed4294();
      }
      
      override public function getCorrespondingModel() : int
      {
         return 3;
      }
      
      override public function getPacketId() : int
      {
         return -87665118;
      }
   }
}

