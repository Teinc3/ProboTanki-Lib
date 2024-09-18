package §set package native§
{
   import §&#;§.AbstractPacket;
   
   public class §class catch null§ extends AbstractPacket
   {
      public var tankId:String;
      
      public var temperature:Number;
      
      public function §class catch null§(param1:String = "", param2:Number = 0)
      {
         super();
         this.tankId = param1;
         this.temperature = param2;
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
               this.temperature = param1 as Number;
         }
      }
      
      override public function §4#w§() : AbstractPacket
      {
         return new §class catch null§();
      }
      
      override public function §package package final§() : int
      {
         return 39;
      }
      
      override public function getPacketId() : int
      {
         return 581377054;
      }
   }
}

