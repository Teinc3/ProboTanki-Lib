package §set package native§
{
   import §&#;§.AbstractPacket;
   import §with const throw§.§["R§;
   
   public class §each package try§ extends AbstractPacket
   {
      public var tankId:String;
      
      public var moveCommand:§["R§;
      
      public function §each package try§(param1:String = "", param2:§["R§ = null)
      {
         super();
         this.tankId = param1;
         this.moveCommand = param2;
         §with catch with§(param1);
         §super for switch§("scpacker.networking.protocol.codec.primitive.StringCodec");
         §with catch with§(param2);
         §super for switch§("scpacker.networking.protocol.codec.custom.CodecMoveCommand");
      }
      
      override public function §for const while§(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.tankId = param1 as String;
               break;
            case 1:
               this.moveCommand = param1 as §["R§;
         }
      }
      
      override public function §4#w§() : AbstractPacket
      {
         return new §each package try§();
      }
      
      override public function §package package final§() : int
      {
         return 39;
      }
      
      override public function getPacketId() : int
      {
         return -64696933;
      }
   }
}

