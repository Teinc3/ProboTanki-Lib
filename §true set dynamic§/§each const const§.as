package §true set dynamic§
{
   import §&#;§.AbstractPacket;
   import projects.tanks.client.commons.models.layout.LayoutState;
   
   public class §each const const§ extends AbstractPacket
   {
      public var origin:LayoutState;
      
      public var state:LayoutState;
      
      public function §each const const§(param1:LayoutState = null, param2:LayoutState = null)
      {
         super();
         this.origin = param1;
         this.state = param2;
         §with catch with§(param1);
         §super for switch§("scpacker.networking.protocol.codec.custom.CodecLayoutState");
         §with catch with§(param2);
         §super for switch§("scpacker.networking.protocol.codec.custom.CodecLayoutState");
      }
      
      override public function §for const while§(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.origin = param1 as LayoutState;
               break;
            case 1:
               this.state = param1 as LayoutState;
         }
      }
      
      override public function §4#w§() : AbstractPacket
      {
         return new §each const const§();
      }
      
      override public function §package package final§() : int
      {
         return 12;
      }
      
      override public function getPacketId() : int
      {
         return -593368100;
      }
   }
}

