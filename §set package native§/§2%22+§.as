package §set package native§
{
   import §&#;§.AbstractPacket;
   import §with const throw§.§^v§;
   
   public class §2"+§ extends AbstractPacket
   {
      public var tankId:String;
      
      public var rotateTurretCommand:§^v§;
      
      public function §2"+§(param1:String = "", param2:§^v§ = null)
      {
         super();
         this.tankId = param1;
         this.rotateTurretCommand = param2;
         §with catch with§(param1);
         §super for switch§("scpacker.networking.protocol.codec.primitive.StringCodec");
         §with catch with§(param2);
         §super for switch§("scpacker.networking.protocol.codec.custom.CodecRotateTurretCommand");
      }
      
      override public function §for const while§(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.tankId = param1 as String;
               break;
            case 1:
               this.rotateTurretCommand = param1 as §^v§;
         }
      }
      
      override public function §4#w§() : AbstractPacket
      {
         return new §2"+§();
      }
      
      override public function §package package final§() : int
      {
         return 39;
      }
      
      override public function getPacketId() : int
      {
         return 1927704181;
      }
   }
}

