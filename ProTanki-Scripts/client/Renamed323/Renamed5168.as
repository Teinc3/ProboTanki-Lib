package Renamed323
{
   import AbstractPackets.AbstractPacket;
   import projects.tanks.client.panel.model.battleinvite.ProtectionContexts1;
   
   public class Renamed5168 extends AbstractPacket
   {
      public var initParams:ProtectionContexts1;
      
      public function Renamed5168(param1:ProtectionContexts1 = null)
      {
         super();
         this.initParams = param1;
         addObjToAbsPacket(param1);
         addCodecToAbsPacket("scpacker.networking.protocol.codec.custom.CodecBattleInviteCC");
      }
      
      override public function Implement(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.initParams = param1 as ProtectionContexts1;
         }
      }
      
      override public function getReference() : AbstractPacket
      {
         return new Renamed5168();
      }
      
      override public function getCorrespondingModel() : int
      {
         return 15;
      }
      
      override public function getPacketId() : int
      {
         return 834877801;
      }
   }
}

