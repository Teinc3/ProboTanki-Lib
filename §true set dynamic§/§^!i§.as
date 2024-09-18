package §true set dynamic§
{
   import §&#;§.AbstractPacket;
   import projects.tanks.client.commons.models.layout.LayoutState;
   
   public class §^!i§ extends AbstractPacket
   {
      public var state:LayoutState;
      
      public function §^!i§(param1:LayoutState = null)
      {
         super();
         this.state = param1;
         §with catch with§(param1);
         §super for switch§("scpacker.networking.protocol.codec.custom.CodecLayoutState");
      }
      
      override public function §for const while§(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.state = param1 as LayoutState;
         }
      }
      
      override public function §4#w§() : AbstractPacket
      {
         return new §^!i§();
      }
      
      override public function §package package final§() : int
      {
         return 12;
      }
      
      override public function getPacketId() : int
      {
         return 1118835050;
      }
   }
}

