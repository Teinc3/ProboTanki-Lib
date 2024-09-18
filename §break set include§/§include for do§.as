package §break set include§
{
   import §&#;§.AbstractPacket;
   
   public class §include for do§ extends AbstractPacket
   {
      public var rating:Number;
      
      public var place:int;
      
      public function §include for do§(param1:Number = 0, param2:int = 0)
      {
         super();
         this.rating = param1;
         this.place = param2;
         §with catch with§(param1);
         §super for switch§("scpacker.networking.protocol.codec.primitive.FloatCodec");
         §with catch with§(param2);
         §super for switch§("scpacker.networking.protocol.codec.primitive.IntCodec");
      }
      
      override public function §for const while§(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.rating = param1 as Number;
               break;
            case 1:
               this.place = param1 as int;
         }
      }
      
      override public function §4#w§() : AbstractPacket
      {
         return new §include for do§();
      }
      
      override public function §package package final§() : int
      {
         return 29;
      }
      
      override public function getPacketId() : int
      {
         return -1128606444;
      }
   }
}

