package §@"5§
{
   import §&#;§.AbstractPacket;
   
   public class §switch set break§ extends AbstractPacket
   {
      public var notificationEnabled:Boolean;
      
      public function §switch set break§(param1:Boolean = false)
      {
         super();
         this.notificationEnabled = param1;
         §with catch with§(param1);
         §super for switch§("scpacker.networking.protocol.codec.primitive.BooleanCodec");
      }
      
      override public function §for const while§(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.notificationEnabled = param1 as Boolean;
         }
      }
      
      override public function §4#w§() : AbstractPacket
      {
         return new §switch set break§();
      }
      
      override public function §package package final§() : int
      {
         return 23;
      }
      
      override public function getPacketId() : int
      {
         return 1447082276;
      }
   }
}

