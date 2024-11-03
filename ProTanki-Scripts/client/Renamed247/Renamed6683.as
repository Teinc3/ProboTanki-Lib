package Renamed4426
{
   import AbstractPackets.AbstractPacket;
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
         addObjToAbsPacket(param1);
         addCodecToAbsPacket("scpacker.networking.protocol.codec.custom.CodecUserContainerCC");
         addObjToAbsPacket(param2);
         addCodecToAbsPacket("scpacker.networking.protocol.codec.custom.CodecUserContainerCC");
         addObjToAbsPacket(param3);
         addCodecToAbsPacket("scpacker.networking.protocol.codec.custom.CodecUserContainerCC");
         addObjToAbsPacket(param4);
         addCodecToAbsPacket("scpacker.networking.protocol.codec.custom.CodecUserContainerCC");
         addObjToAbsPacket(param5);
         addCodecToAbsPacket("scpacker.networking.protocol.codec.custom.CodecUserContainerCC");
      }
      
      override public function Implement(param1:Object, param2:int) : void
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
      
      override public function getReference() : AbstractPacket
      {
         return new Renamed6683();
      }
      
      override public function getCorrespondingModel() : int
      {
         return 13;
      }
      
      override public function getPacketId() : int
      {
         return 1422563374;
      }
   }
}

