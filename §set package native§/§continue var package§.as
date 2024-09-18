package §set package native§
{
   import §&#;§.AbstractPacket;
   
   public class §continue var package§ extends AbstractPacket
   {
      public var tankId:String;
      
      public var health:Number;
      
      public function §continue var package§(param1:String = "", param2:Number = 0)
      {
         super();
         this.tankId = param1;
         this.health = param2;
         §with catch with§(param1);
         §super for switch§("scpacker.networking.protocol.codec.primitive.StringCodec");
         §with catch with§(param2);
         §super for switch§("scpacker.networking.protocol.codec.primitive.FloatCodec");
      }
      
      override public function §for const while§(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.tankId = param1 as String;
               break;
            case 1:
               this.health = param1 as Number;
         }
      }
      
      override public function §4#w§() : AbstractPacket
      {
         return new §continue var package§();
      }
      
      override public function §package package final§() : int
      {
         return 39;
      }
      
      override public function getPacketId() : int
      {
         return -611961116;
      }
   }
}

