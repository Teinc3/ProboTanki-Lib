package §[!X§
{
   import §&#;§.AbstractPacket;
   
   public class §throw package include§ extends AbstractPacket
   {
      public var flagId:int;
      
      public var tankId:String;
      
      public function §throw package include§(param1:int = 0, param2:String = "")
      {
         super();
         this.flagId = param1;
         this.tankId = param2;
         §with catch with§(param1);
         §super for switch§("scpacker.networking.protocol.codec.primitive.IntCodec");
         §with catch with§(param2);
         §super for switch§("scpacker.networking.protocol.codec.primitive.StringCodec");
      }
      
      override public function §for const while§(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.flagId = param1 as int;
               break;
            case 1:
               this.tankId = param1 as String;
         }
      }
      
      override public function §4#w§() : AbstractPacket
      {
         return new §throw package include§();
      }
      
      override public function §package package final§() : int
      {
         return 71;
      }
      
      override public function getPacketId() : int
      {
         return -325434725;
      }
   }
}

