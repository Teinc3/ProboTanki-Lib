package Renamed221
{
   import AbstractPackets.AbstractPacket;
   
   public class Renamed6281 extends AbstractPacket
   {
      public var wasShowAlertForFirstPurchasePremium:Boolean;
      
      public function Renamed6281(param1:Boolean = false)
      {
         super();
         this.wasShowAlertForFirstPurchasePremium = param1;
         addObjToAbsPacket(param1);
         addCodecToAbsPacket("scpacker.networking.protocol.codec.primitive.BooleanCodec");
      }
      
      override public function Implement(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.wasShowAlertForFirstPurchasePremium = param1 as Boolean;
         }
      }
      
      override public function getReference() : AbstractPacket
      {
         return new Renamed6281();
      }
      
      override public function getCorrespondingModel() : int
      {
         return 11;
      }
      
      override public function getPacketId() : int
      {
         return -478572181;
      }
   }
}

