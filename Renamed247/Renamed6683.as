package Renamed4426
{
   import Renamed189.AbstractPacket;
   import projects.tanks.client.users.model.friends.container.UserContainerCC;
   
   public class Renamed6683 extends AbstractPacket
   {
      public var friendsAccepted:UserContainerCC;
      
      public var friendsAcceptedNew:UserContainerCC;
      
      public var friendsIncoming:UserContainerCC;
      
      public var friendsIncomingNew:UserContainerCC;
      
      public var friendsOutgoing:UserContainerCC;
      
      public function Renamed6683(param1:UserContainerCC = null, param2:UserContainerCC = null, param3:UserContainerCC = null, param4:UserContainerCC = null, param5:UserContainerCC = null)
      {
         super();
         this.friendsAccepted = param1;
         this.friendsAcceptedNew = param2;
         this.friendsIncoming = param3;
         this.friendsIncomingNew = param4;
         this.friendsOutgoing = param5;
         Renamed1258(param1);
         Renamed4880("scpacker.networking.protocol.codec.custom.CodecUserContainerCC");
         Renamed1258(param2);
         Renamed4880("scpacker.networking.protocol.codec.custom.CodecUserContainerCC");
         Renamed1258(param3);
         Renamed4880("scpacker.networking.protocol.codec.custom.CodecUserContainerCC");
         Renamed1258(param4);
         Renamed4880("scpacker.networking.protocol.codec.custom.CodecUserContainerCC");
         Renamed1258(param5);
         Renamed4880("scpacker.networking.protocol.codec.custom.CodecUserContainerCC");
      }
      
      override public function Renamed4881(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.friendsAccepted = param1 as UserContainerCC;
               break;
            case 1:
               this.friendsAcceptedNew = param1 as UserContainerCC;
               break;
            case 2:
               this.friendsIncoming = param1 as UserContainerCC;
               break;
            case 3:
               this.friendsIncomingNew = param1 as UserContainerCC;
               break;
            case 4:
               this.friendsOutgoing = param1 as UserContainerCC;
         }
      }
      
      override public function Renamed4882() : AbstractPacket
      {
         return new Renamed6683();
      }
      
      override public function Renamed4883() : int
      {
         return 13;
      }
      
      override public function getPacketId() : int
      {
         return 1422563374;
      }
   }
}

