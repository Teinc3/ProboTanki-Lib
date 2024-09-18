package §break set include§
{
   import §&#;§.AbstractPacket;
   
   public class §%"N§ extends AbstractPacket
   {
      public var score:int;
      
      public function §%"N§(param1:int = 0)
      {
         super();
         this.score = param1;
         §with catch with§(param1);
         §super for switch§("scpacker.networking.protocol.codec.primitive.IntCodec");
      }
      
      override public function §for const while§(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.score = param1 as int;
         }
      }
      
      override public function §4#w§() : AbstractPacket
      {
         return new §%"N§();
      }
      
      override public function §package package final§() : int
      {
         return 29;
      }
      
      override public function getPacketId() : int
      {
         return 2116086491;
      }
   }
}

