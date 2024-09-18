package Renamed448
{
   import AbstractPackets.AbstractPacket;
   
   public class Renamed4253 extends AbstractPacket
   {
      public var message:String;
      
      public var Renamed2583:Boolean;
      
      public function Renamed4253(param1:String = "", param2:Boolean = false)
      {
         super();
         this.message = param1;
         this.Renamed2583 = param2;
         addObjToAbsPacket(param1);
         addCodecToAbsPacket("scpacker.networking.protocol.codec.primitive.StringCodec");
         addObjToAbsPacket(param2);
         addCodecToAbsPacket("scpacker.networking.protocol.codec.primitive.BooleanCodec");
      }
      
      override public function Implement(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.message = param1 as String;
               break;
            case 1:
               this.Renamed2583 = param1 as Boolean;
         }
      }
      
      override public function getReference() : AbstractPacket
      {
         return new Renamed4253();
      }
      
      override public function getCorrespondingModel() : int
      {
         return 61;
      }
      
      override public function getPacketId() : int
      {
         return 945463181;
      }
   }
}

