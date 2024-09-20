package Renamed406
{
   import AbstractPackets.AbstractPacket;
   
   public class HashPacket extends AbstractPacket
   {
      public var protectionData:Vector.<int>;
      
      public function HashPacket(param1:Vector.<int> = null)
      {
         super();
         this.protectionData = param1;
         addObjToAbsPacket(param1);
         addCodecToAbsPacket("scpacker.networking.protocol.codec.custom.VectorCodecByte");
      }
      
      override public function Implement(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.protectionData = param1 as Vector.<int>;
         }
      }
      
      override public function getReference() : AbstractPacket
      {
         return new HashPacket();
      }
      
      override public function getCorrespondingModel() : int
      {
         return 4; // NewEntranceModel
      }
      
      override public function getPacketId() : int
      {
         return 2001736388;
      }
   }
}

