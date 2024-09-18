package §set package native§
{
   import §&#;§.AbstractPacket;
   import §with const throw§.§["R§;
   
   public class §8!o§ extends AbstractPacket
   {
      public var tankId:String;
      
      public var moveCommand:§["R§;
      
      public var turretDirection:Number;
      
      public function §8!o§(param1:String = "", param2:§["R§ = null, param3:Number = 0)
      {
         super();
         this.tankId = param1;
         this.moveCommand = param2;
         this.turretDirection = param3;
         §with catch with§(param1);
         §super for switch§("scpacker.networking.protocol.codec.primitive.StringCodec");
         §with catch with§(param2);
         §super for switch§("scpacker.networking.protocol.codec.custom.CodecMoveCommand");
         §with catch with§(param3);
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
               this.moveCommand = param1 as §["R§;
               break;
            case 2:
               this.turretDirection = param1 as Number;
         }
      }
      
      override public function §4#w§() : AbstractPacket
      {
         return new §8!o§();
      }
      
      override public function §package package final§() : int
      {
         return 39;
      }
      
      override public function getPacketId() : int
      {
         return 1516578027;
      }
   }
}

