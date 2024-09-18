package Renamed9348
{
   import Renamed189.AbstractPacket;
   import projects.tanks.client.battleservice.model.statistics.Renamed4207;
   
   public class Renamed9355 extends AbstractPacket
   {
      public var redUsers:Vector.<Renamed4207>;
      
      public var blueUsers:Vector.<Renamed4207>;
      
      public function Renamed9355(param1:Vector.<Renamed4207> = null, param2:Vector.<Renamed4207> = null)
      {
         super();
         this.redUsers = param1;
         this.blueUsers = param2;
         Renamed1258(param1);
         Renamed4880("scpacker.networking.protocol.codec.custom.VectorCodecUserStat");
         Renamed1258(param2);
         Renamed4880("scpacker.networking.protocol.codec.custom.VectorCodecUserStat");
      }
      
      override public function Renamed4881(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.redUsers = param1 as Vector.<Renamed4207>;
               break;
            case 1:
               this.blueUsers = param1 as Vector.<Renamed4207>;
         }
      }
      
      override public function Renamed4882() : AbstractPacket
      {
         return new Renamed9355();
      }
      
      override public function Renamed4883() : int
      {
         return 44;
      }
      
      override public function getPacketId() : int
      {
         return -1668779175;
      }
   }
}

