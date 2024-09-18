package §9"j§
{
   import §&#;§.AbstractPacket;
   
   public class §if for use§ extends AbstractPacket
   {
      public var projectionOnVerticalAxis:Number;
      
      public function §if for use§(param1:Number = 0)
      {
         super();
         this.projectionOnVerticalAxis = param1;
         §with catch with§(param1);
         §super for switch§("scpacker.networking.protocol.codec.primitive.FloatCodec");
      }
      
      override public function §for const while§(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.projectionOnVerticalAxis = param1 as Number;
         }
      }
      
      override public function §4#w§() : AbstractPacket
      {
         return new §if for use§();
      }
      
      override public function §package package final§() : int
      {
         return 50;
      }
      
      override public function getPacketId() : int
      {
         return 1224288585;
      }
   }
}

