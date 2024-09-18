package Renamed7581
{
   import AbstractPackets.AbstractPacket;
   import projects.tanks.client.achievements.model.achievements.Renamed2072;
   
   public class Renamed7590 extends AbstractPacket
   {
      public var achievement:Renamed2072;
      
      public function Renamed7590(param1:Renamed2072 = null)
      {
         super();
         this.achievement = param1;
         addObjToAbsPacket(param1);
         addCodecToAbsPacket("scpacker.networking.protocol.codec.custom.CodecAchievement");
      }
      
      override public function Implement(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.achievement = param1 as Renamed2072;
         }
      }
      
      override public function getReference() : AbstractPacket
      {
         return new Renamed7590();
      }
      
      override public function getCorrespondingModel() : int
      {
         return 67;
      }
      
      override public function getPacketId() : int
      {
         return 579696867;
      }
   }
}

