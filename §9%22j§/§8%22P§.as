package §9"j§
{
   import §&#;§.AbstractPacket;
   
   public class §8"P§ extends AbstractPacket
   {
      public var shooterId:String;
      
      public var projectionOnVerticalAxis:Number;
      
      public function §8"P§(param1:String = "", param2:Number = 0)
      {
         super();
         this.shooterId = param1;
         this.projectionOnVerticalAxis = param2;
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
               this.shooterId = param1 as String;
               break;
            case 1:
               this.projectionOnVerticalAxis = param1 as Number;
         }
      }
      
      override public function §4#w§() : AbstractPacket
      {
         return new §8"P§();
      }
      
      override public function §package package final§() : int
      {
         return 50;
      }
      
      override public function getPacketId() : int
      {
         return -534192254;
      }
   }
}

