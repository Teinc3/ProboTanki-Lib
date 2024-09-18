package Renamed400
{
   import AbstractPackets.AbstractPacket;
   import Renamed349.TargetHitInfo;
   import Renamed82.Renamed8544;
   
   public class Renamed8545 extends AbstractPacket
   {
      public var shooter:String;
      
      public var state:Renamed8544;
      
      public var hit:TargetHitInfo;
      
      public function Renamed8545(param1:String = "", param2:Renamed8544 = null, param3:TargetHitInfo = null)
      {
         super();
         this.shooter = param1;
         this.state = param2;
         this.hit = param3;
         addObjToAbsPacket(param1);
         addCodecToAbsPacket("scpacker.networking.protocol.codec.primitive.StringCodec");
         addObjToAbsPacket(param2);
         addCodecToAbsPacket("scpacker.networking.protocol.codec.custom.CodecIsisState");
         addObjToAbsPacket(param3);
         addCodecToAbsPacket("scpacker.networking.protocol.codec.custom.CodecTargetHit");
      }
      
      override public function Implement(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.shooter = param1 as String;
               break;
            case 1:
               this.state = param1 as Renamed8544;
               break;
            case 2:
               this.hit = param1 as TargetHitInfo;
         }
      }
      
      override public function getReference() : AbstractPacket
      {
         return new Renamed8545();
      }
      
      override public function getCorrespondingModel() : int
      {
         return 55;
      }
      
      override public function getPacketId() : int
      {
         return 2001632000;
      }
   }
}

