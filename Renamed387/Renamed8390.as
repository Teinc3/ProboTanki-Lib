package Renamed387
{
   import Renamed189.AbstractPacket;
   import projects.tanks.client.panel.model.profile.userproperty.UserPropertyCC;
   
   public class Renamed8389 extends AbstractPacket
   {
      public var userPropertyCC:UserPropertyCC;
      
      public function Renamed8389(param1:UserPropertyCC = null)
      {
         super();
         this.userPropertyCC = param1;
         Renamed1258(param1);
         Renamed4880("scpacker.networking.protocol.codec.custom.CodecUserPropertyCC");
      }
      
      override public function Renamed4881(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.userPropertyCC = param1 as UserPropertyCC;
         }
      }
      
      override public function Renamed4882() : AbstractPacket
      {
         return new Renamed8389();
      }
      
      override public function Renamed4883() : int
      {
         return 10;
      }
      
      override public function getPacketId() : int
      {
         return 907073245;
      }
   }
}

