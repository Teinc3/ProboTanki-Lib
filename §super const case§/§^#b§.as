package §super const case§
{
   import §&#;§.AbstractPacket;
   
   public class §^#b§ extends AbstractPacket
   {
      public var pointId:int;
      
      public var progress:Number;
      
      public var progressSpeed:Number;
      
      public function §^#b§(param1:int = 0, param2:Number = 0, param3:Number = 0)
      {
         super();
         this.pointId = param1;
         this.progress = param2;
         this.progressSpeed = param3;
         §with catch with§(param1);
         §super for switch§("scpacker.networking.protocol.codec.primitive.IntCodec");
         §with catch with§(param2);
         §super for switch§("scpacker.networking.protocol.codec.primitive.FloatCodec");
         §with catch with§(param3);
         §super for switch§("scpacker.networking.protocol.codec.primitive.FloatCodec");
      }
      
      override public function §for const while§(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.pointId = param1 as int;
               break;
            case 1:
               this.progress = param1 as Number;
               break;
            case 2:
               this.progressSpeed = param1 as Number;
         }
      }
      
      override public function §4#w§() : AbstractPacket
      {
         return new §^#b§();
      }
      
      override public function §package package final§() : int
      {
         return 60;
      }
      
      override public function getPacketId() : int
      {
         return -2141998253;
      }
   }
}

