package §4"T§
{
   import §&#;§.AbstractPacket;
   import projects.tanks.client.users.model.friends.container.UserContainerCC;
   
   public class §0![§ extends AbstractPacket
   {
      public var friendsAccepted:UserContainerCC;
      
      public var friendsAcceptedNew:UserContainerCC;
      
      public var friendsIncoming:UserContainerCC;
      
      public var friendsIncomingNew:UserContainerCC;
      
      public var friendsOutgoing:UserContainerCC;
      
      public function §0![§(param1:UserContainerCC = null, param2:UserContainerCC = null, param3:UserContainerCC = null, param4:UserContainerCC = null, param5:UserContainerCC = null)
      {
         super();
         this.friendsAccepted = param1;
         this.friendsAcceptedNew = param2;
         this.friendsIncoming = param3;
         this.friendsIncomingNew = param4;
         this.friendsOutgoing = param5;
         §with catch with§(param1);
         §super for switch§("scpacker.networking.protocol.codec.custom.CodecUserContainerCC");
         §with catch with§(param2);
         §super for switch§("scpacker.networking.protocol.codec.custom.CodecUserContainerCC");
         §with catch with§(param3);
         §super for switch§("scpacker.networking.protocol.codec.custom.CodecUserContainerCC");
         §with catch with§(param4);
         §super for switch§("scpacker.networking.protocol.codec.custom.CodecUserContainerCC");
         §with catch with§(param5);
         §super for switch§("scpacker.networking.protocol.codec.custom.CodecUserContainerCC");
      }
      
      override public function §for const while§(param1:Object, param2:int) : void
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
      
      override public function §4#w§() : AbstractPacket
      {
         return new §0![§();
      }
      
      override public function §package package final§() : int
      {
         return 13;
      }
      
      override public function getPacketId() : int
      {
         return 1422563374;
      }
   }
}

