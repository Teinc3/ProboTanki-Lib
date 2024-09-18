package Renamed5645
{
   import AbstractPackets.AbstractPacket;
   
   public class Renamed5663 extends AbstractPacket
   {
      public var login:String;
      
      public var password:String;
      
      public var remember:Boolean;
      
      public function Renamed5663(param1:String = "", param2:String = "", param3:Boolean = false)
      {
         super();
         this.login = param1;
         this.password = param2;
         this.remember = param3;
         addObjToAbsPacket(param1);
         addCodecToAbsPacket("scpacker.networking.protocol.codec.primitive.StringCodec");
         addObjToAbsPacket(param2);
         addCodecToAbsPacket("scpacker.networking.protocol.codec.primitive.StringCodec");
         addObjToAbsPacket(param3);
         addCodecToAbsPacket("scpacker.networking.protocol.codec.primitive.BooleanCodec");
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
               break;
            case 2:
               this.remember = param1 as Boolean;
         }
      }
      
      override public function getReference() : AbstractPacket
      {
         return new Renamed5663();
      }
      
      override public function getCorrespondingModel() : int
      {
         return 0;
      }
      
      override public function getPacketId() : int
      {
         return -739684591;
      }
   }
}

