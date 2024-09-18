package §while each§
{
   import §&#;§.AbstractPacket;
   
   public class §static package extends§ extends AbstractPacket
   {
      public var reasonForUser:String;
      
      public var minutes:int;
      
      public var hours:int;
      
      public var days:int;
      
      public function §static package extends§(param1:String = "", param2:int = 0, param3:int = 0, param4:int = 0)
      {
         super();
         this.reasonForUser = param1;
         this.minutes = param2;
         this.hours = param3;
         this.days = param4;
         §with catch with§(param1);
         §super for switch§("scpacker.networking.protocol.codec.primitive.StringCodec");
         §with catch with§(param2);
         §super for switch§("scpacker.networking.protocol.codec.primitive.IntCodec");
         §with catch with§(param3);
         §super for switch§("scpacker.networking.protocol.codec.primitive.IntCodec");
         §with catch with§(param4);
         §super for switch§("scpacker.networking.protocol.codec.primitive.IntCodec");
      }
      
      override public function §for const while§(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.reasonForUser = param1 as String;
               break;
            case 1:
               this.minutes = param1 as int;
               break;
            case 2:
               this.hours = param1 as int;
               break;
            case 3:
               this.days = param1 as int;
         }
      }
      
      override public function §4#w§() : AbstractPacket
      {
         return new §static package extends§();
      }
      
      override public function §package package final§() : int
      {
         return 7;
      }
      
      override public function getPacketId() : int
      {
         return 1200280053;
      }
   }
}

