package §implements extends§
{
   import §&#;§.AbstractPacket;
   import projects.tanks.client.panel.model.profile.userproperty.UserPropertyCC;
   
   public class §["Y§ extends AbstractPacket
   {
      public var userPropertyCC:UserPropertyCC;
      
      public function §["Y§(param1:UserPropertyCC = null)
      {
         super();
         this.userPropertyCC = param1;
         §with catch with§(param1);
         §super for switch§("scpacker.networking.protocol.codec.custom.CodecUserPropertyCC");
      }
      
      override public function §for const while§(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.userPropertyCC = param1 as UserPropertyCC;
         }
      }
      
      override public function §4#w§() : AbstractPacket
      {
         return new §["Y§();
      }
      
      override public function §package package final§() : int
      {
         return 10;
      }
      
      override public function getPacketId() : int
      {
         return 907073245;
      }
   }
}

